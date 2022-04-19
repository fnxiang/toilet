package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.UserDO;

public interface UserDao {

    String insertUserDO(UserDO userDO);

    UserDO getUserByEmail(String email);
}
