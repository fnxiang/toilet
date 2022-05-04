package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.ProfessorRegisterRequest;

import java.util.List;

public interface UserService {

    UserDO queryUserByEmail(String email);

    UserDO saveProfessorUser(ProfessorRegisterRequest professorRegisterRequest);

    UserDO saveProfessorUser(UserDO user);

    UserDO checkUser(String email, String password);

    List<UserDO> queryAllUser(UserRole userCode);
}
