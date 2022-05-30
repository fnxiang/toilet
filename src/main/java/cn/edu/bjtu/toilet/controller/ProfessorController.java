package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.domain.response.ProductStatusResponse;
import cn.edu.bjtu.toilet.domain.response.ProfessorResponse;
import cn.edu.bjtu.toilet.service.AuditService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
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

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.ERROR_PAGE;
import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.PROF_INDEX;

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

    @RequestMapping(value = "/product/audit")
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
            approvalRequest.setStatus(AuditStatus.valueOf(auditStatus));
            auditService.updateProductApproval(approvalRequest);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    @RequestMapping(value = "/pattern/audit")
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
            ApprovalDO approvalDO = auditService.getApproval(approvalRequest);

            ToiletProductDTO productDTO = productService.queryToiletById(productId);

            request.setAttribute("product", productDTO);
            request.setAttribute("approval", approvalDO);

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("get product audit info error with : {}", e.getMessage());
            return ERROR_PAGE;
        }

        return "/manage/professor_back5";
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
}
