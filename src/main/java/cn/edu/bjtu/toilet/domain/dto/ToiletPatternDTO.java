package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import lombok.Data;

import java.util.Date;

@Data
public class ToiletPatternDTO {

    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String productType;

    private String patternType;

    private String patternInfo;

    private EnvConditionsDTO envConditions;

    private HumanFactorsDTO humanFactors;

    private PipNetworkConditionsDTO pipNetworkConditions;

    private ResourceUtilizationDTO resourceUtilization;

    private AuditStatus status;

    private Integer professorId;

    private String professorEmail;

    private String source;

    private String attributes;
}
