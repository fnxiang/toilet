package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.EnterpriseAddress;
import cn.edu.bjtu.toilet.domain.RegisterRequest;
import cn.edu.bjtu.toilet.domain.UploadFileResponse;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class IndexController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    public static final String UPLOAD_DIRECTORY = "upload/company/";


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
    public Boolean login(HttpServletRequest request, HttpServletResponse response){

        try {
            String id = request.getParameter("accountId");
            String pwd = request.getParameter("accountPwd");

            Integer roleCode = userService.checkUser(id, pwd);
            UserConstants userConstants = UserConstants.codeOf(roleCode);
            if (Objects.isNull(userConstants)) {
                return false;
            }

            request.getSession().setAttribute("uId", id);
            request.getSession().setAttribute("role", userConstants.getRole());
            return true;
        }catch (Exception exception) {
            LOG.error("IndexController login error! request: {}", request);
        }
        return false;
    }

    @RequestMapping(value = "/register/test")
    @ResponseBody
    public String registerUser(HttpServletRequest request, HttpServletResponse response){

        UserDO userDO = new UserDO();
        userDO.setEmail("1243@gmail.com");
        userDO.setPassword("1234");
        return userDao.insertUserDO(userDO);
    }

    @RequestMapping(value = "/register")
    public UploadFileResponse upload(HttpServletRequest request, HttpServletResponse response) {

        try {
            RegisterRequest registerRequest =  resolveRequestParams(request);;
            if (Objects.isNull(registerRequest)) {
                return UploadFileResponse.failed("params error!");
            }

            userService.registerUser(registerRequest);
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "文件上传失败");
            return UploadFileResponse.failed(e.getMessage());
        }

        return UploadFileResponse.success();
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

        EnterpriseAddress enterpriseAddress = new EnterpriseAddress();
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
            uploadDir.mkdir();
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
                    File file = new File(filePath);
                    item.write(file);
                    params.put("filePath", filePath);
                }
            }
        }
        return resolveRegisterParams(params);
    }


}
