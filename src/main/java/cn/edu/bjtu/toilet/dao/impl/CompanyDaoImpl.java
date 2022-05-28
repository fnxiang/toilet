package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.CompanyDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.CompanyDOMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class CompanyDaoImpl implements CompanyDao {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private CompanyDOMapper mapper;

    @Override
    public CompanyDO getCompanyByEmail(String email) {
        CompanyDOSelective companyDOSelective = new CompanyDOSelective();
        CompanyDOSelective.Criteria criteria = companyDOSelective.createCriteria();

        criteria.andEmailEqualTo(email);
        criteria.andDeletedNotEqualTo(true);

        List<CompanyDO> companyDOList = mapper.selectByExample(companyDOSelective);

        if (CollectionUtils.isEmpty(companyDOList)) {
            return null;
        }

        if (companyDOList.size() != 1) {
            LOG.error("too many user returned!");
            throw new ToiletBizException("too many user returned!", BIZ_ERROR);
        }

        return companyDOList.get(0);
    }

    @Override
    public String insertCompanyDO(CompanyDO companyDO) {
        if (StringUtils.isEmpty(companyDO.getEmail()) || StringUtils.isEmpty(companyDO.getCreditCode()) || StringUtils.isEmpty(companyDO.getSource())) {
            //TODO throw exception code
            LOG.error("required params email, credit and source code can not be null");
            throw new ToiletBizException("required params email, credit and source code can not be null", BIZ_ERROR);
        }

        companyDO.setGmtCreate(new Date());
        companyDO.setGmtModified(new Date());
        companyDO.setVersion(0);
        companyDO.setDeleted(false);

        CompanyDO companyDOFromDb = getCompanyByEmail(companyDO.getEmail());

        if (companyDOFromDb != null) {
            LOG.error("user is exist");
            return companyDOFromDb.getEmail();
        }

        int count = mapper.insert(companyDO);

        if (count != 1) {
            LOG.error("insert user failed! companyDO: {}", companyDO);
            throw new ToiletBizException("insert user failed!", BIZ_ERROR);
        }

        return getCompanyByEmail(companyDO.getEmail()).getEmail();
    }

    @Override
    public CompanyDO getCompanyByLicense(String license) {
        CompanyDOSelective companyDOSelective = new CompanyDOSelective();
        CompanyDOSelective.Criteria criteria = companyDOSelective.createCriteria();

        criteria.andBusinessLicenseFilePathEqualTo(license);
        criteria.andDeletedNotEqualTo(true);

        List<CompanyDO> companyDOList = mapper.selectByExample(companyDOSelective);

        if (CollectionUtils.isEmpty(companyDOList)) {
            return null;
        }

        if (companyDOList.size() != 1) {
            LOG.error("too many user returned!");
            return null;
        }

        return companyDOList.get(0);
    }

    @Override
    public List<CompanyDO> getCompanyListByRole(Integer code) {
        CompanyDOSelective companyDOSelective = new CompanyDOSelective();
        CompanyDOSelective.Criteria criteria = companyDOSelective.createCriteria();

        criteria.andRoleEqualTo(code);
        criteria.andDeletedNotEqualTo(true);

        List<CompanyDO> companyDOList = mapper.selectByExample(companyDOSelective);

        if (CollectionUtils.isEmpty(companyDOList)) {
            return null;
        }

        return companyDOList;
    }

    @Override
    public String updateCompanyDO(CompanyDO companyDO) {
        if (companyDO.getId() == null ||
                StringUtils.isEmpty(companyDO.getEmail()) ||
                StringUtils.isEmpty(companyDO.getCreditCode())) {
            LOG.error("required params email, credit can not be null");
            throw new ToiletBizException("required params email, credit can not be null", BIZ_ERROR);
        }
        companyDO.setGmtModified(new Date());
        companyDO.setVersion(companyDO.getVersion() + 1);

        int count = mapper.updateByPrimaryKey(companyDO);

        if (count != 1) {
            LOG.error("update user failed! count: {}", count);
            throw new ToiletBizException("update user failed!", BIZ_ERROR);
        }

        return getCompanyByEmail(companyDO.getEmail()).getEmail();
    }
}
