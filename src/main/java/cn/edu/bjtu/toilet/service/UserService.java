package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.UserDTO;
import cn.edu.bjtu.toilet.domain.request.ProfessorRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;

import java.util.List;

public interface UserService {

    UserDO queryUserByEmail(String email);

    UserDO saveProfessorUser(ProfessorRegisterRequest professorRegisterRequest);

    UserDO saveProfessorUser(UserDTO user);

    UserDO saveProfessorUser(UserDO user);

    UserDO updatePassword(UserUpdateRequest request);

    UserDO checkUser(String email, String password);

    List<UserDO> queryAllUser(UserRole userCode);
}
