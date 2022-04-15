package cn.edu.bjtu.toilet.constant;

import lombok.Getter;
import org.springframework.util.StringUtils;

public enum ProductType {

    TYPE1("完整的下水道水冲厕所", 100),
    TYPE2("化粪池式厕所", 101),
    TYPE3("双翁漏斗式厕所", 102),
    TYPE4("三联沼气式厕所", 103),
    TYPE5("复合生物反应微水冲厕所", 104),
    TYPE6("真空负压厕所", 105),
    TYPE7("多级生化组合电催化氧化厕所", 106),
    TYPE8("膜生物反应器（MBR）厕所", 107),
    TYPE9("堆肥式生态旱厕", 108),
    TYPE10("双坑交替式厕所", 109),
    TYPE11("粪尿分集式厕所", 110),
    TYPE12("泡沫封堵厕所", 111),
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
