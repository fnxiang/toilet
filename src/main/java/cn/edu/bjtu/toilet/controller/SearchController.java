package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.*;
import cn.edu.bjtu.toilet.domain.SearchResponse;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.ERROR_PAGE;

@Controller
public class SearchController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private PatternService patternService;


    /**
     * 产品高级搜索：规格、材质、使用寿命、价格（万元）、清理周期
     *
     * */
    @RequestMapping("/search/product")
    @ResponseBody
    public SearchResponse productSearch(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, "");
            ProductSearchConditionsDTO searchConditions = buildSearchConditions(params);

            List<ToiletProductDTO> productDTOS = productService.queryAllProductList("");

            List<ToiletProductDTO> searchResults = matchConditions(productDTOS, searchConditions);
            request.setAttribute("test", "searchResults");
            request.setAttribute("product_list", searchResults);
        } catch (Exception e) {
           LOG.error("search error with exception: {}", e.getMessage());
           return SearchResponse.failed(e.getMessage());
        }

        return SearchResponse.success();
    }

    @RequestMapping("/search/product/results")
    public String productResults(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, "");
            ProductSearchConditionsDTO searchConditions = buildSearchConditions(params);

            List<ToiletProductDTO> productDTOS = productService.queryAllProductList("");

            List<ToiletProductDTO> searchResults = matchConditions(productDTOS, searchConditions);
            request.setAttribute("test", "searchResults");
            request.setAttribute("productList", searchResults);
        } catch (Exception e) {
            LOG.error("search error with exception: {}", e.getMessage());
        }
        return "/product/product_results";
    }

    @RequestMapping("/search/mode/results")
    public String modeSearch(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, "");

            if (params == null) {
                LOG.error("params is null!");
                return ERROR_PAGE;
            }

            ToiletPatternDTO searchDTO = buildModeSearchCondition(params);

            PatternSortRequest sortRequest = new PatternSortRequest();
            sortRequest.setSortBy("water_save_score");
            sortRequest.setIsDesc(false);

            List<ToiletPatternDTO> patternDTOS = patternService.sortPattern(sortRequest);

            patternDTOS = matchPatternConditions(patternDTOS, searchDTO);

            request.setAttribute("patternList", patternDTOS);
            request.setAttribute("search_condition", JSON.toJSONString(searchDTO));

        } catch (Exception e) {
            LOG.error("search mode error with : {}", e.getMessage());
            return ERROR_PAGE;
        }

        return "/product/mode_list";
    }

    private List<ToiletProductDTO> matchProductConditions(List<ToiletProductDTO> productDTOS, ToiletPatternDTO searchDTO) {

        return productDTOS.stream().map(productDTO -> {
            ToiletPatternDTO patternDTO = productDTO.getToiletPatternDTO();
            if (patternCompare(patternDTO, searchDTO)) {
                return productDTO;
            }

            return null;
        }).filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    private List<ToiletPatternDTO> matchPatternConditions(List<ToiletPatternDTO> patternDTOS, ToiletPatternDTO searchDTO) {

        return patternDTOS.stream().map(item -> {
            if (patternCompare(item, searchDTO)) {
                return item;
            }
            return null;
        }).filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    private Boolean patternCompare(ToiletPatternDTO patternDTODb, ToiletPatternDTO condition) {
        return compareEnvConditions(patternDTODb.getEnvConditions(), condition.getEnvConditions())
            && compareHumanFactors(patternDTODb.getHumanFactors(), condition.getHumanFactors())
            && comparePipNetworkConditions(patternDTODb.getPipNetworkConditions(), condition.getPipNetworkConditions())
            && compareResourceUtilization(patternDTODb.getResourceUtilization(), condition.getResourceUtilization());
    }

    private Boolean compareEnvConditions(EnvConditionsDTO envDb, EnvConditionsDTO conditions) {
        return (envDb.getEcotope().contains(conditions.getEcotope()) || conditions.getEcotope().equals("无限制"))
            && (envDb.getGeolocation().contains(conditions.getGeolocation()) || conditions.getGeolocation().equals("无限制"))
            && (envDb.getTemperature().contains(conditions.getTemperature()) || conditions.getTemperature().equals("无限制"))
            && (envDb.getTerrain().contains(conditions.getTerrain()) || conditions.getTerrain().equals("无限制"))
            && (envDb.getWaterResource().contains(conditions.getWaterResource()) || conditions.getWaterResource().equals("无限制"));
    }

    private Boolean compareHumanFactors(HumanFactorsDTO humanFactorsDTO, HumanFactorsDTO conditions) {
        return (humanFactorsDTO.getUsageHabits().contains(conditions.getUsageHabits()) || conditions.getUsageHabits().equals("均可"))
            && (humanFactorsDTO.getDensity().contains(conditions.getDensity()) || conditions.getDensity().equals("无限制"));
    }

    private Boolean comparePipNetworkConditions(PipNetworkConditionsDTO db, PipNetworkConditionsDTO conditions) {
        return (conditions.getHasSewageTreatment() == null || conditions.getHasSewageTreatment().equals(db.getHasSewageTreatment()))
            && (conditions.getHasSewerLines() == null || conditions.getHasSewerLines().equals(db.getHasSewerLines()));
    }

    private Boolean compareResourceUtilization(ResourceUtilizationDTO db, ResourceUtilizationDTO conditions) {
        return (conditions.getIsBiogasUtilization() == null || conditions.getIsBiogasUtilization().equals(db.getIsBiogasUtilization()))
            && (db.getMixedSewageTreatment().contains(conditions.getMixedSewageTreatment()) || conditions.getMixedSewageTreatment().equals("均可"))
            && (conditions.getOtherTreatment() == null || conditions.getOtherTreatment().equals(db.getOtherTreatment()));
    }



    private ToiletPatternDTO buildModeSearchCondition(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = new ToiletPatternDTO();
        // 自然环境条件
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        envConditionsDTO.setTemperature(params.get("natureTemp[]"));
        envConditionsDTO.setTerrain(params.get("terrain[]"));
        envConditionsDTO.setWaterResource(params.get("water[]"));
        envConditionsDTO.setGeolocation(params.get("geolocation[]"));
        envConditionsDTO.setEcotope(params.get("ecotope[]"));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //人文因素
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density[]"));
        humanFactorsDTO.setUsageHabits(params.get("usageHabits[]"));

        toiletPatternDTO.setHumanFactors(humanFactorsDTO);

        //管网
        PipNetworkConditionsDTO pipNetworkConditionsDTO = new PipNetworkConditionsDTO();
        pipNetworkConditionsDTO.setHasSewageTreatment(buildBooleanCondition(params.get("sewageTreatment[]")));
        pipNetworkConditionsDTO.setHasSewerLines(buildBooleanCondition(params.get("sewerLines[]")));

        toiletPatternDTO.setPipNetworkConditions(pipNetworkConditionsDTO);

        //资源
        ResourceUtilizationDTO resourceUtilizationDTO = new ResourceUtilizationDTO();
        resourceUtilizationDTO.setIsBiogasUtilization(buildBooleanCondition(params.get("biogasUtilization[]")));
        resourceUtilizationDTO.setMixedSewageTreatment(params.get("mixedTreatment[]"));
        resourceUtilizationDTO.setOtherTreatment(buildBooleanCondition(params.get("otherTreatment[]")));
        toiletPatternDTO.setResourceUtilization(resourceUtilizationDTO);

        return toiletPatternDTO;
    }

    private Boolean buildBooleanCondition(String value) {
        if (value.equals("是")) {
            return Boolean.TRUE;
        } else if (value.equals("否")) {
            return Boolean.FALSE;
        }

        return null;
    }


    private List<ToiletProductDTO> matchConditions(List<ToiletProductDTO> productDTOS, ProductSearchConditionsDTO searchConditions) {
        return productDTOS.stream().map(productDTO -> {
            ProductParamsDTO productParamsDTO = productDTO.getProductParameters();
            if (ProductStandardType.of(productParamsDTO.getStandard()).equals(searchConditions.getStandardType())
                    && ProductTextureType.ofTypeName(productParamsDTO.getTexture()).equals(searchConditions.getTextureType())
                    && ProductLifeCycleType.of(Integer.valueOf(productParamsDTO.getServiceLife())).equals(searchConditions.getLifeCycleType())
                    && ProductPriceType.of(productParamsDTO.getPrice()).equals(searchConditions.getPriceType())
                    && ProductCleanCycleType.of(Integer.valueOf(productParamsDTO.getCleanupCycle())).equals(searchConditions.getCleanCycleType())) {
                return productDTO;
            } else {
                return null;
            }

        }).filter(Objects::nonNull).collect(Collectors.toList());
    }

    private ProductSearchConditionsDTO buildSearchConditions(Map<String, String> params) {
        return ProductSearchConditionsDTO.builder()
                .standardType(ProductStandardType.typeOf(params.get("guige_select")))
                .textureType(ProductTextureType.typeOf(params.get("caizhi_select")))
                .lifeCycleType(ProductLifeCycleType.typeOf(params.get("life_select")))
                .priceType(ProductPriceType.typeOf(params.get("price_select")))
                .cleanCycleType(ProductCleanCycleType.typeOf(params.get("clean_select")))
                .build();

    }
}
