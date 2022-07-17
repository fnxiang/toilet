package cn.edu.bjtu.toilet.domain.dto;

import cn.edu.bjtu.toilet.constant.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductSearchConditionsDTO {

    private String productType;

    private ProductStandardType standardType;

    private ProductTextureType textureType;

    private ProductLifeCycleType lifeCycleType;

    private ProductPriceType priceType;

    private ProductCleanCycleType cleanCycleType;
}
