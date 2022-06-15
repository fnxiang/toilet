package cn.edu.bjtu.toilet.service.request;

import lombok.Data;

@Data
public class ResetPasswordRequest {

    private String email;

    private String code;

    private String password;

    private String confirmPassword;
}
