package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.ProductType;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.domain.ProductResponse;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.service.ProductService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.INDEX;
import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.PRODUCT_BASE;

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
        String productId = request.getParameter("product_id");
        switch (url) {
            case "product_info":
                ToiletProductDTO toiletProductDTO = productService.queryToiletById(productId);
                request.setAttribute("product", toiletProductDTO);
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

    private ToiletPatternDTO buildPatternDTO(Map<String, String> params) {
        ToiletPatternDTO toiletPatternDTO = new ToiletPatternDTO();
        // 自然环境条件
        EnvConditionsDTO envConditionsDTO = new EnvConditionsDTO();
        envConditionsDTO.setTemperature(params.get("natureTemp"));
        envConditionsDTO.setTerrain(params.get("terrain"));
        envConditionsDTO.setWaterResource(params.get("water"));
        envConditionsDTO.setGeolocation(params.get("geolocation"));
        envConditionsDTO.setEcotope(params.get("ecotope"));

        toiletPatternDTO.setEnvConditions(envConditionsDTO);

        //人文因素
        HumanFactorsDTO humanFactorsDTO = new HumanFactorsDTO();
        humanFactorsDTO.setDensity(params.get("density"));
        humanFactorsDTO.setUsageHabits(params.get("usageHabits").equals("是"));

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
