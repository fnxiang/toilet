package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.dto.CompanyDTO;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
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

    public static CompanyDTO toCompanyDTO(CompanyDO companyDO) {
        EnterpriseAddressDTO enterpriseAddressDTO = JSON.parseObject(companyDO.getEnterpriseAddress(), EnterpriseAddressDTO.class);
        String companyAddress = String.format("%s,%s,%s,%s", enterpriseAddressDTO.getProvince(), enterpriseAddressDTO.getCity(), enterpriseAddressDTO.getCountry(), enterpriseAddressDTO.getDetailAddress());
        return CompanyDTO.builder()
                .id(companyDO.getId())
                .gmtCreate(companyDO.getGmtCreate())
                .gmtModified(companyDO.getGmtModified())
                .companyName(companyDO.getCompanyName())
                .contactPhone(companyDO.getContactPhone())
                .contactName(companyDO.getContactName())
                .companyAddress(companyAddress)
                .email(companyDO.getEmail())
                .creditCode(companyDO.getCreditCode())
                .businessLicenseFilePath(companyDO.getBusinessLicenseFilePath())
                .officialSite(companyDO.getOfficialSite())
                .role(UserRole.codeOf(companyDO.getRole()))
                .status(UserStatus.codeOf(companyDO.getStatus()))
                .build();
    }
}
