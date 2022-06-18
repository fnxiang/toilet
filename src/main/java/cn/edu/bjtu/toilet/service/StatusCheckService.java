package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;

public interface StatusCheckService {

    Boolean isAllowedToTransform(AuditStatus now, AuditStatus target);

    void transformProductToStatus(ToiletProductDTO productDTO, AuditStatus target);

    void transformPatternToStatus(ToiletPatternDTO patternDTO, AuditStatus target);
}
