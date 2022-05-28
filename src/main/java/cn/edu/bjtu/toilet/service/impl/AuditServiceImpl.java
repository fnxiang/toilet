package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.dao.ApprovalDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.service.AuditService;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;

@Component
public class AuditServiceImpl implements AuditService {

    @Resource
    private ApprovalDao approvalDao;

    @Resource
    private ToiletProductDao productDao;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    public ApprovalDO updateApproval(ApprovalRequest request) {

        ToiletProductDO productDO = productDao.queryProductById(Integer.valueOf(request.getProductId()));
        request.setProductBelongEmail(productDO.getCompanyEmail());
        ApprovalDO approvalDO = buildApproval(request);
        productDO.setStatus(request.getStatus().getCode());
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
    public ApprovalDO getApproval(ApprovalRequest request) {
        Integer productId = Integer.valueOf(request.getProductId());
        return approvalDao.getApprovalDOByProductId(productId);
    }

    private ApprovalDO buildApproval(ApprovalRequest request) {
        ApprovalDO approvalDO = new ApprovalDO();
        String source = buildApprovalSource(request);
        approvalDO.setProductId(Integer.valueOf(request.getProductId()));
        approvalDO.setApproverEmail(request.getProfessorEmail());
        approvalDO.setContent(request.getComment());
        approvalDO.setSource(source);

        return approvalDO;
    }

    private String buildApprovalSource(ApprovalRequest request) {
        return String.format("%s-%s-%s-%s", request.getProductBelongEmail(), request.getProfessorEmail(), "p", request.getProductId());
    }
}
