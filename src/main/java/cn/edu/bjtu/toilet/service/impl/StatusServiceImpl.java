package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.service.StatusService;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class StatusServiceImpl implements StatusService {

    private static final Map<AuditStatus, List<AuditStatus>>  TARGET_STATUS= new HashMap<AuditStatus, List<AuditStatus>>(){

    };

    @Override
    public List<AuditStatus> getTargetStatus(AuditStatus status) {
        return null;
    }
}
