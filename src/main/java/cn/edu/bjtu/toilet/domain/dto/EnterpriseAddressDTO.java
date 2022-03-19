package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class EnterpriseAddressDTO {

    private String province;

    private String city;

    private String country;

    private String detailAddress;
}
