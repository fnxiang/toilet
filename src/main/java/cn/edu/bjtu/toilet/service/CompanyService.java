package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;

import java.util.List;

public interface CompanyService {

    CompanyDO checkCompany(String account, String pwd);

    CompanyDO saveCompany(CompanyDO companyDO);

    CompanyDO registerCompany(CompanyRegisterRequest companyRegisterRequest);

    CompanyDO queryCompanyByEmail(String email);

    List<CompanyDO> queryAllCompany();
}