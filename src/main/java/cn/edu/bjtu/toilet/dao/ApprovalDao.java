package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;

public interface ApprovalDao {

    Integer insertApproval(ApprovalDO approvalDO);

    ApprovalDO getApprovalDOById(Integer id);

    ApprovalDO getApprovalDOByProductId(Integer id);

    void updateApprovalById(ApprovalDO approvalDO);

}
