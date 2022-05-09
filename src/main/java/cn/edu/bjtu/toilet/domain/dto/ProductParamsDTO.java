package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class ProductParamsDTO {

    private Double standard;

    private Integer applicableNum;

    private String texture;

    private String color;

    private String serviceLife;

    private Double price;

    private String paramPurpose;

    //TODO 改成Integer
    private String cleanupCycle;

    private String runCost;

    private String length;

    private String wide;

    private String high;

    private String otherParams;

    private String applyCase;

    private Double wallThickness;

    private Double weight;

}
