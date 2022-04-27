package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductLifeCycleType {

    IN_FIFTY("50年以内"),
    OUT_FIFTY("50年及以上");

    @Getter
    private String type;

    ProductLifeCycleType(String type) {
        this.type = type;
    }

    public static ProductLifeCycleType typeOf(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        for (ProductLifeCycleType standardType : ProductLifeCycleType.values()) {
            if (standardType.type.equals(type)) {
                return standardType;
            }
        }

        return null;
    }

    public static ProductLifeCycleType of(Integer num) {
        return num < 50? IN_FIFTY:OUT_FIFTY;
    }
}
