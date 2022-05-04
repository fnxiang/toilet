package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
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

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class UserDaoImpl implements UserDao {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private UserDOMapper mapper;

    @Override
    public UserDO getUserByEmailWithStatus(String email, Integer statusCode) {
        UserDOSelective userDOSelective = new UserDOSelective();
        UserDOSelective.Criteria criteria = userDOSelective.createCriteria();

        criteria.andEmailEqualTo(email);
        criteria.andStatusEqualTo(statusCode);
        criteria.andDeletedNotEqualTo(true);

        List<UserDO> userDOList = mapper.selectByExample(userDOSelective);

        if (CollectionUtils.isEmpty(userDOList)) {
            return null;
        }

        if (userDOList.size() != 1) {
            LOG.error("too many user returned!");
            throw new ToiletBizException("too many user returned!", BIZ_ERROR);
        }

        return userDOList.get(0);
    }

    @Override
    public List<UserDO> getUserByCode(Integer code) {

        UserDOSelective userDOSelective = new UserDOSelective();
        UserDOSelective.Criteria criteria = userDOSelective.createCriteria();

        criteria.andRoleEqualTo(code);
        criteria.andDeletedNotEqualTo(true);

        List<UserDO> userDOList = mapper.selectByExample(userDOSelective);

        if (CollectionUtils.isEmpty(userDOList)) {
            return null;
        }

        return userDOList;
    }

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
            throw new ToiletBizException("too many user returned!", BIZ_ERROR);
        }

        return userDOList.get(0);
    }

    @Override
    public String insertUserDO(UserDO userDO) {
        if (StringUtils.isEmpty(userDO.getEmail())&&StringUtils.isEmpty(userDO.getPassword()) && StringUtils.isEmpty(userDO.getSource())) {
            //TODO throw exception code
            LOG.error("required params email, password and source code can not be null");
            throw new ToiletBizException("required params email, credit and source code can not be null", BIZ_ERROR);
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
            throw new ToiletBizException("insert user failed!", BIZ_ERROR);
        }

        return getUserByEmail(userDO.getEmail()).getEmail();
    }

    @Override
    public String updateUserDO(UserDO userDO) {
        if (userDO.getId() == null ||
                StringUtils.isEmpty(userDO.getEmail())||
                StringUtils.isEmpty(userDO.getPassword()) ||
                StringUtils.isEmpty(userDO.getSource())) {
            LOG.error("required params email, password and source code can not be null");
            throw new ToiletBizException("required params email, credit and source code can not be null", BIZ_ERROR);
        }

        userDO.setGmtModified(new Date());
        userDO.setVersion(userDO.getVersion() + 1);

        int count = mapper.updateByPrimaryKey(userDO);

        if (count != 1) {
            LOG.error("insert user failed! userDO: {}", userDO);
            throw new ToiletBizException("insert user failed!", BIZ_ERROR);
        }

        return getUserByEmail(userDO.getEmail()).getEmail();
    }
}
