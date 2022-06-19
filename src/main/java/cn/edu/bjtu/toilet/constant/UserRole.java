package cn.edu.bjtu.toilet.constant;


import cn.edu.bjtu.toilet.common.ToiletBizException;
import lombok.Getter;

import java.util.Objects;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

public enum UserRole {

    ADMIN(999, "admin" ),
    COMPANY_USER(100, "company"),
    PROFESSOR(200, "professor");

    @Getter
    private String role;

    @Getter
    private Integer code;

    UserRole(Integer code, String role) {
        this.role = role;
        this.code = code;
    }

    public static UserRole codeOf(Integer code) {

        if (!Objects.nonNull(code)) {
            throw new ToiletBizException("用户角色错误！", BIZ_ERROR);
        }

        for (UserRole userRole : UserRole.values()) {
            if (Objects.equals(userRole.code, code)) {
                return userRole;
            }
        }

        throw new ToiletBizException("用户角色错误！", BIZ_ERROR);
    }

    public static UserRole nameOf(String name) {

        if (!Objects.nonNull(name)) {
            throw new ToiletBizException("用户角色错误！", BIZ_ERROR);
        }

        for (UserRole userRole : UserRole.values()) {
            if (Objects.equals(userRole.role, name)) {
                return userRole;
            }
        }

        throw new ToiletBizException("用户角色错误！", BIZ_ERROR);
    }
}
