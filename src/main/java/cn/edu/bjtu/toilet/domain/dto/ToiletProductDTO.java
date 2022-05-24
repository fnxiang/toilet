package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.ProductStatus;
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

    private String productType;

    private String patternType;

    private Boolean isNewPattern;

    private ToiletPatternDTO toiletPatternDTO;

    private String patternName;

    private String applicableProvince;

    private String applicableTemperature;

    private String purpose;

    private Integer professorId;

    private String productTheory;

    private String specialParam;

    private String applicableCondition;

    private ProductParamsDTO productParameters;

    private String qualityAssuranceMaterialsFilePath;

    private String instructionFilePath;

    private String productFeatures;

    private String picsPath;

    private String companyEmail;

    private ProductStatus status;

    private String source;

}
