package cn.edu.bjtu.toilet.constant;


import lombok.Getter;

import java.util.Objects;

public enum UserConstants {

    ADMIN(999, "admin" ),
    COMPANY_USER(100, "company"),
    PROFESSOR(200, "professor");

    @Getter
    private String role;

    @Getter
    private Integer code;

    UserConstants(Integer code, String role) {
        this.role = role;
        this.code = code;
    }

    public static UserConstants codeOf(Integer code) {

        if (!Objects.nonNull(code)) {
            return null;
        }

        for (UserConstants userConstants : UserConstants.values()) {
            if (Objects.equals(userConstants.code, code)) {
                return userConstants;
            }
        }

        return null;
    }
}
