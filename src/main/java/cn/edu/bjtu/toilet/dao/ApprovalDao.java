package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;

public interface ApprovalDao {

    Integer insertApproval(ApprovalDO approvalDO);

    ApprovalDO getApprovalDOById(Integer id);

    ApprovalDO getApprovalDOByProductId(Integer productId);

    ApprovalDO getApprovalDOByPatternId(Integer patternId);

    ApprovalDO getApprovalDOBySource(String source);

    void updateApprovalById(ApprovalDO approvalDO);

}
