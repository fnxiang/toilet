package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

import java.util.Objects;

public enum ProductPriceType {

    PRICE_LEVEL1("0.5以内"),
    PRICE_LEVEL2("0.5~1"),
    PRICE_LEVEL3("1~1.5"),
    PRICE_LEVEL4("1.5~2"),
    PRICE_LEVEL5("2以上");

    @Getter
    private String type;

    ProductPriceType(String type) {
        this.type = type;
    }

    public static ProductPriceType typeOf(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        for (ProductPriceType standardType : ProductPriceType.values()) {
            if (standardType.type.equals(type)) {
                return standardType;
            }
        }

        return null;
    }

    public static ProductPriceType of(Double standard) {
        if (Objects.isNull(standard)) {
            return null;
        }

        standard = standard/10000.0;
        if (standard < 0.5) {
            return PRICE_LEVEL1;
        } else if (standard <= 1) {
            return PRICE_LEVEL2;
        } else if (standard <= 1.5) {
            return PRICE_LEVEL3;
        } else if (standard <= 2) {
            return PRICE_LEVEL4;
        } else {
            return PRICE_LEVEL5;
        }
    }
}
