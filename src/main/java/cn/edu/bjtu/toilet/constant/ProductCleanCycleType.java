package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductCleanCycleType {
    CLEAN_LEVEL1("≤3个月"),
    CLEAN_LEVEL2("4～6个月"),
    CLEAN_LEVEL3("7～12个月"),
    CLEAN_LEVEL4("12个月及以上");

    @Getter
    private String type;

    ProductCleanCycleType(String type) {
        this.type = type;
    }

    public static ProductCleanCycleType typeOf(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        for (ProductCleanCycleType standardType : ProductCleanCycleType.values()) {
            if (standardType.type.equals(type)) {
                return standardType;
            }
        }

        return null;
    }

    public static ProductCleanCycleType of(Integer num) {
        if (num <= 3) {
            return CLEAN_LEVEL1;
        } else if (num < 6) {
            return CLEAN_LEVEL2;
        } else if (num < 12) {
            return CLEAN_LEVEL3;
        } else {
            return CLEAN_LEVEL4;
        }
    }
}
