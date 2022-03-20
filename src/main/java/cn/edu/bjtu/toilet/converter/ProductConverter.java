package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.domain.dto.*;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.BeanUtils;

public class ProductConverter {

    public static ToiletProductDO toDO(ToiletProductDTO productDTO) {
        ToiletProductDO productDO = new ToiletProductDO();
        BeanUtils.copyProperties(productDTO, productDO);
        productDO.setProductParameters(JSON.toJSONString(productDTO.getProductParameters()));
        return productDO;
    }

    public static ToiletPatternDO toDO(ToiletPatternDTO patternDTO) {
        ToiletPatternDO patternDO = new ToiletPatternDO();
        patternDO.setEnvConditions(JSON.toJSONString(patternDTO.getEnvConditions()));
        patternDO.setHumanFactors(JSON.toJSONString(patternDTO.getHumanFactors()));
        patternDO.setPipNetworkConditions(JSON.toJSONString(patternDTO.getPipNetworkConditions()));
        patternDO.setResourceUtilization(JSON.toJSONString(patternDTO.getResourceUtilization()));
        return patternDO;
    }

    public static ToiletProductDTO toDTO(ToiletProductDO productDO) {
        ToiletProductDTO productDTO = new ToiletProductDTO();
        BeanUtils.copyProperties(productDO, productDTO);
        productDTO.setProductParameters(JSON.parseObject(productDO.getProductParameters(), ProductParamsDTO.class));
        return productDTO;
    }

    public static ToiletPatternDTO toDTO(ToiletPatternDO patternDO) {
        ToiletPatternDTO patternDTO = new ToiletPatternDTO();
        patternDTO.setEnvConditions(JSON.parseObject(patternDO.getEnvConditions(), EnvConditionsDTO.class));
        patternDTO.setHumanFactors(JSON.parseObject(patternDO.getHumanFactors(), HumanFactorsDTO.class));
        patternDTO.setPipNetworkConditions(JSON.parseObject(patternDO.getPipNetworkConditions(), PipNetworkConditionsDTO.class));
        patternDTO.setResourceUtilization(JSON.parseObject(patternDO.getResourceUtilization(), ResourceUtilizationDTO.class));
        return patternDTO;
    }

}
