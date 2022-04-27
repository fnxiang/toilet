package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import cn.edu.bjtu.toilet.domain.LoginResponse;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.RegisterResponse;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
@MultipartConfig
public class IndexController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    private static final String UPLOAD_DIRECTORY = "/upload/company/";


    @Resource
    private CompanyService companyService;

    @Resource
    private UserService userService;

    /**
     * page handle
     * */

    @RequestMapping(value = "/login/index")
    public String index(){
        return LOGIN_INDEX;
    }

    @RequestMapping(value = "/register_company")
    public String registerCompany(){
        return REGISTER_INDEX;
    }


    @RequestMapping(value = "/register_professor")
    public String registerProfessor(){
        return PROF_REGISTER_INDEX;
    }

    @RequestMapping(value = "/toBasePage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = BASE + url;
        return url;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
       request.getSession().setAttribute("uId", "");
       request.getSession().setAttribute("role", "");
        return "/";
    }

    /**
     * request handle
     * */

    @RequestMapping(value = "/login")
    @ResponseBody
    public LoginResponse login(HttpServletRequest request, HttpServletResponse response){

        try {
            Map<String, String> params = resolveParams(request);
            Integer companyRoleCode = companyService.checkCompany(params.get("accountId"), params.get("accountPwd"));
            Integer userRoleCode = userService.checkUser(params.get("accountId"), params.get("accountPwd"));
            UserConstants userConstants = companyRoleCode==-1?UserConstants.codeOf(userRoleCode):UserConstants.codeOf(companyRoleCode);
            if (Objects.isNull(userConstants)) {
                return LoginResponse.failed("user role error");
            }

            request.getSession().setAttribute("uId", params.get("accountId"));
            request.getSession().setAttribute("role", userConstants.getRole());

            String forwardPath ="/toilet/"+userConstants.getRole() + "/index";

            return LoginResponse.success(forwardPath);
        }catch (Exception exception) {
            LOG.error("IndexController login error! request: {}", exception.getMessage());
            return LoginResponse.failed("exception happened");
        }

    }

    @RequestMapping(value = "/health")
    @ResponseBody
    public String registerUser(HttpServletRequest request, HttpServletResponse response){
        return "success";
    }

    @RequestMapping(value = "/register/company")
    @ResponseBody
    public RegisterResponse registerCompany(HttpServletRequest request, HttpServletResponse response) {

        try {
            CompanyRegisterRequest companyRegisterRequest =  resolveRequestParams(request);;
            if (Objects.isNull(companyRegisterRequest)
                    || StringUtils.isEmpty(companyRegisterRequest.getEmail())
                    || StringUtils.isEmpty(companyRegisterRequest.getPassword())) {
                return RegisterResponse.failed("params error!");
            }

            CompanyDO companyDO = companyService.registerCompany(companyRegisterRequest);
            if (Objects.isNull(companyDO)) {
                return RegisterResponse.failed("register db error");
            }

            UserConstants userConstants = UserConstants.codeOf(companyDO.getRole());

            if(Objects.isNull(userConstants)) {
                return RegisterResponse.failed("Error Role with user!");
            }
            request.getSession().setAttribute("uId", companyDO.getEmail());
            request.getSession().setAttribute("role",userConstants.getRole());
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "文件上传失败");
            return RegisterResponse.failed(e.getMessage());
        }

        return RegisterResponse.success();
    }

    @RequestMapping(value = "/register/professor")
    @ResponseBody
    public RegisterResponse registerProfessor(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, "");
            if (Objects.isNull(params)) {
                LOG.error("params is empty!");
                return RegisterResponse.failed("参数不能为空");
            }

            ProfessorRegisterRequest registerRequest = buildProfRequest(params);
            UserDO userDO = userService.saveProfessorUser(registerRequest);

            if (userDO == null) {
                return RegisterResponse.failed("register error");
            }

            UserConstants userConstants = UserConstants.codeOf(userDO.getRole());

            if (userConstants == null) {
                return RegisterResponse.failed(String.format("role code error, code: %s", userDO.getRole()));
            }

            request.getSession().setAttribute("uId", userDO.getEmail());
            request.getSession().setAttribute("role",userConstants.getRole());

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("register failed! error: {}", e.getMessage());
            return RegisterResponse.failed(String.format("register failed! error: %s", e.getMessage()));
        } catch (Exception e) {
            LOG.error("register failed!");
            return RegisterResponse.failed("register failed!");
        }

        return RegisterResponse.success();
    }

    private ProfessorRegisterRequest buildProfRequest(Map<String, String> params) {
        ProfessorRegisterRequest registerRequest = new ProfessorRegisterRequest();
        registerRequest.setUserName(params.get("userName"));
        registerRequest.setCompany(params.get("company"));
        registerRequest.setPosition(params.get("position"));
        registerRequest.setTitle(params.get("title"));
        registerRequest.setPhoneNum(params.get("phoneNum"));
        registerRequest.setPassword(params.get("password"));
        registerRequest.setConfirmPassword(params.get("confirmPassword"));
        registerRequest.setEmail(params.get("emailAddress"));
        return registerRequest;
    }

    private CompanyRegisterRequest resolveRegisterParams(Map<String, String> params) {

        CompanyRegisterRequest companyRegisterRequest = new CompanyRegisterRequest();
        companyRegisterRequest.setCompanyName(params.get("companyName"));
        companyRegisterRequest.setCreditCode(params.get("creditCode"));
        companyRegisterRequest.setEmail(params.get("email"));
        companyRegisterRequest.setWebAddress(params.get("webAddress"));
        companyRegisterRequest.setContactName(params.get("contactName"));
        companyRegisterRequest.setPhoneNumber(params.get("phoneNum"));
        companyRegisterRequest.setPassword(params.get("password"));
        companyRegisterRequest.setConfirmPassword(params.get("confirmPassword"));
        companyRegisterRequest.setFilePath(params.get("filePath"));

        EnterpriseAddressDTO enterpriseAddress = new EnterpriseAddressDTO();
        String companyAddress = params.get("companyAddress");
        String detailAddress = params.get("detailAddress");

        List<String> address = Lists.newArrayList(companyAddress.split(","));

        if (CollectionUtils.isEmpty(address) || address.size()<3) {
            return null;
        }

        enterpriseAddress.setProvince(address.get(0));
        enterpriseAddress.setCity(address.get(1));
        enterpriseAddress.setCountry(address.get(2));

        enterpriseAddress.setDetailAddress(detailAddress);

        companyRegisterRequest.setEnterpriseAddress(enterpriseAddress);
        companyRegisterRequest.setUserConstants(UserConstants.COMPANY_USER);

        return companyRegisterRequest;
    }

    private String decodeJsString(String value) throws UnsupportedEncodingException {
        return URLDecoder.decode(value, "UTF-8");
    }

    private CompanyRegisterRequest resolveRequestParams(HttpServletRequest request) throws Exception {
        Map<String, String> params = new HashMap<>();
        request.setCharacterEncoding("utf-8");
        Set<String> allowTypes = Sets.newHashSet("doc", "docx", "pdf", "jpg", "jpeg", "png");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List<FileItem> items = upload.parseRequest(request);
        String uploadPath = request.getServletContext().getRealPath(".")+File.separator+UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        System.out.println(uploadPath);
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdirs()) {
                return null;
            }
        }
        for (FileItem item : items) {
            if (item.isFormField()) {
                params.put(item.getFieldName(), decodeJsString(item.getString()));
            }

            if (!item.isFormField() && item.getName() != null && !item.getName().equals("file")) {
                String name = item.getName();
                String type = name.substring(name.lastIndexOf('.') + 1);

                if (!allowTypes.contains(type)) {
                   LOG.error("文件格式不支持");
                } else {
                    int start = name.lastIndexOf("\\");
                    String filename = name.substring(start + 1);
                    String filePath = uploadPath + "/" + filename;
                    String relativePath = UPLOAD_DIRECTORY + File.separator + filename;
                    File file = new File(filePath);
                    item.write(file);
                    params.put("filePath", relativePath);
                }
            }
        }
        return resolveRegisterParams(params);
    }

    private Map<String, String> resolveParams(HttpServletRequest request) throws FileUploadException, UnsupportedEncodingException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List<FileItem> items = upload.parseRequest(request);
        Map<String, String> params = new HashMap<>();

        for (FileItem item : items) {
            if(item.isFormField()) {
                params.put(item.getFieldName(), decodeJsString(item.getString()));
            }
        }
        return params;
    }

}
