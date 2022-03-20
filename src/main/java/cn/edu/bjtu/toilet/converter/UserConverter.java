package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.RegisterRequest;
import com.alibaba.fastjson.JSON;

import java.util.Base64;

public class UserConverter {

    public static UserDO toUserDO(RegisterRequest registerRequest) {
        UserDO userDO = new UserDO();
        userDO.setCompanyName(registerRequest.getCompanyName());
        userDO.setCreditCode(registerRequest.getCreditCode());
        userDO.setBusinessLicenseFilePath(registerRequest.getFilePath());
        userDO.setEnterpriseAddress(JSON.toJSONString(registerRequest.getEnterpriseAddress()));
        userDO.setEmail(registerRequest.getEmail());
        userDO.setOfficalSite(registerRequest.getWebAddress());
        userDO.setContactName(registerRequest.getContactName());
        userDO.setContactPhone(registerRequest.getPhoneNumber());
        userDO.setPassword(Base64.getEncoder().encodeToString(registerRequest.getPassword().getBytes()));
        userDO.setRole(registerRequest.getUserConstants().getCode());
        return userDO;
    }
}
