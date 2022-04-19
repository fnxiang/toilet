package cn.edu.bjtu.toilet.domain;

import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import lombok.Data;

@Data
public class CompanyRegisterRequest {

    private String companyName;

    private String creditCode;

    private String filePath;

    private EnterpriseAddressDTO enterpriseAddress;

    private String email;

    private String webAddress;

    private String contactName;

    private String phoneNumber;

    private String password;

    private String confirmPassword;

    private UserConstants userConstants;

}
