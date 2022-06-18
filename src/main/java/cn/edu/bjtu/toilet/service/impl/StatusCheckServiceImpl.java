package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.StatusCheckService;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static com.google.common.collect.Sets.newHashSet;

@Component
public class StatusCheckServiceImpl implements StatusCheckService {

    public static final Map<AuditStatus, Set<AuditStatus>> transitionMap = Collections
            .unmodifiableMap(new HashMap<AuditStatus, Set<AuditStatus>>() {{
                put(AuditStatus.WAITED, newHashSet(AuditStatus.WAITED_ASSIGN));
                put(AuditStatus.WAITED_ASSIGN, newHashSet(AuditStatus.PROCESSING));
                put(AuditStatus.PROCESSING, newHashSet(AuditStatus.APPROVAL, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
                put(AuditStatus.WAITED_AMEND, newHashSet(AuditStatus.PROCESSING));
            }});

    @Override
    public Boolean isAllowedToTransform(AuditStatus now, AuditStatus target) {
        if (now.equals(target)) {
            return Boolean.TRUE;
        }

        if (transitionMap.get(now).contains(target)) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

    @Override
    public void transformProductToStatus(ToiletProductDTO productDTO, AuditStatus target) {
        if (isAllowedToTransform(productDTO.getStatus(), target)) {
            productDTO.setStatus(target);
        } else {
            throw new ToiletBizException("status can not transform!", -1);
        }
    }

    @Override
    public void transformPatternToStatus(ToiletPatternDTO patternDTO, AuditStatus target) {
        if (isAllowedToTransform(patternDTO.getStatus(), target)) {
            patternDTO.setStatus(target);
        } else {
            throw new ToiletBizException("status can not transform!", -1);
        }
    }
}
