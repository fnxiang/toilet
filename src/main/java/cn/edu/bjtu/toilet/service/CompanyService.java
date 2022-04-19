package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;

public interface CompanyService {

    Integer checkCompany(String account, String pwd);

    CompanyDO registerCompany(CompanyRegisterRequest companyRegisterRequest);

    CompanyDO queryCompanyByEmail(String email);
}
