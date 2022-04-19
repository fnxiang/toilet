package cn.edu.bjtu.toilet.domain;

import lombok.Data;

@Data
public class ProfessorRegisterRequest {

    private String userName;

    private String company;

    private String position;

    private String title;

    private String phoneNum;

    private String email;

    private String password;

    private String confirmPassword;

}
