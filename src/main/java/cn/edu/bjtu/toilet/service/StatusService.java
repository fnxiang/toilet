package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.AuditStatus;

import java.util.List;

public interface StatusService {

    List<AuditStatus> getTargetStatus(AuditStatus status);
}
