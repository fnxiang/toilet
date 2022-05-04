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
import com.google.common.collect.Maps;
import org.apache.commons.collections4.CollectionUtils;
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
                String idString = request.getParameter("ids");
                List<String> ids = Lists.newArrayList(idString.split(","));
                List<ToiletProductDTO> productDTOS = ids.stream().map(id -> productService.queryToiletById(id)).collect(Collectors.toList());
                request.setAttribute("productList", productDTOS);
                break;
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
            Map<String, String> params = ParameterUtil.resolveParams(request, UPLOAD_DIRECTORY);
            if (Objects.isNull(params)) {
                return ProductResponse.failed("resolve params error");
            }

            ToiletProductDTO toiletProductDTO = buildProductDTO(params);
            ToiletPatternDTO toiletPatternDTO = buildPatternDTO(params);
            toiletProductDTO.setCompanyEmail(request.getSession().getAttribute("uId").toString());
            toiletProductDTO = productService.saveProduct(toiletProductDTO, toiletPatternDTO);
            if (Objects.isNull(toiletProductDTO)) {
                return ProductResponse.failed("save product failed");
            }
        } catch (Exception e) {
            LOG.error("upload products failed");
        }
        return ProductResponse.success();
    }

    @RequestMapping("/company/pattern/entry")
    @ResponseBody
    public ModeResponse patternEntry(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, UPLOAD_DIRECTORY);
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
            Map<String, String> params = ParameterUtil.resolveParams(request, "");
            if (Objects.isNull(params)) {
                return ERROR_PAGE;
            }

            List<ToiletProductDTO> productDTOS = JSON.parseArray(params.get("list"), ToiletProductDTO.class);
            if (CollectionUtils.isEmpty(productDTOS)) {
                return ERROR_PAGE;
            }

            productDTOS = productDTOS.stream().sorted((Comparator.comparing(o -> o.getProductParameters().getPrice()))).collect(Collectors.toList());
            request.setAttribute("productList", productDTOS);
        } catch (Exception e) {
            LOG.error("upload products failed");
        }
        return INDEX;
    }

    private ToiletPatternDTO buildPatternDTO(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = new ToiletPatternDTO();

        toiletPatternDTO.setProductType(params.get("productType"));
        toiletPatternDTO.setPatternType(params.get("patternType"));
        toiletPatternDTO.setPatternInfo(params.get("patternInfo"));

        // 自然环境条件
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        envConditionsDTO.setTemperature(params.get("natureTemp"));
        envConditionsDTO.setTerrain(params.get("terrain").substring(1));
        envConditionsDTO.setWaterResource(params.get("water"));
        envConditionsDTO.setGeolocation(params.get("geolocation").substring(1));
        envConditionsDTO.setEcotope(params.get("ecotope").substring(1));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //人文因素
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density"));
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
        resourceUtilizationDTO.setMixedSewageTreatment(params.get("mixedTreatment").equals("是"));
        resourceUtilizationDTO.setOtherTreatment(params.get("otherTreatment").equals("是"));
        toiletPatternDTO.setResourceUtilization(resourceUtilizationDTO);

        return toiletPatternDTO;
    }

    private ToiletProductDTO buildProductDTO(Map<String, String> params) {
        ToiletProductDTO productDTO = new ToiletProductDTO();
        productDTO.setProductName(params.get("productName"));
        productDTO.setManufacturerName(params.get("factoryName"));
        productDTO.setManufacturerCell(params.get("factoryNum"));
        productDTO.setProductType(ProductType.ofName(params.get("productType")).getCode());
        productDTO.setPatternType(params.get("patternType"));
        productDTO.setPatternName(params.get("patternName"));
        productDTO.setIsNewPattern(params.get("newmoderadios1").equals("true"));
        productDTO.setApplicableProvince(params.get("provinces"));
        productDTO.setApplicableTemperature(params.get("temperature"));
        productDTO.setPurpose(params.get("purpose"));
        productDTO.setProductFeatures(params.get("features"));

        productDTO.setQualityAssuranceMaterialsFilePath(params.get("qualityMaterial"));
        productDTO.setInstructionFilePath(params.get("introductions"));
        productDTO.setPicsPath(params.get("pics"));

        //  产品参数
        ProductParamsDTO paramsDTO = new ProductParamsDTO();
        paramsDTO.setStandard(Double.valueOf(params.get("standard")));
        paramsDTO.setApplicableNum(Integer.valueOf(params.get("applicableNum")));
        paramsDTO.setTexture(params.get("texture"));
        paramsDTO.setColor(params.get("color"));
        paramsDTO.setParamPurpose(params.get("paramPurpose"));
        paramsDTO.setCleanupCycle(params.get("cleanupCycle"));
        paramsDTO.setPrice(Double.valueOf(params.get("price")));
        paramsDTO.setServiceLife(params.get("serviceLife"));
        paramsDTO.setLength(params.get("length"));
        paramsDTO.setWide(params.get("wide"));
        paramsDTO.setHigh(params.get("high"));


        productDTO.setProductParameters(paramsDTO);

        return productDTO;
    }

}
