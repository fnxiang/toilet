package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    private CompanyDao companyDao;

    @Override
    public CompanyDO queryCompanyByEmail(String email) {
        return companyDao.getCompanyByEmail(email);
    }

    @Override
    public List<CompanyDO> queryAllCompany() {
        return companyDao.getCompanyListByRole(UserConstants.COMPANY_USER.getCode());
    }

    @Override
    public Integer checkCompany(String account, String pwd) {
        CompanyDO userDO = companyDao.getCompanyByEmail(account);
        if (!Optional.ofNullable(userDO).isPresent()||!userDO.getPassword().equals(Base64.getEncoder().encodeToString(pwd.getBytes()))) {
            return -1;
        }
        return userDO.getRole();
    }

    @Override
    public CompanyDO registerCompany(CompanyRegisterRequest companyRegisterRequest) {

        validate(companyRegisterRequest);
        String email = companyDao.insertCompanyDO(CompanyConverter.toCompanyDO(companyRegisterRequest));

        return companyDao.getCompanyByEmail(email);
    }

    private void validate(CompanyRegisterRequest companyRegisterRequest) {
    }
}
