package cn.edu.bjtu.toilet.constant;


public enum UserConstants {

    ADMIN("admin", 999),
    COMPANY_USER("company user", 100),
    PROFESSOR("professor", 200);

    private String name;

    private Integer code;

    UserConstants(String name, Integer code) {
        this.name = name;
        this.code = code;
    }
}
