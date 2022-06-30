package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.exception.ToiletBizException;
import cn.edu.bjtu.toilet.constant.Constants;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.dto.CompanyDTO;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;
import cn.edu.bjtu.toilet.helper.RedisHelper;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.request.ResetPasswordRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    private CompanyDao companyDao;

    @Resource
    private RedisHelper redisHelper;

    @Override
    public CompanyDO queryCompanyByEmail(String email) {
        return companyDao.getCompanyByEmail(email);
    }

    @Override
    public List<CompanyDTO> queryAllCompany() {
        return companyDao.getCompanyListByRole(UserRole.COMPANY_USER.getCode()).stream()
                .map(CompanyConverter::toCompanyDTO)
                .collect(Collectors.toList());
    }

    @Override
    public void resetCompanyPassword(ResetPasswordRequest resetPasswordRequest) {
        if (StringUtils.isEmpty(resetPasswordRequest.getEmail()) || StringUtils.isEmpty(resetPasswordRequest.getCode())) {
            throw new ToiletBizException("company email and code can not be null", -1);
        }

        String verifyCode = redisHelper.getCacheObject(Constants.MAIL_CODE_KEY + resetPasswordRequest.getEmail());

        if (StringUtils.isEmpty(verifyCode) || !verifyCode.equals(resetPasswordRequest.getCode())) {
            throw new ToiletBizException("code is not correct or expired", -1);
        }

        CompanyDO companyDO = companyDao.getCompanyByEmail(resetPasswordRequest.getEmail());

        if (Objects.isNull(companyDO)) {
            throw new ToiletBizException("user not found", -1);
        }

        if (!resetPasswordRequest.getPassword().equals(resetPasswordRequest.getConfirmPassword())) {
            throw new ToiletBizException("password is not consist!", -1);
        }

        companyDO.setPassword(Base64.getEncoder().encodeToString(resetPasswordRequest.getPassword().getBytes()));
        companyDao.updateCompanyDO(companyDO);
    }

    @Override
    public void deleteCompany(String companyId) {
        if (!NumberUtils.isDigits(companyId)) {
            throw new ToiletBizException("company id error!", -1);
        }
        CompanyDO companyDO = companyDao.getCompanyById(Integer.valueOf(companyId));
        companyDao.deleteCompany(companyDO);
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
