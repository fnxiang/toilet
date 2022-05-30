package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.constant.ProductStatus;
import cn.edu.bjtu.toilet.service.StatusService;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class StatusServiceImpl implements StatusService {

    private static final Map<ProductStatus, List<ProductStatus>>  TARGET_STATUS= new HashMap<ProductStatus, List<ProductStatus>>(){

    };

    @Override
    public List<ProductStatus> getTargetStatus(ProductStatus status) {
        return null;
    }
}
