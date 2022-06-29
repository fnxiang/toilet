package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.domain.response.ProfessorResponse;
import cn.edu.bjtu.toilet.service.*;
import cn.edu.bjtu.toilet.service.request.AccountRequest;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.MANAGE_BASE;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private UserService userService;

    @Resource
    private CompanyService companyService;

    @Resource
    private PatternService patternService;

    @Resource
    private StatusCheckService statusCheckService;

    @Resource
    private AuditService auditService;

    @RequestMapping(value = "/assign")
    @ResponseBody
    public CommandResponse assign(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId =  params.get("productId");
            String patternId =  params.get("patternId");
            String professorEmail = params.get("professorEmail");
            UserDO userDO = userService.queryUserByEmail(professorEmail);

            if (StringUtils.isEmpty(patternId)) {
                ToiletProductDTO productDTO = productService.queryToiletById(productId);
                productDTO.setProfessorId(userDO.getId());
                productDTO.setProfessorEmail(professorEmail);
                statusCheckService.transformProductToStatus(productDTO, AuditStatus.WAITED_PROFESSOR);

                productService.updateProduct(productDTO);
            } else {
                ToiletPatternDTO patternDTO = patternService.queryPatternById(patternId);
                patternDTO.setProfessorId(userDO.getId());
                patternDTO.setProfessorEmail(professorEmail);
                statusCheckService.transformPatternToStatus(patternDTO, AuditStatus.WAITED_PROFESSOR);

                patternService.updatePattern(patternDTO);
            }

            response.setSuccess(true);

        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping(value = "/user/approve")
    @ResponseBody
    public CommandResponse approveUser(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            if (params.size() == 0) {
                return CommandResponse.failed("请求参数错误");
            }

            String userEmail = params.get("userEmail");
            Integer roleCode = Integer.valueOf(params.get("roleCode"));

            UserRole role = UserRole.codeOf(roleCode);


            if (role.equals(UserRole.PROFESSOR)) {
                UserDO userDO = userService.queryUserByEmail(userEmail);
                userDO.setStatus(UserStatus.ALLOWED.getCode());
                userService.saveProfessorUser(userDO);
            } else {
                CompanyDO companyDO = companyService.queryCompanyByEmail(userEmail);
                companyDO.setStatus(UserStatus.ALLOWED.getCode());
                companyService.saveCompany(companyDO);
            }

        } catch (ToiletBizException | ToiletSystemException e) {
            return CommandResponse.failed(e.getMessage());
        } catch (Exception e) {
            return CommandResponse.failed("Error happened :(");
        }

        return CommandResponse.success();
    }

    @RequestMapping(value = "/user/deny")
    @ResponseBody
    public CommandResponse denyUser(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            if (params.size() == 0) {
                return CommandResponse.failed("请求参数不能为空");
            }

            String userEmail = params.get("userEmail");
            Integer roleCode = Integer.valueOf(params.get("roleCode"));

            UserRole role = UserRole.codeOf(roleCode);


            if (role.equals(UserRole.PROFESSOR)) {
                UserDO userDO = userService.queryUserByEmail(userEmail);
                userDO.setStatus(UserStatus.WAIT_APPROVE.getCode());
                userService.saveProfessorUser(userDO);
            } else {
                CompanyDO companyDO = companyService.queryCompanyByEmail(userEmail);
                companyDO.setStatus(UserStatus.WAIT_APPROVE.getCode());
                companyService.saveCompany(companyDO);
            }
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @ExceptionHandler
    @RequestMapping(value = "/account/assign")
    @ResponseBody
    public CommandResponse assignAccount(HttpServletRequest request) throws Exception {
        Map<String, String> params = ParameterUtil.resolveParams(request);
        AccountRequest accountRequest = buildAccountReq(params);

        if (accountRequest.getRole().equals(UserRole.ADMIN.getRole()) || accountRequest.getRole().equals(UserRole.PROFESSOR.getRole())) {
            ProfessorRegisterRequest professorRegisterRequest = buildProfessorReq(accountRequest);
            userService.saveProfessorUser(professorRegisterRequest);
        } else if (accountRequest.getRole().equals(UserRole.COMPANY_USER.getRole())) {
            CompanyRegisterRequest companyRegisterRequest = buildCompanyReq(accountRequest);
            companyService.registerCompany(companyRegisterRequest);
        } else {
            return CommandResponse.failed("用户角色错误");
        }

        return CommandResponse.success();
    }

    @RequestMapping(value = "/product/audit")
    @ResponseBody
    public ProfessorResponse auditProduct(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            ApprovalRequest approvalRequest = buildProductAuditRequest(params, request);
            auditService.updateProductApproval(approvalRequest);
        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    private ApprovalRequest buildProductAuditRequest(Map<String, String> params, HttpServletRequest request) {
        String auditStatus = params.get("auditStatus");
        String comment = params.get("comment");
        String productId = params.get("productId");
        ApprovalRequest approvalRequest = new ApprovalRequest();
        approvalRequest.setProfessorEmail(request.getSession().getAttribute("uId").toString());
        approvalRequest.setComment(comment);
        approvalRequest.setProductId(productId);
        approvalRequest.setStatus(AuditStatus.ofName(auditStatus));
        return approvalRequest;
    }

    @RequestMapping(value = "/pattern/audit")
    @ResponseBody
    public ProfessorResponse auditPattern(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            ApprovalRequest approvalRequest = buildPatternAuditRequest(params);
            auditService.updatePatternApproval(approvalRequest);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    private ApprovalRequest buildPatternAuditRequest(Map<String, String> params) {
        String auditStatus = params.get("auditStatus");
        String comment = params.get("comment");
        String patternId = params.get("patternId");
        ToiletPatternDTO patternDTO = patternService.queryPatternById(patternId);
        ApprovalRequest approvalRequest = new ApprovalRequest();
        approvalRequest.setProfessorEmail(patternDTO.getProfessorEmail());
        approvalRequest.setComment(comment);
        approvalRequest.setPatternId(patternId);
        approvalRequest.setStatus(AuditStatus.ofName(auditStatus));
        return approvalRequest;
    }

    @RequestMapping(value = "/product/delete")
    @ResponseBody
    public CommandResponse deleteProduct(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId =  params.get("productId");
            productService.deleteProduct(productId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping(value = "/pattern/delete")
    @ResponseBody
    public CommandResponse deletePattern(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId =  params.get("patternId");
            patternService.deletePattern(productId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/professor/delete")
    @ResponseBody
    public CommandResponse deleteProfessor(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String professorId =  params.get("professorId");
            userService.deleteUserById(professorId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping(value = "/company/delete")
    @ResponseBody
    public CommandResponse deleteCompany(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String companyId =  params.get("companyId");
            companyService.deleteCompany(companyId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping(value = "/pwd/update")
    @ResponseBody
    public CommandResponse updatePwd(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String email = request.getSession().getAttribute("uId").toString();

            UserUpdateRequest updateRequest = buildUpdateRequest(params);
            updateRequest.setEmail(email);
            userService.updatePassword(updateRequest);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }


    @RequestMapping("/toPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        String email = request.getSession().getAttribute("uId").toString();
        String productId = request.getParameter("productId");
        switch (url){
            case "admin_back1":
            case "admin_back2":
                List<UserDO> users = userService.queryAllUser(UserRole.PROFESSOR);
                List<CompanyDTO> companyDOS = companyService.queryAllCompany();

                request.setAttribute("profList", users);
                request.setAttribute("companyList", companyDOS);
                break;
            case "admin_back3":
                List<ToiletProductDTO> allList = productService.queryAllProductList("");
                request.setAttribute("productList", allList);
                break;
            case "admin_back4":
                PatternSortRequest sortRequest = buildPatternQueryRequest("");
                List<ToiletPatternDTO> patternDTOS = patternService.queryPatternWithStatus(sortRequest);
                request.setAttribute("patternList", patternDTOS);
                break;
            case "admin_back7":
                String queryEmail = request.getParameter("email");
                UserDO userDO = userService.queryUserByEmail(queryEmail);
                UserDTO userDTO = UserConverter.toUserDTO(userDO);
                request.setAttribute("user", userDTO);
                break;
            case "admin_back6":
            case "admin_back9":
                ToiletProductDTO productDTO = productService.queryToiletById(productId);
                CompanyDO company = companyService.queryCompanyByEmail(productDTO.getCompanyEmail());
                request.setAttribute("product", productDTO);
                request.setAttribute("company", CompanyConverter.toCompanyDTO(company));
                break;
            case "admin_back11":
                String  patternId = request.getParameter("patternId");
                ToiletPatternDTO patternDTO = patternService.queryPatternById(patternId);
                request.setAttribute("pattern", patternDTO);
                break;
            case "admin_back12":
                String queryCompanyEmail = request.getParameter("email");
                company = companyService.queryCompanyByEmail(queryCompanyEmail);
                request.setAttribute("company", company);
                break;
            case "admin_back13":
                patternId = request.getParameter("patternId");
                patternDTO = patternService.queryPatternById(patternId);
                ApprovalRequest approvalRequest = new ApprovalRequest();
                approvalRequest.setPatternId(patternId);
                ApprovalDTO approvalDTO = auditService.getApproval(approvalRequest);
                request.setAttribute("pattern", patternDTO);
                request.setAttribute("approval", approvalDTO);
                break;
            default:
                break;
        }

        url = MANAGE_BASE + url;
        return url;
    }

    private CompanyRegisterRequest buildCompanyReq(AccountRequest accountRequest) {
        CompanyRegisterRequest companyRegisterRequest = new CompanyRegisterRequest();
        companyRegisterRequest.setEmail(accountRequest.getAccount());
        companyRegisterRequest.setPassword(accountRequest.getPwd());
        companyRegisterRequest.setConfirmPassword(accountRequest.getPwd());
        companyRegisterRequest.setCreditCode("PLS AMEND");
        companyRegisterRequest.setUserRole(UserRole.COMPANY_USER);
        return companyRegisterRequest;
    }

    private ProfessorRegisterRequest buildProfessorReq(AccountRequest accountRequest) {
        ProfessorRegisterRequest professorRegisterRequest = new ProfessorRegisterRequest();
        professorRegisterRequest.setEmail(accountRequest.getAccount());
        professorRegisterRequest.setPassword(accountRequest.getPwd());
        professorRegisterRequest.setConfirmPassword(accountRequest.getPwd());
        professorRegisterRequest.setUserRole(UserRole.nameOf(accountRequest.getRole()));
        return professorRegisterRequest;
    }

    private UserUpdateRequest buildUpdateRequest(Map<String, String> params) {
        return UserUpdateRequest.builder()
                .originPassword(params.get("originPwd"))
                .password(params.get("pwd"))
                .confirmPassword(params.get("confirmPwd"))
                .build();
    }

    private PatternSortRequest buildPatternQueryRequest(String email) {
        PatternSortRequest sortRequest = new PatternSortRequest();
        sortRequest.setIsDesc(false);
        sortRequest.setSortBy("id");
        sortRequest.setPageSize(100);
        sortRequest.setAuditStatuses(Lists.newArrayList(AuditStatus.UNKNOWN, AuditStatus.WAITED, AuditStatus.WAITED_PROFESSOR, AuditStatus.APPROVAL, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
        sortRequest.setEmail(email);
        return sortRequest;
    }

    private AccountRequest buildAccountReq(Map<String, String> params) {
        AccountRequest accountRequest = new AccountRequest();
        accountRequest.setAccount(params.get("account"));
        accountRequest.setRole(params.get("role"));
        accountRequest.setPwd(params.get("pwd"));
        return accountRequest;
    }
}
