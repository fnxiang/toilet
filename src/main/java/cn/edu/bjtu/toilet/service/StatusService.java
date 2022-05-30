package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.ProductStatus;

import java.util.List;

public interface StatusService {

    List<ProductStatus> getTargetStatus(ProductStatus status);
}
