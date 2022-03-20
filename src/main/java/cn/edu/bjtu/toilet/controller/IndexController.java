package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import cn.edu.bjtu.toilet.domain.LoginResponse;
import cn.edu.bjtu.toilet.domain.RegisterRequest;
import cn.edu.bjtu.toilet.domain.RegisterResponse;
import cn.edu.bjtu.toilet.service.UserService;
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
    private UserService userService;

    @Resource
    private UserDao userDao;

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

    /**
     * request handle
     * */

    @RequestMapping(value = "/login")
    @ResponseBody
    public LoginResponse login(HttpServletRequest request, HttpServletResponse response){

        try {
            Map<String, String> params = resolveParams(request);
            Integer roleCode = userService.checkUser(params.get("accountId"), params.get("accountPwd"));
            UserConstants userConstants = UserConstants.codeOf(roleCode);
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

    @RequestMapping(value = "/register/test")
    @ResponseBody
    public String registerUser(HttpServletRequest request, HttpServletResponse response){

        UserDO userDO = new UserDO();
        userDO.setEmail("1243@gmail.com");
        userDO.setPassword("1234");
        return userDao.insertUserDO(userDO);
    }

    @RequestMapping(value = "/register/company")
    @ResponseBody
    public RegisterResponse registerCompany(HttpServletRequest request, HttpServletResponse response) {

        try {
            RegisterRequest registerRequest =  resolveRequestParams(request);;
            if (Objects.isNull(registerRequest)
                    || StringUtils.isEmpty(registerRequest.getEmail())
                    || StringUtils.isEmpty(registerRequest.getPassword())) {
                return RegisterResponse.failed("params error!");
            }

            UserDO userDO = userService.registerUser(registerRequest);
            if (Objects.isNull(userDO)) {
                return RegisterResponse.failed("register db error");
            }

            UserConstants userConstants = UserConstants.codeOf(userDO.getRole());

            if(Objects.isNull(userConstants)) {
                return RegisterResponse.failed("Error Role with user!");
            }
            request.getSession().setAttribute("uId", userDO.getEmail());
            request.getSession().setAttribute("role",userConstants.getRole());
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "文件上传失败");
            return RegisterResponse.failed(e.getMessage());
        }

        return RegisterResponse.success();
    }

    private RegisterRequest resolveRegisterParams(Map<String, String> params) throws UnsupportedEncodingException {

        RegisterRequest registerRequest = new RegisterRequest();
        registerRequest.setCompanyName(params.get("companyName"));
        registerRequest.setCreditCode(params.get("creditCode"));
        registerRequest.setEmail(params.get("email"));
        registerRequest.setWebAddress(params.get("webAddress"));
        registerRequest.setContactName(params.get("contactName"));
        registerRequest.setPhoneNumber(params.get("phoneNum"));
        registerRequest.setPassword(params.get("password"));
        registerRequest.setConfirmPassword(params.get("confirmPassword"));
        registerRequest.setFilePath(params.get("filePath"));

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

        registerRequest.setEnterpriseAddress(enterpriseAddress);
        registerRequest.setUserConstants(UserConstants.COMPANY_USER);

        return registerRequest;
    }

    private String decodeJsString(String value) throws UnsupportedEncodingException {
        return URLDecoder.decode(value, "UTF-8");
    }

    private RegisterRequest resolveRequestParams(HttpServletRequest request) throws Exception {
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
