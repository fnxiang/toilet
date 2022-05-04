package cn.edu.bjtu.toilet.constant;

import lombok.Getter;

import java.util.Objects;

public enum UserStatus {

    ALLOWED(200, "审核通过" ),
    WAIT_APPROVE(100, "等待审核"),
    FORBIDDEN(-1, "禁止登录");

    @Getter
    private String action;

    @Getter
    private Integer code;

    UserStatus(Integer code, String action) {
        this.action = action;
        this.code = code;
    }

    public static UserStatus codeOf(Integer code) {

        if (!Objects.nonNull(code)) {
            return null;
        }

        for (UserStatus status : UserStatus.values()) {
            if (Objects.equals(status.code, code)) {
                return status;
            }
        }

        return null;
    }
}
