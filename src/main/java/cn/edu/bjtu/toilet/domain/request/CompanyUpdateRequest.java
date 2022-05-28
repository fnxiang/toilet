package cn.edu.bjtu.toilet.domain.request;

import lombok.Data;

@Data
public class CompanyUpdateRequest {

    private String email;

    private String originPassword;

    private String password;

    private String confirmPassword;
}
