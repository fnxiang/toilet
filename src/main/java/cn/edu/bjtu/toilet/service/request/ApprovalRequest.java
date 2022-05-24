package cn.edu.bjtu.toilet.service.request;

import cn.edu.bjtu.toilet.constant.ProductStatus;
import lombok.Data;

@Data
public class ApprovalRequest {

    private String productId;

    private String professorEmail;

    private ProductStatus status;

    private String comment;
}
