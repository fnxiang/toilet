package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;
import cn.edu.bjtu.toilet.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.List;
import java.util.Objects;
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
        return companyDao.getCompanyListByRole(UserRole.COMPANY_USER.getCode());
    }

    @Override
    public CompanyDO checkCompany(String account, String pwd) {
        CompanyDO userDO = companyDao.getCompanyByEmail(account);
        if (!Optional.ofNullable(userDO).isPresent()||!userDO.getPassword().equals(Base64.getEncoder().encodeToString(pwd.getBytes()))) {
            return null;
        }
        return userDO;
    }

    @Override
    public CompanyDO saveCompany(CompanyDO companyDO) {
        String email = companyDao.updateCompanyDO(companyDO);
        return companyDao.getCompanyByEmail(email);
    }

    @Override
    public CompanyDO updateCompany(CompanyDO companyDO) {
        CompanyDO companyDOFromDb = companyDao.getCompanyByEmail(companyDO.getEmail());

        companyDO.setGmtCreate(companyDOFromDb.getGmtCreate());
        companyDO.setId(companyDOFromDb.getId());
        companyDO.setStatus(companyDOFromDb.getStatus());
        companyDO.setPassword(companyDOFromDb.getPassword());
        companyDO.setSource(companyDOFromDb.getSource());
        companyDO.setVersion(companyDOFromDb.getVersion());
        companyDO.setRole(companyDOFromDb.getRole());
        companyDO.setDeleted(companyDOFromDb.getDeleted());

        companyDao.updateCompanyDO(companyDO);
        return companyDao.getCompanyByEmail(companyDO.getEmail());
    }

    @Override
    public CompanyDO updatePassword(UserUpdateRequest request) {
        CompanyDO companyDO = companyDao.getCompanyByEmail(request.getEmail());

        if (Objects.isNull(companyDO)) {
            throw new ToiletBizException("角色错误！", -1);
        }

        if (Base64.getEncoder().encodeToString(request.getOriginPassword().getBytes()).equals(companyDO.getPassword())
            && request.getPassword().equals(request.getConfirmPassword())) {
            companyDO.setPassword(Base64.getEncoder().encodeToString(request.getPassword().getBytes()));
        } else {
            throw new ToiletBizException("原始密码不正确！", -1);
        }
        companyDao.updateCompanyDO(companyDO);
        return companyDao.getCompanyByEmail(companyDO.getEmail());
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
