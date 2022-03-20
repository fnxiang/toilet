package cn.edu.bjtu.toilet.constant;

import lombok.Getter;

public enum ProductType {

    TYPE1("完整下水道式厕所", 100);

    @Getter
    private String name;

    @Getter
    private Integer code;

    ProductType(String name, Integer code) {
        this.name = name;
        this.code = code;
    }
}
