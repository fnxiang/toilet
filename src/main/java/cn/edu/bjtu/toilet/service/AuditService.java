package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;

public interface AuditService {

    ApprovalDO updateProductApproval(ApprovalRequest request);

    ApprovalDO updatePatternApproval(ApprovalRequest request);

    ApprovalDO getApproval(ApprovalRequest request);

}
