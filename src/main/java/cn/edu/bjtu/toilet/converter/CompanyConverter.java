package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import com.alibaba.fastjson.JSON;

import java.util.Base64;

public class CompanyConverter {

    public static CompanyDO toCompanyDO(CompanyRegisterRequest companyRegisterRequest) {
        CompanyDO companyDO = new CompanyDO();
        companyDO.setCompanyName(companyRegisterRequest.getCompanyName());
        companyDO.setCreditCode(companyRegisterRequest.getCreditCode());
        companyDO.setBusinessLicenseFilePath(companyRegisterRequest.getFilePath());
        companyDO.setEnterpriseAddress(JSON.toJSONString(companyRegisterRequest.getEnterpriseAddress()));
        companyDO.setEmail(companyRegisterRequest.getEmail());
        companyDO.setOfficialSite(companyRegisterRequest.getWebAddress());
        companyDO.setContactName(companyRegisterRequest.getContactName());
        companyDO.setContactPhone(companyRegisterRequest.getPhoneNumber());
        companyDO.setPassword(Base64.getEncoder().encodeToString(companyRegisterRequest.getPassword().getBytes()));
        companyDO.setRole(companyRegisterRequest.getUserRole().getCode());
        companyDO.setSource(companyRegisterRequest.getUserRole().getRole());
        companyDO.setStatus(UserStatus.WAIT_APPROVE.getCode());
        return companyDO;
    }
}
