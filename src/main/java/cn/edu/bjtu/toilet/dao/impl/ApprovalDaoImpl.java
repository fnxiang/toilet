package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.dao.ApprovalDao;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.ApprovalDOMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class ApprovalDaoImpl implements ApprovalDao {

    @Resource
    private ApprovalDOMapper approvalDOMapper;

    @Override
    public ApprovalDO getApprovalDOById(Integer id) {

        if (Objects.isNull(id) || id <= 0) {
            throw new ToiletBizException("approval id can not be null", BIZ_ERROR);
        }

        ApprovalDOSelective approvalDOSelective = new ApprovalDOSelective();
        ApprovalDOSelective.Criteria criteria = approvalDOSelective.createCriteria();
        criteria.andIdEqualTo(id);
        criteria.andDeletedNotEqualTo(true);

        List<ApprovalDO> approvalDOS = approvalDOMapper.selectByExample(approvalDOSelective);

        if (CollectionUtils.isEmpty(approvalDOS)) {
            return null;
        }

        if (approvalDOS.size() != 1) {
            throw new ToiletBizException("too many approval results returned", BIZ_ERROR);
        }

        return approvalDOS.get(0);
    }

    @Override
    public Integer insertApproval(ApprovalDO approvalDO) {

        if (Objects.isNull(approvalDO.getApproverId()) && (Objects.isNull(approvalDO.getProductId())&&Objects.isNull(approvalDO.getPatternId()))) {
            throw new ToiletBizException("approverId or productId or patternId can not be null", BIZ_ERROR);
        }

        approvalDO.setGmtCreate(new Date());
        approvalDO.setGmtModified(new Date());
        approvalDO.setDeleted(false);
        approvalDO.setVersion(0);

        int pKey = approvalDOMapper.insert(approvalDO);

        if (pKey < 1) {
            throw new ToiletBizException("insert approval error", BIZ_ERROR);
        }

        return pKey;
    }

    @Override
    public ApprovalDO getApprovalDOByProductId(Integer productId) {
        ApprovalDOSelective approvalDOSelective = new ApprovalDOSelective();
        ApprovalDOSelective.Criteria criteria = approvalDOSelective.createCriteria();
        criteria.andProductIdEqualTo(productId);
        criteria.andDeletedNotEqualTo(true);

        List<ApprovalDO> approvalDOS = approvalDOMapper.selectByExampleWithBLOBs(approvalDOSelective);

        if (CollectionUtils.isEmpty(approvalDOS)) {
            return null;
        }

        if (approvalDOS.size() != 1) {
            throw new ToiletBizException("too many approval results returned", BIZ_ERROR);
        }
        return approvalDOS.get(0);
    }

    @Override
    public ApprovalDO getApprovalDOBySource(String source) {
        ApprovalDOSelective approvalDOSelective = new ApprovalDOSelective();
        ApprovalDOSelective.Criteria criteria = approvalDOSelective.createCriteria();
        criteria.andSourceEqualTo(source);
        criteria.andDeletedNotEqualTo(true);

        List<ApprovalDO> approvalDOS = approvalDOMapper.selectByExample(approvalDOSelective);

        if (CollectionUtils.isEmpty(approvalDOS)) {
            return null;
        }

        if (approvalDOS.size() != 1) {
            throw new ToiletBizException("too many approval results returned", BIZ_ERROR);
        }
        return approvalDOS.get(0);
    }

    @Override
    public void updateApprovalById(ApprovalDO approvalDO) {
        ApprovalDO approvalDOFromDb = getApprovalDOById(approvalDO.getId());
        approvalDO.setGmtCreate(approvalDOFromDb.getGmtCreate());
        approvalDO.setGmtModified(new Date());
        approvalDO.setVersion(approvalDOFromDb.getVersion());
        approvalDO.setDeleted(approvalDOFromDb.getDeleted());
        approvalDO.setSource(approvalDOFromDb.getSource());

        ApprovalDOSelective approvalDOSelective = new ApprovalDOSelective();
        ApprovalDOSelective.Criteria criteria = approvalDOSelective.createCriteria();
        criteria.andIdEqualTo(approvalDO.getId());
        criteria.andDeletedNotEqualTo(true);

       int count = approvalDOMapper.updateByExampleWithBLOBs(approvalDO, approvalDOSelective);

        if (count != 1) {
            throw new ToiletBizException("too many approval updated", BIZ_ERROR);
        }
    }
}
