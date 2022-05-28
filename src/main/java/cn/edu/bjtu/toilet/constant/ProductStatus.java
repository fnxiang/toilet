package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductStatus {
    WAITED("等待提交审核", 100),
    PROCESSING("审核中", 110),
    WAITED_AMEND("修改后再审核", 120),
    APPROVAL("审核通过", 200),
    DENY("审核不通过", 300),
    DISCARD("放弃申请", 400),
    UNKNOWN("无状态", -1);

    @Getter
    private String name;

    @Getter
    private Integer code;

    ProductStatus(String name, Integer code) {
        this.name = name;
        this.code = code;
    }

    public static ProductStatus of(Integer code) {
        if (StringUtils.isEmpty(code)) {
            return UNKNOWN;
        }

        for (ProductStatus status : ProductStatus.values()) {
            if (status.getCode().equals(code)) {
                return status;
            }
        }
        return UNKNOWN;
    }
}
