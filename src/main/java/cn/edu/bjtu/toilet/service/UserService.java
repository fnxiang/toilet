package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;

public interface UserService {

    Integer checkUser(String account, String pwd);

    UserDO registerUser(CompanyRegisterRequest companyRegisterRequest);

    UserDO queryUserByEmail(String email);
}
