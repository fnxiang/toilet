package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.ProfessorRegisterRequest;

import java.util.Base64;

public class UserConverter {

    public static UserDO toUserDO(ProfessorRegisterRequest request) {
        UserDO userDO = new UserDO();
        userDO.setName(request.getUserName());
        userDO.setWorkCompany(request.getCompany());
        userDO.setPosition(request.getPosition());
        userDO.setTitle(request.getTitle());
        userDO.setEmail(request.getEmail());
        userDO.setPassword(Base64.getEncoder().encodeToString(request.getPassword().getBytes()));
        userDO.setPhone(request.getPhoneNum());
        userDO.setRole(UserRole.PROFESSOR.getCode());
        userDO.setSource(UserRole.PROFESSOR.getRole());
        userDO.setStatus(UserStatus.WAIT_APPROVE.getCode());
        return userDO;
    }
}
