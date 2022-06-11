package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class CompanyDTO {

    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String companyName;

    private String contactPhone;

    private String companyAddress;

    private String creditCode;

    private String businessLicenseFilePath;

    private String email;

    private String officialSite;

    private String contactName;

    private String country;

    private UserStatus status;

    private UserRole role;
}
