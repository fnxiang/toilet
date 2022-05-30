package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import lombok.Data;

import java.util.Date;

@Data
public class ApprovalDTO {

    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private Integer type;

    private AuditStatus status;

    private Integer approverId;

    private Integer productId;

    private Integer patternId;

    private String approverEmail;

    private String content;
}
