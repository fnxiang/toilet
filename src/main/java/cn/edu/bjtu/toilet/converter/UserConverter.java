package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserConstants;
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
        userDO.setRole(UserConstants.PROFESSOR.getCode());
        userDO.setSource(UserConstants.PROFESSOR.getRole());
        return userDO;
    }
}
