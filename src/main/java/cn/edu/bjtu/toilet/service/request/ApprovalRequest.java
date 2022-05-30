package cn.edu.bjtu.toilet.service.request;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import lombok.Data;

@Data
public class ApprovalRequest {

    private String productId;

    private String patternId;

    private String professorEmail;

    private AuditStatus status;

    private String comment;

    private String productBelongEmail;
}
