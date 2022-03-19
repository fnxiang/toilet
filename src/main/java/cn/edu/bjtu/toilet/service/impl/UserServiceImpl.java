package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.RegisterRequest;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public Integer checkUser(String account, String pwd) {
        UserDO userDO = userDao.getUserByEmail(account);
        if (!Optional.ofNullable(userDO).isPresent()||!userDO.getPassword().equals(Base64.getEncoder().encodeToString(pwd.getBytes()))) {
            return -1;
        }
        return userDO.getRole();
    }

    @Override
    public UserDO registerUser(RegisterRequest registerRequest) {

        validate(registerRequest);
        String email = userDao.insertUserDO(UserConverter.toUserDO(registerRequest));

        return userDao.getUserByEmail(email);
    }

    private void validate(RegisterRequest registerRequest) {
    }
}
