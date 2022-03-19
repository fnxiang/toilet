package cn.edu.bjtu.toilet.domain;

import lombok.Data;

@Data
public class EnterpriseAddress {

    private String province;

    private String city;

    private String country;

    private String detailAddress;
}
