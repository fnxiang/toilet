package cn.edu.bjtu.toilet.domain.request;

import cn.edu.bjtu.toilet.constant.UserRole;
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

    private UserRole userRole;

}
