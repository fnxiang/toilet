package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;

public interface CompanyDao {

    String insertCompanyDO(CompanyDO companyDO);

    CompanyDO getCompanyByEmail(String email);

    CompanyDO getCompanyByLicense(String license);
}
