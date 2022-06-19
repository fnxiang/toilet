package cn.edu.bjtu.toilet.service.request;

import lombok.Data;

@Data
public class AccountRequest {

    private String role;

    private String account;

    private String pwd;
}
