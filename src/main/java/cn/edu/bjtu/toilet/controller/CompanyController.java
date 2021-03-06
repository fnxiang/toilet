package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.exception.ToiletBizException;
import cn.edu.bjtu.toilet.common.exception.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.domain.response.ModeResponse;
import cn.edu.bjtu.toilet.domain.response.ProductResponse;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.domain.vo.ResultVO;
import cn.edu.bjtu.toilet.service.AuditService;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.StatusCheckService;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/company")
public class CompanyController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private PatternService patternService;

    @Resource
    private AuditService auditService;

    @Resource
    private StatusCheckService statusCheckService;

    @RequestMapping("/product/entry")
    @ResponseBody
    public ProductResponse productEntry(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                return ProductResponse.failed("resolve params error");
            }
            ToiletPatternDTO toiletPatternDTO = null;
            ToiletProductDTO toiletProductDTO = buildProductDTO(params);
            if (toiletProductDTO.getIsNewPattern()) {
                toiletPatternDTO = buildPatternDTO(params);
            }

            toiletProductDTO.setCompanyEmail(request.getSession().getAttribute("uId").toString());
            toiletProductDTO = productService.saveProduct(toiletProductDTO, toiletPatternDTO);
            if (Objects.isNull(toiletProductDTO)) {
                return ProductResponse.failed("save product failed");
            }
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save product error with {}", e.getMessage());
            return ProductResponse.failed(e.getMessage());
        } catch (Exception e) {
            LOG.error("upload products failed : {}", e.getMessage());
            return ProductResponse.failed(e.getMessage());
        }
        return ProductResponse.success();
    }

    @ResponseBody
    @RequestMapping(value = "/product/update")
    public ResultVO updateProduct(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            ToiletProductDTO productDTO = buildUpdateProductDTO(params);
            productDTO.setCompanyEmail(request.getSession().getAttribute("uId").toString());

            checkProduct(productDTO);

            productService.updateProduct(productDTO);

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("update product error with {}", e.getMessage());
            return ResultVO.failed("update product error with " + e.getMessage());
        } catch (Exception e) {
            LOG.error("update products failed : {}", e.getStackTrace());
            return ResultVO.failed("update product error with " + e.getMessage());
        }

        return ResultVO.success();
    }

    @RequestMapping(value = "/product/audit/submit", method = RequestMethod.POST)
    @ResponseBody
    public ProductResponse submitProductAudit(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId = params.get("productId");
            String statusCode = params.get("statusCode");

            AuditStatus auditStatus = resolveStatus(statusCode);

            ToiletProductDTO productDTO = productService.queryToiletById(productId);

            statusCheckService.transformProductToStatus(productDTO, auditStatus);

            productDTO.setStatus(auditStatus);

            productService.updateProduct(productDTO);

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("update product error with {}", e.getMessage());
            return ProductResponse.failed("update product error with " + e.getMessage());
        } catch (Exception e) {
            LOG.error("update products failed : {}", e.getMessage());
            return ProductResponse.failed("update product error with " + e.getMessage());
        }

        return ProductResponse.success();
    }

    @RequestMapping(value = "/pattern/audit/submit", method = RequestMethod.POST)
    @ResponseBody
    public ProductResponse submitPatternAudit(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId = params.get("patternId");
            String statusCode = params.get("statusCode");

            AuditStatus auditStatus = resolveStatus(statusCode);

            ToiletPatternDTO patternDTO = patternService.queryPatternById(productId);

            statusCheckService.transformPatternToStatus(patternDTO, auditStatus);

            patternDTO.setStatus(auditStatus);

            patternService.updatePattern(patternDTO);

        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("update product error with {}", e.getMessage());
            return ProductResponse.failed("update product error with " + e.getMessage());
        } catch (Exception e) {
            LOG.error("update products failed : {}", e.getMessage());
            return ProductResponse.failed("update product error with " + e.getMessage());
        }

        return ProductResponse.success();
    }

    @RequestMapping(value = "/product/delete")
    @ResponseBody
    public CommandResponse deleteProduct(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            String email = request.getSession().getAttribute("uId").toString();
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId = params.get("productId");
            ToiletProductDTO productDTO = productService.queryToiletById(productId);
            if (!productDTO.getCompanyEmail().equals(email)) {
                return CommandResponse.failed("????????????!");
            }

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
            String email = request.getSession().getAttribute("uId").toString();
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId = params.get("patternId");
            ToiletPatternDTO patternDTO = patternService.queryPatternById(productId);

            if (!patternDTO.getEmail().equals(email)) {
                return CommandResponse.failed("????????????!");
            }
            patternService.deletePattern(productId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }
        return response;
    }

    private AuditStatus resolveStatus(String statusCode) {
        Integer code = Integer.decode(statusCode);

        AuditStatus status = AuditStatus.of(code);

        if (status.equals(AuditStatus.UNKNOWN)) {
            throw new ToiletBizException("?????????????????????", -1);
        }

        return status;
    }

    @RequestMapping(value = "/product/audit")
    public ProductResponse getProductAudit(HttpServletRequest request) {
        try {
            String productId = request.getParameter("productId");
            ApprovalRequest approvalRequest = new ApprovalRequest();
            approvalRequest.setProductId(productId);
            ApprovalDTO approvalDTO = auditService.getApproval(approvalRequest);

            request.setAttribute("approval", approvalDTO);
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("update product error with {}", e.getMessage());
            return ProductResponse.failed("update product error with " + e.getMessage());
        } catch (Exception e) {
            LOG.error("update products failed : {}", e.getStackTrace());
            return ProductResponse.failed("update product error with " + e.getMessage());
        }

        return ProductResponse.success();
    }

    @RequestMapping("/pattern/entry")
    @ResponseBody
    public ModeResponse patternEntry(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                return ModeResponse.failed("resolve params error");
            }

            ToiletPatternDTO toiletPatternDTO = buildPatternDTO(params);
            toiletPatternDTO.setStatus(AuditStatus.APPROVAL);
            toiletPatternDTO.setEmail(request.getSession().getAttribute("uId").toString());
            toiletPatternDTO = productService.savePattern(toiletPatternDTO);
            if (Objects.isNull(toiletPatternDTO)) {
                return ModeResponse.failed("save pattern failed");
            }
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save pattern error with {}", e.getMessage());
            return ModeResponse.failed(e.getMessage());
        } catch (Exception e) {
            LOG.error("upload products failed");
            return ModeResponse.failed("???????????????");
        }
        return ModeResponse.success();
    }

    @RequestMapping("/pattern/modify")
    @ResponseBody
    public ModeResponse patternModify(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                return ModeResponse.failed("resolve params error");
            }

            ToiletPatternDTO toiletPatternDTO = buildUpdatePatternDTO(params);
            toiletPatternDTO.setEmail(request.getSession().getAttribute("uId").toString());
            toiletPatternDTO = productService.savePattern(toiletPatternDTO);
            if (Objects.isNull(toiletPatternDTO)) {
                return ModeResponse.failed("save pattern failed");
            }
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save pattern error with {}", e.getMessage());
            return ModeResponse.failed(e.getMessage());
        } catch (Exception e) {
            LOG.error("upload products failed");
            return ModeResponse.failed("???????????????");
        }
        return ModeResponse.success();
    }

    private ToiletPatternDTO buildUpdatePatternDTO(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = patternService.queryPatternById(params.get("patternId"));

        // ??????????????????
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        envConditionsDTO.setTemperature(params.get("natureTemp"));
        envConditionsDTO.setTerrain(params.get("terrain"));
        envConditionsDTO.setWaterResource(params.get("water"));
        envConditionsDTO.setGeolocation(params.get("geolocation"));
        envConditionsDTO.setEcotope(params.get("ecotope"));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //????????????
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density"));
        humanFactorsDTO.setUsageHabits(params.get("usageHabits"));

        toiletPatternDTO.setHumanFactors(humanFactorsDTO);

        //??????
        PipNetworkConditionsDTO pipNetworkConditionsDTO = new PipNetworkConditionsDTO();
        pipNetworkConditionsDTO.setHasSewerLines(params.get("sewerLines").equals("???"));

        toiletPatternDTO.setPipNetworkConditions(pipNetworkConditionsDTO);

        //??????
        ResourceUtilizationDTO resourceUtilizationDTO = new ResourceUtilizationDTO();
        resourceUtilizationDTO.setIsBiogasUtilization(params.get("biogasUtilization").equals("???"));
        resourceUtilizationDTO.setMixedSewageTreatment(params.get("mixedTreatment"));
        resourceUtilizationDTO.setOtherTreatment(params.get("otherTreatment").equals("???"));
        toiletPatternDTO.setResourceUtilization(resourceUtilizationDTO);

        return toiletPatternDTO;
    }

    @RequestMapping(value = "/product/modes/get")
    @ResponseBody
    public ModeResponse getModes(HttpServletRequest request) {
        ModeResponse response = new ModeResponse();
        try {
            PatternSortRequest patternSortRequest = buildPatternQueryRequest();
            List<ToiletPatternDTO> patternDTOS = patternService.queryPatternWithStatus(patternSortRequest);

            if (CollectionUtils.isEmpty(patternDTOS)) {
                return ModeResponse.failed("pattern is empty!");
            }

            Map<String, List<String>> selectMap = new HashMap<>();

            patternDTOS.forEach(item -> {
                if (selectMap.get(item.getProductType()) == null) {
                    selectMap.put(item.getProductType(), Lists.newArrayList(item.getPatternType()));
                } else {
                    selectMap.get(item.getProductType()).add(item.getPatternType());
                }
            });
            response.setSuccess(true);
            response.setSelectMap(selectMap);
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("get modes error with {}", e.getMessage());
            return ModeResponse.failed(e.getMessage());
        }

        return response;
    }

    private PatternSortRequest buildPatternQueryRequest() {
        PatternSortRequest request = new PatternSortRequest();
        request.setAuditStatuses(Lists.newArrayList(AuditStatus.APPROVAL));
        request.setIsDesc(false);
        request.setSortBy("comprehensive_score");
        request.setPageSize(1000);
        return request;
    }

    private void checkProduct(ToiletProductDTO productDTO) {
        ToiletProductDTO productDTOFromDb = productService.queryToiletById(productDTO.getId().toString());

        if (!productDTO.getCompanyEmail().equals(productDTOFromDb.getCompanyEmail())) {
            throw new ToiletBizException("Can not update other's product!", -1);
        }

        productDTO.setStatus(productDTOFromDb.getStatus());
        productDTO.setProfessorEmail(productDTOFromDb.getProfessorEmail());
        productDTO.setProfessorId(productDTOFromDb.getProfessorId());

        // ???????????????????????????????????????????????????????????????????????????

        if (StringUtils.isEmpty(productDTO.getQualityAssuranceMaterialsFilePath())) {
            productDTO.setQualityAssuranceMaterialsFilePath(productDTOFromDb.getQualityAssuranceMaterialsFilePath());
        }

        if (StringUtils.isEmpty(productDTO.getInstructionFilePath())) {
            productDTO.setInstructionFilePath(productDTOFromDb.getInstructionFilePath());
        }

    }

    private ToiletPatternDTO buildPatternDTO(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = new ToiletPatternDTO();

        toiletPatternDTO.setProductType(params.get("productType"));
        toiletPatternDTO.setPatternType(params.get("patternType"));
        toiletPatternDTO.setPatternInfo(params.get("patternInfo"));

        // ??????????????????
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        envConditionsDTO.setTemperature(params.get("natureTemp"));
        envConditionsDTO.setTerrain(params.get("terrain"));
        envConditionsDTO.setWaterResource(params.get("water"));
        envConditionsDTO.setGeolocation(params.get("geolocation"));
        envConditionsDTO.setEcotope(params.get("ecotope"));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //????????????
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density"));
        humanFactorsDTO.setUsageHabits(params.get("usageHabits"));

        toiletPatternDTO.setHumanFactors(humanFactorsDTO);

        //??????
        PipNetworkConditionsDTO pipNetworkConditionsDTO = new PipNetworkConditionsDTO();
        pipNetworkConditionsDTO.setHasSewerLines(params.get("sewerLines").equals("???"));

        toiletPatternDTO.setPipNetworkConditions(pipNetworkConditionsDTO);

        //??????
        ResourceUtilizationDTO resourceUtilizationDTO = new ResourceUtilizationDTO();
        resourceUtilizationDTO.setIsBiogasUtilization(params.get("biogasUtilization").equals("???"));
        resourceUtilizationDTO.setMixedSewageTreatment(params.get("mixedTreatment"));
        resourceUtilizationDTO.setOtherTreatment(params.get("otherTreatment").equals("???"));
        toiletPatternDTO.setResourceUtilization(resourceUtilizationDTO);

        return toiletPatternDTO;
    }

    private ToiletProductDTO buildUpdateProductDTO(Map<String, String> params) {
        ToiletProductDTO productDTO = new ToiletProductDTO();
        productDTO.setId(Integer.valueOf(params.get("productId")));
        productDTO.setProductName(params.get("productName"));
        productDTO.setManufacturerName(params.get("factoryName"));
        productDTO.setManufacturerCell(params.get("factoryNum"));
        productDTO.setProductType(params.get("productType"));
        productDTO.setApplicableProvince(params.get("province"));
        productDTO.setApplicableTemperature(params.get("temperature"));
        productDTO.setPurpose(params.get("purpose"));
        productDTO.setProductFeatures(params.get("features"));

        productDTO.setQualityAssuranceMaterialsFilePath(params.get("qualityMaterial"));
        productDTO.setInstructionFilePath(params.get("introductions"));
        List<String> picPath = buildPicsPath(params);

        if (CollectionUtils.isEmpty(picPath)) {
            throw new ToiletBizException("???????????????????????????", -1);
        }
        productDTO.setPicsPath(StringUtils.join(picPath, ";"));

        productDTO.setPurpose(params.get("toiletPurpose"));// "?????????"
        productDTO.setApplicableCondition(params.get("applicableCondition"));
        productDTO.setSpecialParam(params.get("specialParam"));
        productDTO.setProductTheory(params.get("productTheory"));

        ProductParamsDTO productParamsDTO = buildProductParameter(params);

        productDTO.setProductParameters(productParamsDTO);

        return productDTO;
    }

    private ToiletProductDTO buildProductDTO(Map<String, String> params) {
        ToiletProductDTO productDTO = new ToiletProductDTO();
        productDTO.setProductName(params.get("productName"));
        productDTO.setManufacturerName(params.get("factoryName"));
        productDTO.setManufacturerCell(params.get("factoryNum"));
        productDTO.setProductType(params.get("productType"));
        productDTO.setPatternType(params.get("patternType").substring(1));
        productDTO.setPatternName(params.get("patternName"));
        productDTO.setIsNewPattern(params.get("newmoderadios1").equals("true"));
        productDTO.setApplicableProvince(params.get("province"));
        productDTO.setApplicableTemperature(params.get("temperature"));
        productDTO.setPurpose(params.get("purpose"));
        productDTO.setProductFeatures(params.get("features"));

        productDTO.setQualityAssuranceMaterialsFilePath(params.get("qualityMaterial"));
        productDTO.setInstructionFilePath(params.get("introductions"));
        List<String> picPath = buildPicsPath(params);

        if (CollectionUtils.isEmpty(picPath)) {
            throw new ToiletBizException("???????????????????????????", -1);
        }
        productDTO.setPicsPath(StringUtils.join(picPath, ";"));
        productDTO.setPurpose(params.get("toiletPurpose"));// "?????????"
        productDTO.setApplicableCondition(params.get("applicableCondition"));
        productDTO.setSpecialParam(params.get("specialParam"));
        productDTO.setProductTheory(params.get("productTheory"));

        ProductParamsDTO productParamsDTO = buildProductParameter(params);
        productDTO.setProductParameters(productParamsDTO);

        return productDTO;
    }

    private ProductParamsDTO buildProductParameter(Map<String, String> params) {
        //  ????????????
        ProductParamsDTO paramsDTO = new ProductParamsDTO();
        paramsDTO.setStandard(Double.valueOf(params.get("standard")));
        paramsDTO.setApplicableNum(Integer.valueOf(params.get("applicableNum")));
        paramsDTO.setTexture(params.get("texture"));
        paramsDTO.setColor(params.get("color"));
        paramsDTO.setParamPurpose(params.get("paramPurpose")); // ????????????
        paramsDTO.setCleanupCycle(params.get("cleanupCycle"));
        paramsDTO.setRunCost(params.get("runningCost"));
        paramsDTO.setPrice(Double.valueOf(params.get("price")));
        paramsDTO.setServiceLife(params.get("serviceLife"));
        paramsDTO.setLength(params.get("length"));
        paramsDTO.setWide(params.get("wide"));
        paramsDTO.setHigh(params.get("high"));
        paramsDTO.setApplyCase(params.get("case"));
        paramsDTO.setOtherParams(params.get("otherParams"));
        if (!StringUtils.isEmpty(params.get("weight")) && !params.get("weight").equals("null")) {
            paramsDTO.setWeight(Double.valueOf(params.get("weight")));
        }
        if (!StringUtils.isEmpty(params.get("thickness")) && !params.get("thickness").equals("null")) {
            paramsDTO.setWallThickness(Double.valueOf(params.get("thickness")));
        }
        return paramsDTO;
    }

    private List<String> buildPicsPath(Map<String, String> params) {
        List<String> picsPathKey = Lists.newArrayList("pics1", "pics2", "pics3", "pics4");

        return picsPathKey.stream().filter(e -> !StringUtils.isEmpty(params.get(e))).map(params::get).collect(Collectors.toList());
    }

}
