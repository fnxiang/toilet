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
import java.util.List;
import java.util.stream.Collectors;

@Component
public class ProductServiceImpl implements ProductService {

    @Resource
    private ToiletProductDao toiletProductDao;

    @Override
    public List<ToiletProductDTO> queryAllProductList(String email) {
        List<ToiletProductDO> productDOS = toiletProductDao.queryAllProducts(email);
        List<ToiletProductDTO> productDTOS = productDOS.stream().map(item -> {
            ToiletProductDTO toiletProductDTO = ProductConverter.toDTO(item);
            ToiletPatternDO toiletPatternDO = toiletProductDao.queryPatternById(item.getPatternId());
            toiletProductDTO.setToiletPatternDTO(ProductConverter.toDTO(toiletPatternDO));
            return toiletProductDTO;
        }).collect(Collectors.toList());
        return productDTOS;
    }

    @Override
    public ToiletProductDTO queryToiletById(String id) {
        ToiletProductDO productDO = toiletProductDao.queryProductById(Integer.valueOf(id));
        ToiletPatternDO patternDO = toiletProductDao.queryPatternById(productDO.getPatternId());
        ToiletProductDTO productDTO = ProductConverter.toDTO(productDO);
        productDTO.setToiletPatternDTO(ProductConverter.toDTO(patternDO));

        return productDTO;
    }

    @Override
    public List<ToiletPatternDTO> queryAllPattern() {
        return toiletProductDao.queryAllPattern().stream().map(ProductConverter::toDTO).filter(item -> item.getPatternType()!=null).collect(Collectors.toList());
    }

    @Override
    public ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO) {
        ToiletProductDO productDO = toiletProductDao.saveProductWithPattern(ProductConverter.toDO(productDTO), ProductConverter.toDO(patternDTO));
        ToiletPatternDO patternDO = toiletProductDao.queryPatternById(productDO.getPatternId());

        ToiletProductDTO productDTOFromDb = ProductConverter.toDTO(productDO);
        ToiletPatternDTO patternDTOFromDb = ProductConverter.toDTO(patternDO);

        productDTOFromDb.setToiletPatternDTO(patternDTOFromDb);
        return productDTOFromDb;
    }

    @Override
    public ToiletPatternDTO savePattern(ToiletPatternDTO patternDTO) {
        ToiletPatternDO patternDO = toiletProductDao.savePattern(ProductConverter.toDO(patternDTO));

        patternDTO = ProductConverter.toDTO(patternDO);
        return patternDTO;
    }
}
