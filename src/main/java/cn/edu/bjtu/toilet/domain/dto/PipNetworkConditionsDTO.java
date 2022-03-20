package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class PipNetworkConditionsDTO {

    /**
     * 具有污水管道
     * */
    private Boolean hasSewerLines;

    /**
     * 具有完整城镇污水处理系统
     * */
    private Boolean hasSewageTreatment;
}
