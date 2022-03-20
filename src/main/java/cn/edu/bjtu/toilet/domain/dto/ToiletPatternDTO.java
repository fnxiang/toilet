package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ToiletPatternDTO {

    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private EnvConditionsDTO envConditions;

    private HumanFactorsDTO humanFactors;

    private PipNetworkConditionsDTO pipNetworkConditions;

    private ResourceUtilizationDTO resourceUtilization;
}
