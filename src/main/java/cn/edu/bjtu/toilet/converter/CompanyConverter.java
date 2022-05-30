package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.dto.CompanyDTO;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.checkerframework.checker.units.qual.C;

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

    public static CompanyDTO toCompanyDTO(CompanyDO companyDO) {
        EnterpriseAddressDTO enterpriseAddressDTO = JSON.parseObject(companyDO.getEnterpriseAddress(), EnterpriseAddressDTO.class);
        String companyAddress = String.format("%s,%s,%s,%s", enterpriseAddressDTO.getProvince(), enterpriseAddressDTO.getCity(), enterpriseAddressDTO.getCountry(), enterpriseAddressDTO.getDetailAddress());
        return CompanyDTO.builder()
                .companyName(companyDO.getCompanyName())
                .contactPhone(companyDO.getContactPhone())
                .companyAddress(companyAddress)
                .build();
    }
}
