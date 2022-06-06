package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.UserDTO;
import cn.edu.bjtu.toilet.domain.request.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

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
    public UserDO saveProfessorUser(UserDTO user) {

        UserDO userDO = userDao.getUserByEmail(user.getEmail());

        userDO.setPhone(user.getPhone());
        userDO.setTitle(user.getTitle());
        userDO.setPosition(user.getPosition());
        userDO.setWorkCompany(user.getWorkCompany());
        userDO.setName(user.getName());

        String email = userDao.updateUserDO(userDO);

        return userDao.getUserByEmail(email);
    }

    @Override
    public UserDO saveProfessorUser(UserDO user) {
        String email = userDao.updateUserDO(user);

        return userDao.getUserByEmail(email);
    }

    @Override
    public UserDO updatePassword(UserUpdateRequest request) {
        UserDO userDO = userDao.getUserByEmail(request.getEmail());

        if (Objects.isNull(userDO)) {
            throw new ToiletBizException("角色错误！", -1);
        }

        if (Base64.getEncoder().encodeToString(request.getOriginPassword().getBytes()).equals(userDO.getPassword())
                && request.getPassword().equals(request.getConfirmPassword())) {
            userDO.setPassword(Base64.getEncoder().encodeToString(request.getPassword().getBytes()));
        } else {
            throw new ToiletBizException("原始密码不正确！", -1);
        }
        userDao.updateUserDO(userDO);
        return userDao.getUserByEmail(userDO.getEmail());
    }

    private void validate(ProfessorRegisterRequest professorRegisterRequest) {
    }

    private String generatePassword(String password) {
        return Base64.getEncoder().encodeToString(password.getBytes());
    }
}
