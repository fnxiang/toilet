package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.dto.CompanyDTO;
import cn.edu.bjtu.toilet.domain.request.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.request.UserUpdateRequest;

import java.util.List;

public interface CompanyService {

    CompanyDO checkCompany(String account, String pwd);

    CompanyDO saveCompany(CompanyDO companyDO);

    CompanyDO updateCompany(CompanyDO companyDO);

    CompanyDO updatePassword(UserUpdateRequest request);

    CompanyDO registerCompany(CompanyRegisterRequest companyRegisterRequest);

    CompanyDO queryCompanyByEmail(String email);

    List<CompanyDTO> queryAllCompany();

    void deleteCompany(String companyId);
}
