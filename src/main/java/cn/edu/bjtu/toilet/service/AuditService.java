package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;

public interface AuditService {

    ApprovalDO updateApproval(ApprovalRequest request);

    ApprovalDO getApproval(ApprovalRequest request);

}
