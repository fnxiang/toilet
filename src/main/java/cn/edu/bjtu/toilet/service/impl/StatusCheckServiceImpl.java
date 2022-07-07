package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.exception.ToiletBizException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
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

    private static final Map<AuditStatus, Set<AuditStatus>> transitionMap = Collections
            .unmodifiableMap(new HashMap<AuditStatus, Set<AuditStatus>>() {{
                put(AuditStatus.UNKNOWN, newHashSet(AuditStatus.WAITED_ASSIGN));
                put(AuditStatus.WAITED, newHashSet(AuditStatus.WAITED_ASSIGN));
                put(AuditStatus.WAITED_ASSIGN, newHashSet(AuditStatus.WAITED_PROFESSOR));
                put(AuditStatus.WAITED_PROFESSOR, newHashSet(AuditStatus.WAITED_ADMIN, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
                put(AuditStatus.WAITED_ADMIN, newHashSet(AuditStatus.APPROVAL, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
                put(AuditStatus.WAITED_AMEND, newHashSet(AuditStatus.WAITED_PROFESSOR, AuditStatus.DISCARD));
            }});

    @Override
    public Boolean isAllowedToTransform(AuditStatus now, AuditStatus target) {
        if (now.equals(target)) {
            return Boolean.TRUE;
        }

        if (transitionMap.get(now) != null && transitionMap.get(now).contains(target)) {
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
    public void transformProductToStatus(ToiletProductDO productDO, AuditStatus target) {
        if (isAllowedToTransform(AuditStatus.of(productDO.getStatus()), target)) {
            productDO.setStatus(target.getCode());
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

    @Override
    public void transformPatternToStatus(ToiletPatternDO patternDO, AuditStatus target) {
        if (isAllowedToTransform(AuditStatus.of(patternDO.getStatus()), target)) {
            patternDO.setStatus(target.getCode());
        } else {
            throw new ToiletBizException("status can not transform!", -1);
        }
    }
}
