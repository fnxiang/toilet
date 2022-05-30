package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.domain.dto.ApprovalDTO;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;

public interface AuditService {

    ApprovalDO updateProductApproval(ApprovalRequest request);

    ApprovalDO updatePatternApproval(ApprovalRequest request);

    ApprovalDTO getApproval(ApprovalRequest request);

}
