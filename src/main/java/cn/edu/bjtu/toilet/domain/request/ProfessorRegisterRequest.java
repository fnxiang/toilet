package cn.edu.bjtu.toilet.domain.request;

import cn.edu.bjtu.toilet.constant.UserRole;
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

    private String code;

    private UserRole userRole;

}
