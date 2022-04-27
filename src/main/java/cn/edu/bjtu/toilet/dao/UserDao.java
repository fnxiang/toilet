package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.UserDO;

import java.util.List;

public interface UserDao {

    String insertUserDO(UserDO userDO);

    UserDO getUserByEmail(String email);

    List<UserDO> getUserByCode(Integer code);
}
