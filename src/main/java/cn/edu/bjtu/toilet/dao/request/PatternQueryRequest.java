package cn.edu.bjtu.toilet.dao.request;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.dao.model.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class PatternQueryRequest extends PageRequest {
    private String usage = "公厕";

    private List<Integer> statuses;

    private List<Integer> targetPatternIds;
}
