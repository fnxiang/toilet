package cn.edu.bjtu.toilet.dao.impl;

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

    @Override
    public String insertUserDO(UserDO userDO) {

        if (StringUtils.isEmpty(userDO.getEmail())&&StringUtils.isEmpty(userDO.getCreditCode())) {
            //TODO throw exception
            LOG.error("required params email and credit code can not be null");
            return "";
        }

        UserDO userDOFromDb = getUserByEmail(userDO.getEmail());

        if (userDOFromDb != null) {
            LOG.error("user is exist");
            return userDOFromDb.getEmail();
        }

        int count = mapper.insert(userDO);

        if (count != 1) {
            LOG.error("insert user failed! userDO: {}", userDO);
            return "";
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
