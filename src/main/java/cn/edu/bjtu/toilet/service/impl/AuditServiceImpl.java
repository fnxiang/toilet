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

        ApprovalDO approvalDO = buildApproval(request);

        return null;
    }

    private ApprovalDO buildApproval(ApprovalRequest request) {
        ApprovalDO approvalDO = new ApprovalDO();
        String source = buildApprovalSource(request);
        approvalDO.setProductId(Integer.valueOf(request.getProductId()));
        approvalDO.setApproverEmail(request.getProfessorEmail());
        approvalDO.setContent(request.getComment());
        approvalDO.setSource(source);

        ToiletProductDO productDO = productDao.queryProductById(Integer.valueOf(request.getProductId()));
        productDO.setStatus(request.getStatus().getCode());

        transactionTemplate.execute(status -> {
            approvalDao.insertApproval(approvalDO);
            productDao.updateProductBySource(productDO);
           return null;
        });
        return approvalDao.getApprovalDOBySource(source);
    }

    private String buildApprovalSource(ApprovalRequest request) {
        return String.format("%s-%s-%s", request.getProfessorEmail(), "p", request.getProductId());
    }
}
