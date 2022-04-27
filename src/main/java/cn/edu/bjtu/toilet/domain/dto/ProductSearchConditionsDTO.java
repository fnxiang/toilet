package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.*;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductSearchConditionsDTO {

    private ProductStandardType standardType;

    private ProductTextureType textureType;

    private ProductLifeCycleType lifeCycleType;

    private ProductPriceType priceType;

    private ProductCleanCycleType cleanCycleType;
}
