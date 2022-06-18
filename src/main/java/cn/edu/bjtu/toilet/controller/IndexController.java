package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.domain.response.LoginResponse;
import cn.edu.bjtu.toilet.domain.request.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.domain.response.RegisterResponse;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.MailService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.service.request.ResetPasswordRequest;
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

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;
import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Controller
@MultipartConfig
public class IndexController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    private static final String UPLOAD_DIRECTORY = "/upload/company/";


    @Resource
    private CompanyService companyService;

    @Resource
    private UserService userService;

    @Resource
    private MailService mailService;

    /**
     * page handle
     */

    @RequestMapping(value = "/login/index")
    public String index() {
        return LOGIN_INDEX;
    }

    @RequestMapping(value = "/register_company")
    public String registerCompany() {
        return REGISTER_INDEX;
    }

    @RequestMapping(value = "/forget")
    public String findPassword() {
        return FORGET_INDEX;
    }

    @RequestMapping(value = "/register_professor")
    public String registerProfessor() {
        return PROF_REGISTER_INDEX;
    }

    @RequestMapping(value = "/toBasePage")
    public String toPage(HttpServletRequest request) {
        String url = request.getParameter("url");
        url = BASE + url;
        return url;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute("uId", "");
        request.getSession().setAttribute("role", "");
        return LOGIN_INDEX;
    }

    /**
     * request handle
     */

    @RequestMapping(value = "/login")
    @ResponseBody
    public LoginResponse login(HttpServletRequest request, HttpServletResponse response) {

        try {
            Map<String, String> params = resolveParams(request);
            CompanyDO company = companyService.checkCompany(params.get("accountId"), params.get("accountPwd"));
            UserDO userDO = userService.checkUser(params.get("accountId"), params.get("accountPwd"));
            UserRole userRole;
            Integer userStatusCode;
            if (company != null) {
                userRole = UserRole.codeOf(company.getRole());
                userStatusCode = company.getStatus();
            } else if (userDO != null) {
                userRole = UserRole.codeOf(userDO.getRole());
                userStatusCode = userDO.getStatus();
            } else {
                throw new ToiletBizException("邮箱或密码错误！", BIZ_ERROR);
            }

            UserStatus status = UserStatus.codeOf(userStatusCode);

            if (status == null || status.equals(UserStatus.FORBIDDEN)) {
                throw new ToiletBizException("用户状态错误或禁止登录！", BIZ_ERROR);
            }

            if (status.equals(UserStatus.WAIT_APPROVE)) {
                throw new ToiletBizException("该账号正在审核中！", BIZ_ERROR);
            }

            request.getSession().setAttribute("uId", params.get("accountId"));
            request.getSession().setAttribute("role", userRole.getRole());

            String forwardPath = "/toilet/" + userRole.getRole() + "/index";

            return LoginResponse.success(forwardPath);
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("IndexController login error! request: {}", e.getMessage());
            return LoginResponse.failed(e.getMessage());
        } catch (Exception exception) {
            LOG.error("IndexController login error! request: {}", exception.getMessage());
            return LoginResponse.failed("exception happened");
        }

    }

    @RequestMapping(value = "/health")
    @ResponseBody
    public String registerUser() {
        return "success";
    }

    @RequestMapping(value = "/register/company")
    @ResponseBody
    public RegisterResponse registerCompany(HttpServletRequest request, HttpServletResponse response) {

        try {
            CompanyRegisterRequest companyRegisterRequest = resolveRequestParams(request);
            ;
            if (Objects.isNull(companyRegisterRequest)
                    || StringUtils.isEmpty(companyRegisterRequest.getEmail())
                    || StringUtils.isEmpty(companyRegisterRequest.getPassword())) {
                return RegisterResponse.failed("params error!");
            }

            if (!mailService.verifyCode(companyRegisterRequest.getEmail(),companyRegisterRequest.getCode())) {
                return RegisterResponse.failed("验证码校验失败！");
            }

            CompanyDO companyDO = companyService.registerCompany(companyRegisterRequest);
            if (Objects.isNull(companyDO)) {
                return RegisterResponse.failed("register db error");
            }

            UserRole userRole = UserRole.codeOf(companyDO.getRole());

            request.getSession().setAttribute("uId", companyDO.getEmail());
            request.getSession().setAttribute("role", userRole.getRole());
        } catch (Exception e) {
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
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                LOG.error("params is empty!");
                return RegisterResponse.failed("参数不能为空");
            }

            ProfessorRegisterRequest registerRequest = UserConverter.buildProfRequest(params);

            if (!mailService.verifyCode(registerRequest.getEmail(),registerRequest.getCode())) {
                return RegisterResponse.failed("验证码校验失败！");
            }

            UserDO userDO = userService.saveProfessorUser(registerRequest);

            if (userDO == null) {
                return RegisterResponse.failed("register error");
            }

            UserRole userRole = UserRole.codeOf(userDO.getRole());

            request.getSession().setAttribute("uId", userDO.getEmail());
            request.getSession().setAttribute("role", userRole.getRole());

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("register failed! error: {}", e.getMessage());
            return RegisterResponse.failed(String.format("register failed! error: %s", e.getMessage()));
        } catch (Exception e) {
            LOG.error("register failed!");
            return RegisterResponse.failed("register failed!");
        }

        return RegisterResponse.success();
    }

    @RequestMapping("/pwd/reset")
    @ResponseBody
    public CommandResponse resetPassword(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            ResetPasswordRequest resetPasswordRequest = buildResetPassowrdRequest(params);
            CompanyDO companyDO = companyService.queryCompanyByEmail(resetPasswordRequest.getEmail());
            UserDO userDO = userService.queryUserByEmail(resetPasswordRequest.getEmail());


            if (!Objects.isNull(companyDO)) {
                companyService.resetCompanyPassword(resetPasswordRequest);
            } else if (!Objects.isNull(userDO)) {
                userService.resetUserPassword(resetPasswordRequest);
            } else {
                return CommandResponse.failed("User not found!");
            }
            return CommandResponse.success();
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("reset password failed! error: {}", e.getMessage());
            return CommandResponse.failed(String.format("register failed! error: %s", e.getMessage()));
        } catch (Exception e) {
            LOG.error("reset password failed!");
            return CommandResponse.failed("register failed!");
        }
    }

    private ResetPasswordRequest buildResetPassowrdRequest(Map<String, String> params) {
        ResetPasswordRequest resetPasswordRequest = new ResetPasswordRequest();
        resetPasswordRequest.setCode(params.get("code"));
        resetPasswordRequest.setEmail(params.get("requestEmail"));
        resetPasswordRequest.setPassword(params.get("pwd"));
        resetPasswordRequest.setConfirmPassword(params.get("confirmPwd"));
        return resetPasswordRequest;
    }

    private CompanyRegisterRequest resolveRegisterParams(Map<String, String> params) {

        CompanyRegisterRequest companyRegisterRequest = new CompanyRegisterRequest();
        companyRegisterRequest.setCompanyName(params.get("companyName"));
        companyRegisterRequest.setCreditCode(params.get("creditCode"));
        companyRegisterRequest.setEmail(params.get("email"));
        companyRegisterRequest.setCode(params.get("code"));
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

        if (CollectionUtils.isEmpty(address) || address.size() < 3) {
            return null;
        }

        enterpriseAddress.setProvince(address.get(0));
        enterpriseAddress.setCity(address.get(1));
        enterpriseAddress.setCountry(address.get(2));

        enterpriseAddress.setDetailAddress(detailAddress);

        companyRegisterRequest.setEnterpriseAddress(enterpriseAddress);
        companyRegisterRequest.setUserRole(UserRole.COMPANY_USER);

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
        String uploadPath = request.getServletContext().getRealPath(".") + File.separator + UPLOAD_DIRECTORY;

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
            if (item.isFormField()) {
                params.put(item.getFieldName(), decodeJsString(item.getString()));
            }
        }
        return params;
    }

}
