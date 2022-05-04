package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.List;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Resource
    private CompanyDao companyDao;

    @Override
    public UserDO queryUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public List<UserDO> queryAllUser(UserRole user) {
         return userDao.getUserByCode(user.getCode());
    }

    @Override
    public UserDO checkUser(String email, String password) {
        UserDO userDO = userDao.getUserByEmail(email);

        if (userDO == null) {
            return null;
        }

        if (userDO.getPassword().equals(generatePassword(password))) {
            return userDO;
        }
        return null;
    }

    @Override
    public UserDO saveProfessorUser(ProfessorRegisterRequest professorRegisterRequest) {
        validate(professorRegisterRequest);

        if (companyDao.getCompanyByEmail(professorRegisterRequest.getEmail()) != null) {
            throw new ToiletBizException("email has been register by company!", BIZ_ERROR);
        }

        String email = userDao.insertUserDO(UserConverter.toUserDO(professorRegisterRequest));

        return userDao.getUserByEmail(email);
    }

    @Override
    public UserDO saveProfessorUser(UserDO user) {

        String email = userDao.updateUserDO(user);

        return userDao.getUserByEmail(email);
    }

    private void validate(ProfessorRegisterRequest professorRegisterRequest) {
    }

    private String generatePassword(String password) {
        return Base64.getEncoder().encodeToString(password.getBytes());
    }
}
