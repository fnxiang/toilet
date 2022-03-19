package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ToiletPatternDTO {

    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String envConditions;

    private String humanFactors;

    private String pipNetworkConditions;

    private String resourceUtilization;
}
