package cn.edu.bjtu.toilet.domain.request;

import cn.edu.bjtu.toilet.constant.ProductStatus;
import cn.edu.bjtu.toilet.dao.model.PageRequest;
import cn.edu.bjtu.toilet.domain.dto.ProductSearchConditionsDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ProductSortRequest extends PageRequest {
    private String email = "";

    private ProductSearchConditionsDTO searchCondition;

    private ProductStatus productStatus;
}
