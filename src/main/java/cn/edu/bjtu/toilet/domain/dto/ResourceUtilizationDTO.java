package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class ResourceUtilizationDTO {

    /**
     * 具有沼气利用工程
     * */
    private Boolean isBiogasUtilization;

    /**
     * 计划与其他生活污水混合处理
     * */
    private String mixedSewageTreatment;

    /**
     * 计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
     * */
    private Boolean otherTreatment;
}
