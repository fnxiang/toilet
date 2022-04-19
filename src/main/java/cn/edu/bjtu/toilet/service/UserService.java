package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.ProfessorRegisterRequest;

public interface UserService {

    UserDO queryUserByEmail(String email);

    UserDO saveProfessorUser(ProfessorRegisterRequest professorRegisterRequest);

    Integer checkUser(String email, String password);
}
