package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import com.alibaba.fastjson.JSON;

import java.util.Base64;

public class UserConverter {

    public static UserDO toUserDO(CompanyRegisterRequest companyRegisterRequest) {
        UserDO userDO = new UserDO();
        userDO.setCompanyName(companyRegisterRequest.getCompanyName());
        userDO.setCreditCode(companyRegisterRequest.getCreditCode());
        userDO.setBusinessLicenseFilePath(companyRegisterRequest.getFilePath());
        userDO.setEnterpriseAddress(JSON.toJSONString(companyRegisterRequest.getEnterpriseAddress()));
        userDO.setEmail(companyRegisterRequest.getEmail());
        userDO.setOfficalSite(companyRegisterRequest.getWebAddress());
        userDO.setContactName(companyRegisterRequest.getContactName());
        userDO.setContactPhone(companyRegisterRequest.getPhoneNumber());
        userDO.setPassword(Base64.getEncoder().encodeToString(companyRegisterRequest.getPassword().getBytes()));
        userDO.setRole(companyRegisterRequest.getUserConstants().getCode());
        return userDO;
    }
}
