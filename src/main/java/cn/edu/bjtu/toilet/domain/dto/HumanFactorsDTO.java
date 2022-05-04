package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class HumanFactorsDTO {

    private String density;

    /**
     * 液态肥使用习惯
     * */
    private String usageHabits;
}
