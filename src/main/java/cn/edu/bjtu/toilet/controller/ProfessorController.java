package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.ApprovalDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.domain.dto.UserDTO;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;
import cn.edu.bjtu.toilet.domain.response.ProductStatusResponse;
import cn.edu.bjtu.toilet.domain.response.ProfessorResponse;
import cn.edu.bjtu.toilet.service.*;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private UserService userService;

    @Resource
    private AuditService auditService;

    @Resource
    private ProductService productService;

    @Resource
    private PatternService patternService;

    @Resource
    private CompanyService companyService;

    @RequestMapping(value = "/product/audit")
    @ResponseBody
    public ProfessorResponse auditProduct(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String auditStatus = params.get("auditStatus");
            String comment = params.get("comment");
            String productId = params.get("productId");
            ApprovalRequest approvalRequest = new ApprovalRequest();
            approvalRequest.setProfessorEmail(request.getSession().getAttribute("uId").toString());
            approvalRequest.setComment(comment);
            approvalRequest.setProductId(productId);
            approvalRequest.setStatus(AuditStatus.ofName(auditStatus));
            auditService.updateProductApproval(approvalRequest);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    @RequestMapping(value = "/pattern/audit")
    @ResponseBody
    public ProfessorResponse auditPattern(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String auditStatus = params.get("auditStatus");
            String comment = params.get("comment");
            String patternId = params.get("patternId");
            ApprovalRequest approvalRequest = new ApprovalRequest();
            approvalRequest.setProfessorEmail(request.getSession().getAttribute("uId").toString());
            approvalRequest.setComment(comment);
            approvalRequest.setPatternId(patternId);
            approvalRequest.setStatus(AuditStatus.valueOf(auditStatus));
            auditService.updateProductApproval(approvalRequest);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    @RequestMapping(value = "/get")
    @ResponseBody
    public ProfessorResponse getProfessors(HttpServletRequest request) {
        ProfessorResponse response = new ProfessorResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            List<UserDO> userDOS;
            if (StringUtils.isEmpty(params.get("pEmail"))) {
                userDOS = userService.queryAllUser(UserRole.PROFESSOR);
            } else {
                userDOS = Lists.newArrayList(userService.queryUserByEmail(params.get("pEmail")));
            }

            response.setNameMap(userDOS.stream().collect(Collectors.toMap(UserDO::getEmail, UserDO::getName)));
            response.setSuccess(true);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/audit/status/get")
    @ResponseBody
    public ProductStatusResponse getAuditStatus(HttpServletRequest request) {
        ProductStatusResponse response = new ProductStatusResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            response.setSuccess(true);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProductStatusResponse.failed(e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/product/audit/info")
    public String getProductAuditInfo(HttpServletRequest request) {
        try {

            String productId = request.getParameter("productId");
            String email = request.getSession().getAttribute("uId").toString();

            ApprovalRequest approvalRequest = new ApprovalRequest();
            approvalRequest.setProductId(productId);
            approvalRequest.setProfessorEmail(email);
            ApprovalDTO approvalDTO = auditService.getApproval(approvalRequest);

            ToiletProductDTO productDTO = productService.queryToiletById(productId);

            request.setAttribute("product", productDTO);
            request.setAttribute("approval", approvalDTO);

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("get product audit info error with : {}", e.getMessage());
            return ERROR_PAGE;
        }

        return "/manage/professor_back5";
    }

    @RequestMapping(value = "/pwd/update")
    @ResponseBody
    public ProfessorResponse updatePwd(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String email = request.getSession().getAttribute("uId").toString();

            UserUpdateRequest updateRequest = buildUpdateRequest(params);
            updateRequest.setEmail(email);
            userService.updatePassword(updateRequest);
        } catch (Exception e) {
            LOG.error("update password error with {}", e.getMessage());
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    @RequestMapping(value = "/info/update")
    @ResponseBody
    public ProfessorResponse updateInfo(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            String email = request.getSession().getAttribute("uId").toString();

            UserDTO userDTO = UserConverter.buildProfessorInfo(params);
            userDTO.setEmail(email);
            userService.saveProfessorUser(userDTO);

        } catch (Exception e) {
            LOG.error("update password error with {}", e.getMessage());
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    private UserUpdateRequest buildUpdateRequest(Map<String, String> params) {
         return UserUpdateRequest.builder()
                    .originPassword(params.get("originPwd"))
                    .password(params.get("pwd"))
                    .confirmPassword(params.get("confirmPwd"))
                    .build();
    }

    @RequestMapping(value = "/index")
    public String getProducts(HttpServletRequest request) {
        try {
            String email = request.getSession().getAttribute("uId").toString();

            List<ToiletProductDTO> productDTOS = productService.queryProductListByProfessor(email);

            request.setAttribute("productList", productDTOS);


        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ERROR_PAGE;
        }
        return PROF_INDEX;
    }

    @RequestMapping("/toProfessorPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        String email = request.getSession().getAttribute("uId").toString();
        String productId = request.getParameter("productId");
        switch (url){
            // 详细信息 + 审核信息
            case "professor_back5":
                ToiletProductDTO productDTO = productService.queryToiletById(productId);
                CompanyDO company = companyService.queryCompanyByEmail(productDTO.getCompanyEmail());
                ApprovalRequest approvalRequest = new ApprovalRequest();
                approvalRequest.setProductId(productId);
                ApprovalDTO approvalDTO = auditService.getApproval(approvalRequest);
                request.setAttribute("approval", approvalDTO);
                request.setAttribute("product", productDTO);
                request.setAttribute("company", CompanyConverter.toCompanyDTO(company));
                break;
            case "professor_back3":
                UserDO userDO = userService.queryUserByEmail(email);
                userDO.setPassword("");
                request.setAttribute("user", userDO);
                break;
            case "professor_back2":
                // TODO
                PatternSortRequest sortRequest = buildPatternQueryRequest(email);
                List<ToiletPatternDTO> patternDTOS = patternService.queryPatternWithStatus(sortRequest);
                request.setAttribute("patternList", patternDTOS);
                break;
            default:
                break;
        }

        url = MANAGE_BASE + url;
        return url;
    }

    private PatternSortRequest buildPatternQueryRequest(String email) {
        PatternSortRequest sortRequest = new PatternSortRequest();
        sortRequest.setIsDesc(false);
        sortRequest.setSortBy("id");
        sortRequest.setPageSize(100);
        sortRequest.setAuditStatuses(Lists.newArrayList(AuditStatus.APPROVAL, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
        sortRequest.setEmail(email);
        return sortRequest;
    }
}
