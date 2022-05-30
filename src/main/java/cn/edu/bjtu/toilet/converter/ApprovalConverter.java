package cn.edu.bjtu.toilet.converter;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.domain.dto.ApprovalDTO;
import org.springframework.beans.BeanUtils;

public class ApprovalConverter {

    public static ApprovalDTO toDTO(ApprovalDO approvalDO) {
        ApprovalDTO approvalDTO = new ApprovalDTO();
        BeanUtils.copyProperties(approvalDO, approvalDTO);
        approvalDTO.setStatus(AuditStatus.of(approvalDO.getStatus()));
        return approvalDTO;
    }

}
