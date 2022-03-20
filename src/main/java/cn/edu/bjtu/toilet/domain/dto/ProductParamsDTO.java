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

    private String cleanupCycle;
}
