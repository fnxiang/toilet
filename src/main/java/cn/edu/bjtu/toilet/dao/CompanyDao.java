package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;

import java.util.List;

public interface CompanyDao {

    String insertCompanyDO(CompanyDO companyDO);

    CompanyDO getCompanyByEmail(String email);

    CompanyDO getCompanyById(Integer id);

    CompanyDO getCompanyByLicense(String license);

    List<CompanyDO> getCompanyListByRole(Integer code);

    String updateCompanyDO(CompanyDO companyDO);

    void deleteCompany(CompanyDO companyDO);
}
