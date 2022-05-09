package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.ProductType;
import cn.edu.bjtu.toilet.domain.ModeResponse;
import cn.edu.bjtu.toilet.domain.ProductResponse;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ProductController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    private static final String UPLOAD_DIRECTORY = "/upload/product/";

    @Resource
    private ProductService productService;


    @RequestMapping("/")
    public String index(HttpServletRequest request){
        List<ToiletProductDTO> productDTOS = productService.queryAllProductList("");

        if (Objects.isNull(productDTOS)) {
            productDTOS = Lists.newArrayList();
        }
        request.setAttribute("productList", productDTOS);
        return INDEX;
    }

    @RequestMapping("/toProductPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        switch (url) {
            case "product_info":
                String productId = request.getParameter("product_id");
                ToiletProductDTO toiletProductDTO = productService.queryToiletById(productId);
                request.setAttribute("product", toiletProductDTO);
                break;
            case "product_results":
                String patternId = request.getParameter("patternId");

                List<ToiletProductDTO> productDTOS = productService.queryProductListByPattern(Integer.valueOf(patternId));
                request.setAttribute("productList", productDTOS);
                return INDEX;
            default:
                break;
        }
        url = PRODUCT_BASE + url;
        return url;
    }

    @RequestMapping("/company/product/entry")
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

    @RequestMapping("/company/pattern/entry")
    @ResponseBody
    public ModeResponse patternEntry(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                return ModeResponse.failed("resolve params error");
            }

            ToiletPatternDTO toiletPatternDTO = buildPatternDTO(params);
            toiletPatternDTO.setSource(request.getSession().getAttribute("uId").toString());
            toiletPatternDTO = productService.savePattern(toiletPatternDTO);
            if (Objects.isNull(toiletPatternDTO)) {
                return ModeResponse.failed("save pattern failed");
            }
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save pattern error with {}", e.getMessage());
            return ModeResponse.failed(e.getMessage());
        } catch (Exception e) {
            LOG.error("upload products failed");
            return ModeResponse.failed("保存失败！");
        }
        return ModeResponse.success();
    }

    @RequestMapping(value = "/company/product/modes/get")
    @ResponseBody
    public ModeResponse getModes(HttpServletRequest request) {
        ModeResponse response = new ModeResponse();
        try {
            List<ToiletPatternDTO> patternDTOS = productService.queryAllPattern();

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
            Map<String, ToiletPatternDTO> patternDTOMap = patternDTOS.stream().collect(Collectors.toMap(ToiletPatternDTO::getPatternType, e -> e));
            response.setSuccess(true);
            response.setSelectMap(selectMap);
            response.setPatternDTOMap(patternDTOMap);
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("get modes error with {}", e.getMessage());
            return ModeResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping("/product/sort")
    public String sortProduct(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (Objects.isNull(params)) {
                return ERROR_PAGE;
            }
            List<ToiletProductDTO> productDTOS = JSON.parseArray(params.get("list"), ToiletProductDTO.class);

            if (CollectionUtils.isEmpty(productDTOS)) {
                return ERROR_PAGE;
            }

            switch (params.get("sortBy")) {
                case "price":
                    productDTOS = productDTOS.stream().sorted((Comparator.comparing(o -> o.getProductParameters().getPrice()))).collect(Collectors.toList());
                    break;
                case "cleanCycle":
                    productDTOS = productDTOS.stream().sorted((Comparator.comparing(o -> Integer.valueOf(o.getProductParameters().getCleanupCycle())))).collect(Collectors.toList());
                    break;
                case "life":
                    productDTOS = productDTOS.stream().sorted((Comparator.comparing(o -> Integer.valueOf(o.getProductParameters().getServiceLife())))).collect(Collectors.toList());
                    break;
                default:
                    break;
            }

            if (params.get("desc").equals("true")) {
                Collections.reverse(productDTOS);
            }

            request.setAttribute("sort_condition", params.get("sortBy"));
            request.setAttribute("sort_way", params.get("desc"));

            request.setAttribute("productList", productDTOS);
        } catch (Exception e) {
            LOG.error("upload products failed");
        }
        return INDEX;
    }

    private ToiletPatternDTO buildPatternDTO(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = new ToiletPatternDTO();

        toiletPatternDTO.setProductType(params.get("productType"));
        toiletPatternDTO.setPatternType(params.get("patternType").substring(1));
        toiletPatternDTO.setPatternInfo(params.get("patternInfo"));

        // 自然环境条件
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        // TODO 前端传过来数据有逗号
        envConditionsDTO.setTemperature(params.get("natureTemp").substring(1));
        envConditionsDTO.setTerrain(params.get("terrain").substring(1));
        envConditionsDTO.setWaterResource(params.get("water").substring(1));
        envConditionsDTO.setGeolocation(params.get("geolocation").substring(1));
        envConditionsDTO.setEcotope(params.get("ecotope").substring(1));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //人文因素
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density").substring(1));
        humanFactorsDTO.setUsageHabits(params.get("usageHabits"));

        toiletPatternDTO.setHumanFactors(humanFactorsDTO);

        //管网
        PipNetworkConditionsDTO pipNetworkConditionsDTO = new PipNetworkConditionsDTO();
        pipNetworkConditionsDTO.setHasSewageTreatment(params.get("sewageTreatment").equals("是"));
        pipNetworkConditionsDTO.setHasSewerLines(params.get("sewerLines").equals("是"));

        toiletPatternDTO.setPipNetworkConditions(pipNetworkConditionsDTO);

        //资源
        ResourceUtilizationDTO resourceUtilizationDTO = new ResourceUtilizationDTO();
        resourceUtilizationDTO.setIsBiogasUtilization(params.get("biogasUtilization").equals("是"));
        resourceUtilizationDTO.setMixedSewageTreatment(params.get("mixedTreatment").substring(1));
        resourceUtilizationDTO.setOtherTreatment(params.get("otherTreatment").equals("是"));
        toiletPatternDTO.setResourceUtilization(resourceUtilizationDTO);

        return toiletPatternDTO;
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
        productDTO.setApplicableProvince(params.get("provinces"));
        productDTO.setApplicableTemperature(params.get("temperature"));
        productDTO.setPurpose(params.get("purpose"));
        productDTO.setProductFeatures(params.get("features"));

        productDTO.setQualityAssuranceMaterialsFilePath(params.get("qualityMaterial"));
        productDTO.setInstructionFilePath(params.get("introductions"));
        productDTO.setPicsPath(buildPicsPath(params));


        //  产品参数
        ProductParamsDTO paramsDTO = new ProductParamsDTO();
        paramsDTO.setStandard(Double.valueOf(params.get("standard")));
        paramsDTO.setApplicableNum(Integer.valueOf(params.get("applicableNum")));
        paramsDTO.setTexture(params.get("texture"));
        paramsDTO.setColor(params.get("color"));
        paramsDTO.setParamPurpose(params.get("paramPurpose")); // 具体参数
        paramsDTO.setCleanupCycle(params.get("cleanupCycle"));
        paramsDTO.setRunCost(params.get("runningCost"));
        paramsDTO.setPrice(Double.valueOf(params.get("price")));
        paramsDTO.setServiceLife(params.get("serviceLife"));
        paramsDTO.setLength(params.get("length"));
        paramsDTO.setWide(params.get("wide"));
        paramsDTO.setHigh(params.get("high"));
        paramsDTO.setApplyCase(params.get("case"));
        paramsDTO.setOtherParams(params.get("otherParams"));
        if (!StringUtils.isEmpty(params.get("weight"))) {
            paramsDTO.setWeight(Double.valueOf(params.get("weight")));
        }
        if (!StringUtils.isEmpty(params.get("thickness"))) {
            paramsDTO.setWallThickness(Double.valueOf(params.get("thickness")));
        }
        productDTO.setPurpose(params.get("toiletPurpose"));// "公厕等"
        productDTO.setApplicableCondition(params.get("applicableCondition"));
        productDTO.setSpecialParam(params.get("specialParam"));
        productDTO.setProductTheory(params.get("productTheory"));


        productDTO.setProductParameters(paramsDTO);

        return productDTO;
    }

    private String buildPicsPath(Map<String, String> params) {
        List<String> picsPathKey = Lists.newArrayList("pics1", "pics2", "pics3", "pics4");

        List<String> picsPath = picsPathKey.stream().filter(e -> !StringUtils.isEmpty(params.get(e))).map(params::get).collect(Collectors.toList());

        if (CollectionUtils.isEmpty(picsPath)) {
            throw new ToiletBizException("上传图片不能为空！", -1);
        }

        return StringUtils.join(picsPath, ";");
    }

}
