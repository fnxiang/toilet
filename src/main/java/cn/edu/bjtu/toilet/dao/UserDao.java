package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.UserDO;

import java.util.List;

public interface UserDao {

    String insertUserDO(UserDO userDO);

    String updateUserDO(UserDO userDO);

    UserDO getUserByEmailWithStatus(String email, Integer statusCode);

    UserDO getUserByEmail(String email);

    UserDO getUserById(Integer userId);

    List<UserDO> getUserByCode(Integer code);

    void deleteUser(UserDO userDO);
}
