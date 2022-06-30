package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.exception.ToiletBizException;
import cn.edu.bjtu.toilet.converter.ApprovalConverter;
import cn.edu.bjtu.toilet.dao.ApprovalDao;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.domain.dto.ApprovalDTO;
import cn.edu.bjtu.toilet.service.AuditService;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

@Component
public class AuditServiceImpl implements AuditService {

    @Resource
    private ApprovalDao approvalDao;

    @Resource
    private ToiletProductDao productDao;

    @Resource
    private ToiletPatternDao patternDao;

    @Resource
    private StatusCheckServiceImpl statusCheckService;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    public ApprovalDO updateProductApproval(ApprovalRequest request) {

        ToiletProductDO productDO = productDao.queryProductById(Integer.valueOf(request.getProductId()));
        request.setProductBelongEmail(productDO.getCompanyEmail());
        ApprovalDO approvalDO = buildApproval(request);
        statusCheckService.transformProductToStatus(productDO, request.getStatus());
        ApprovalDO approvalDOFromDb = approvalDao.getApprovalDOBySource(buildApprovalSource(request));

        transactionTemplate.execute(status -> {
            if (approvalDOFromDb == null) {
                approvalDao.insertApproval(approvalDO);
            } else {
                approvalDO.setId(approvalDOFromDb.getId());
                approvalDO.setVersion(approvalDOFromDb.getVersion());
                approvalDO.setDeleted(approvalDOFromDb.getDeleted());
                approvalDao.updateApprovalById(approvalDO);
            }

            productDao.updateProductBySource(productDO);
            return null;
        });
        return approvalDao.getApprovalDOBySource(buildApprovalSource(request));
    }

    @Override
    public ApprovalDO updatePatternApproval(ApprovalRequest request) {
        ToiletPatternDO patternDO = patternDao.queryPatternById(Integer.valueOf(request.getPatternId()));
        ApprovalDO approvalDO = buildApproval(request);
        statusCheckService.transformPatternToStatus(patternDO, request.getStatus());
        ApprovalDO approvalDOFromDb = approvalDao.getApprovalDOBySource(buildApprovalSource(request));

        transactionTemplate.execute(status -> {
            if (approvalDOFromDb == null) {
                approvalDao.insertApproval(approvalDO);
            } else {
                approvalDO.setId(approvalDOFromDb.getId());
                approvalDO.setVersion(approvalDOFromDb.getVersion());
                approvalDO.setDeleted(approvalDOFromDb.getDeleted());
                approvalDao.updateApprovalById(approvalDO);
            }

            patternDao.updatePatternBySource(patternDO, patternDO.getSource());
            return null;
        });
        return approvalDao.getApprovalDOBySource(buildApprovalSource(request));
    }

    @Override
    public ApprovalDTO getApproval(ApprovalRequest request) {

        if (request.getProductId()==null&&request.getPatternId()==null) {
            throw new ToiletBizException("product id and pattern id is null!", -1);
        }

        ApprovalDO approvalDO;
        if (request.getProductId()!=null) {
            Integer productId = Integer.valueOf(request.getProductId());
            approvalDO = approvalDao.getApprovalDOByProductId(productId);
        } else {
            Integer patternId = Integer.valueOf(request.getPatternId());
            approvalDO = approvalDao.getApprovalDOByPatternId(patternId);
        }

        if (approvalDO == null) {
            return null;
        }

        return ApprovalConverter.toDTO(approvalDO);
    }

    private ApprovalDO buildApproval(ApprovalRequest request) {
        ApprovalDO approvalDO = new ApprovalDO();
        String source = buildApprovalSource(request);
        if (request.getProductId() == null) {
            approvalDO.setPatternId(Integer.valueOf(request.getPatternId()));
        } else {
            approvalDO.setProductId(Integer.valueOf(request.getProductId()));
        }
        approvalDO.setApproverEmail(request.getProfessorEmail());
        approvalDO.setStatus(request.getStatus().getCode());
        approvalDO.setContent(request.getComment());
        approvalDO.setSource(source);

        return approvalDO;
    }

    private String buildApprovalSource(ApprovalRequest request) {
        String tag = StringUtils.isEmpty(request.getProductId())?"PR":"PA";
        return String.format("%s-%s-%s-%s", request.getProductBelongEmail(), request.getProfessorEmail(), tag, request.getProductId());
    }
}
