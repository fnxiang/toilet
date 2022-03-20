package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductType {

    TYPE1("完整的下水道水冲厕所", 100),
    UNKNOWN("不支持的产品", -1);

    @Getter
    private String name;

    @Getter
    private Integer code;

    ProductType(String name, Integer code) {
        this.name = name;
        this.code = code;
    }

    public static ProductType ofName(String name) {
        if (StringUtils.isEmpty(name)) {
            return UNKNOWN;
        }

        for (ProductType productType : ProductType.values()) {
            if (productType.getName().equals(name)) {
                return productType;
            }
        }
        return UNKNOWN;
    }
}
