package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.dao.domain.UserDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.UserDOMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Component
public class UserDaoImpl implements UserDao {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private UserDOMapper mapper;

    @Override
    public UserDO getUserByEmail(String email) {
        UserDOSelective userDOSelective = new UserDOSelective();
        UserDOSelective.Criteria criteria = userDOSelective.createCriteria();

        criteria.andEmailEqualTo(email);
        criteria.andDeletedNotEqualTo(true);

        List<UserDO> userDOList = mapper.selectByExample(userDOSelective);

        if (CollectionUtils.isEmpty(userDOList)) {
            return null;
        }

        if (userDOList.size() != 1) {
            LOG.error("too many user returned!");
            throw new ToiletSystemException("too many user returned!", "");
        }

        return userDOList.get(0);
    }

    @Override
    public String insertUserDO(UserDO userDO) {
        if (StringUtils.isEmpty(userDO.getEmail())&&StringUtils.isEmpty(userDO.getCreditCode()) && StringUtils.isEmpty(userDO.getSource())) {
            //TODO throw exception code
            LOG.error("required params email, credit and source code can not be null");
            throw new ToiletSystemException("required params email, credit and source code can not be null", "");
        }

        userDO.setGmtCreate(new Date());
        userDO.setGmtModified(new Date());
        userDO.setVersion(0);
        userDO.setDeleted(false);

        UserDO userDOFromDb = getUserByEmail(userDO.getEmail());

        if (userDOFromDb != null) {
            LOG.error("user is exist");
            return userDOFromDb.getEmail();
        }

        int count = mapper.insert(userDO);

        if (count != 1) {
            LOG.error("insert user failed! userDO: {}", userDO);
            throw new ToiletSystemException("insert user failed!", "");
        }

        return getUserByEmail(userDO.getEmail()).getEmail();
    }

    @Override
    public UserDO getUserByLicense(String license) {
        UserDOSelective userDOSelective = new UserDOSelective();
        UserDOSelective.Criteria criteria = userDOSelective.createCriteria();

        criteria.andBusinessLicenseFilePathEqualTo(license);
        criteria.andDeletedNotEqualTo(false);

        List<UserDO> userDOList = mapper.selectByExample(userDOSelective);

        if (CollectionUtils.isEmpty(userDOList)) {
            return null;
        }

        if (userDOList.size() != 1) {
            LOG.error("too many user returned!");
            return null;
        }

        return userDOList.get(0);
    }
}
