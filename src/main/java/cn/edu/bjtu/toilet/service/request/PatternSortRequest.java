package cn.edu.bjtu.toilet.service.request;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.dao.model.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class PatternSortRequest extends PageRequest {

    private String toiletType;

    private String sortBy;

    private Boolean isDesc;

    private List<AuditStatus> auditStatuses;

    private List<Integer> patternIds;
}
