package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductTextureType {
    FIBER_GLASS("玻璃钢"),
    PE("PE"),
    PP("PP"),
    CONCRETE("预制钢筋混凝土"),
    OTHER("其他");

    @Getter
    private String type;

    ProductTextureType(String type) {
        this.type = type;
    }

    public static ProductTextureType typeOf(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        for (ProductTextureType standardType : ProductTextureType.values()) {
            if (standardType.type.equals(type)) {
                return standardType;
            }
        }

        return null;
    }

    public static ProductTextureType ofTypeName(String name) {
        if (StringUtils.isEmpty(name)) {
            return OTHER;
        }

        for (ProductTextureType productTextureType : ProductTextureType.values()) {
            if (productTextureType.getType().equals(name)) {
                return productTextureType;
            }
        }
        return OTHER;
    }
}
