package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public Boolean checkUser(String account, String pwd) {
        UserDO userDO = userDao.getUserByEmail(account);
        if (!Optional.ofNullable(userDO).isPresent()) {
            return false;
        }
        return userDO.getPassword().equals(pwd);
    }
}
