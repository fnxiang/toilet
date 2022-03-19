package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.RegisterRequest;

public interface UserService {

    Integer checkUser(String account, String pwd);

    UserDO registerUser(RegisterRequest registerRequest);
}
