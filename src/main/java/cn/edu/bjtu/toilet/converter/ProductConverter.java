package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.domain.dto.*;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.BeanUtils;

public class ProductConverter {

    public static ToiletProductDO toDO(ToiletProductDTO productDTO) {
        ToiletProductDO productDO = new ToiletProductDO();
        if (productDTO.getStatus() != null) {
            productDO.setStatus(productDTO.getStatus().getCode());
        } else {
            productDO.setStatus(-1);
        }

        productDO.setPrice(productDTO.getProductParameters().getPrice());
        productDO.setCleanCycle(Integer.valueOf(productDTO.getProductParameters().getCleanupCycle()));
        productDO.setServiceLife(Integer.valueOf(productDTO.getProductParameters().getServiceLife()));
        BeanUtils.copyProperties(productDTO, productDO);
        productDO.setProductParameters(JSON.toJSONString(productDTO.getProductParameters()));
        return productDO;
    }

    public static ToiletPatternDO toDO(ToiletPatternDTO patternDTO) {
        ToiletPatternDO patternDO = new ToiletPatternDO();
        BeanUtils.copyProperties(patternDTO, patternDO);
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
        productDTO.setStatus(AuditStatus.of(productDO.getStatus()));
        return productDTO;
    }

    public static ToiletPatternDTO toDTO(ToiletPatternDO patternDO) {
        ToiletPatternDTO patternDTO = new ToiletPatternDTO();
        BeanUtils.copyProperties(patternDO, patternDTO);
        patternDTO.setEnvConditions(JSON.parseObject(patternDO.getEnvConditions(), EnvConditionsDTO.class));
        patternDTO.setHumanFactors(JSON.parseObject(patternDO.getHumanFactors(), HumanFactorsDTO.class));
        patternDTO.setPipNetworkConditions(JSON.parseObject(patternDO.getPipNetworkConditions(), PipNetworkConditionsDTO.class));
        patternDTO.setResourceUtilization(JSON.parseObject(patternDO.getResourceUtilization(), ResourceUtilizationDTO.class));
        return patternDTO;
    }

}
