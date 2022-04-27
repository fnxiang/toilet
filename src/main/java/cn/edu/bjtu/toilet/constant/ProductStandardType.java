package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductStandardType {

    LEVEL1("≤0.5"),
    LEVEL2("0.6~10"),
    LEVEL3("11~25"),
    LEVEL4("26~50"),
    LEVEL5("51~100"),
    LEVEL6("100以上");

    @Getter
    private String type;

    ProductStandardType(String type) {
        this.type = type;
    }

    public static ProductStandardType typeOf(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        for (ProductStandardType standardType : ProductStandardType.values()) {
            if (standardType.type.equals(type)) {
                return standardType;
            }
        }

        return null;
    }

    public static ProductStandardType of(Double standard) {
        if (standard <= 0.5) {
            return LEVEL1;
        } else if (standard <= 10) {
            return LEVEL2;
        } else if (standard <= 25) {
            return LEVEL3;
        } else if (standard <= 50) {
            return LEVEL4;
        } else if (standard <= 100) {
            return LEVEL5;
        } else {
            return LEVEL6;
        }
    }
}
