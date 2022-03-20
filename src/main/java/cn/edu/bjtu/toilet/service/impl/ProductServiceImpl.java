package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.converter.ProductConverter;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class ProductServiceImpl implements ProductService {

    @Resource
    private ToiletProductDao toiletProductDao;

    @Override
    public ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO) {
        ToiletProductDO productDO = toiletProductDao.saveProductWithPattern(ProductConverter.toDO(productDTO), ProductConverter.toDO(patternDTO));
        ToiletPatternDO patternDO = toiletProductDao.queryPatternById(productDO.getPatternId());

        ToiletProductDTO productDTOFromDb = ProductConverter.toDTO(productDO);
        ToiletPatternDTO patternDTOFromDb = ProductConverter.toDTO(patternDO);

        productDTOFromDb.setToiletPatternDTO(patternDTOFromDb);
        return productDTOFromDb;
    }
}
