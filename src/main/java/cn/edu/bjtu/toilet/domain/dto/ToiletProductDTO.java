package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ToiletProductDTO {
    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String productName;

    private String manufacturerName;

    private String manufacturerCell;

    private Integer productType;

    private String patternType;

    private ToiletPatternDTO toiletPatternDTO;

    private String patternName;

    private String applicableProvince;

    private String applicableTemperature;

    private String purpose;

    private ProductParamsDTO productParameters;

    private String qualityAssuranceMaterialsFilePath;

    private String instructionFilePath;

    private String productFeatures;

    private String picsPath;

    private String companyEmail;

}
