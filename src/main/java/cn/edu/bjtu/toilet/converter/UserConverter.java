package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.UserDTO;
import cn.edu.bjtu.toilet.domain.request.ProfessorRegisterRequest;

import java.util.Base64;
import java.util.Map;

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

    public static ProfessorRegisterRequest buildProfRequest(Map<String, String> params) {
        ProfessorRegisterRequest registerRequest = new ProfessorRegisterRequest();
        registerRequest.setUserName(params.get("userName"));
        registerRequest.setCompany(params.get("company"));
        registerRequest.setPosition(params.get("position"));
        registerRequest.setTitle(params.get("title"));
        registerRequest.setPhoneNum(params.get("phoneNum"));
        registerRequest.setPassword(params.get("password"));
        registerRequest.setConfirmPassword(params.get("confirmPassword"));
        registerRequest.setEmail(params.get("emailAddress"));
        return registerRequest;
    }

    public static UserDTO buildProfessorInfo(Map<String, String> params) {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserName(params.get("userName"));
        userDTO.setCompany(params.get("company"));
        userDTO.setPosition(params.get("position"));
        userDTO.setTitle(params.get("title"));
        userDTO.setPhoneNum(params.get("phoneNum"));
        return userDTO;
    }
}
