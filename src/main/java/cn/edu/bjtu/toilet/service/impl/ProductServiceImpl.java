package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.converter.ProductConverter;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class ProductServiceImpl implements ProductService {

    public static final Integer DEFAULT_SORT_INDEX = 1;

    public static final String DEFAULT_SORT_USAGE = "default";

    @Resource
    private ToiletProductDao toiletProductDao;

    @Resource
    private ToiletPatternDao toiletPatternDao;

    @Resource
    private TransactionTemplate template;

    @Override
    public List<ToiletProductDTO> queryAllProductList(String email) {
        List<ToiletProductDO> productDOS = toiletProductDao.queryAllProducts(email);
        List<ToiletProductDTO> productDTOS = productDOS.stream().map(item -> {
            ToiletProductDTO toiletProductDTO = ProductConverter.toDTO(item);
            ToiletPatternDO toiletPatternDO = toiletPatternDao.queryPatternById(item.getPatternId());
            toiletProductDTO.setToiletPatternDTO(ProductConverter.toDTO(toiletPatternDO));
            return toiletProductDTO;
        }).collect(Collectors.toList());
        return productDTOS;
    }

    @Override
    public ToiletProductDTO queryToiletById(String id) {
        ToiletProductDO productDO = toiletProductDao.queryProductById(Integer.valueOf(id));
        ToiletPatternDO patternDO = toiletPatternDao.queryPatternById(productDO.getPatternId());
        ToiletProductDTO productDTO = ProductConverter.toDTO(productDO);
        productDTO.setToiletPatternDTO(ProductConverter.toDTO(patternDO));

        return productDTO;
    }

    @Override
    public List<ToiletPatternDTO> queryAllPattern() {
        return toiletPatternDao.queryAllPattern().stream().map(ProductConverter::toDTO).filter(item -> item.getPatternType() != null).collect(Collectors.toList());
    }

    /**
     * 保存产品
     */
    @Override
    public ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO) {
        ToiletProductDO productDO = ProductConverter.toDO(productDTO);
        if (productDTO.getIsNewPattern()) {
            template.execute(status -> {
                ToiletPatternDO patternDO = toiletPatternDao.savePattern(ProductConverter.toDO(patternDTO));
                /**选择默认的权重*/
                ToiletPatternSortDO sortDO = toiletPatternDao.queryPatternSortId(DEFAULT_SORT_INDEX, DEFAULT_SORT_USAGE);

                productDO.setPatternId(patternDO.getId());
                productDO.setPatternSortId(sortDO.getId());

                ToiletProductDO productDOFromDb = toiletProductDao.queryProductBySource(buildProductSource(productDTO));
                productDO.setSource(buildProductSource(productDTO));
                if (productDOFromDb == null) {
                    toiletProductDao.insertProduct(productDO);
                } else {
                    toiletProductDao.updateProductBySource(productDO);
                }
                return null;
            });
        } else {
            template.execute(status -> {
                ToiletPatternDO patternDO = toiletPatternDao.queryPatternBySource(buildPatternSource(patternDTO));
                if (patternDO == null) {
                    throw new ToiletBizException("模式不存在，请选择新建模式！", BIZ_ERROR);
                }
                productDO.setPatternId(patternDO.getId());

                ToiletPatternSortDO sortDO = toiletPatternDao.queryPatternSortId(patternDO.getId(), productDTO.getPurpose());

                if (sortDO == null) {
                    sortDO = toiletPatternDao.queryPatternSortId(DEFAULT_SORT_INDEX, DEFAULT_SORT_USAGE);
                }

                productDO.setPatternSortId(sortDO.getId());
                ToiletProductDO productDOFromDb = toiletProductDao.queryProductBySource(buildProductSource(productDTO));

                productDO.setSource(buildProductSource(productDTO));
                if (productDOFromDb == null) {
                    toiletProductDao.insertProduct(productDO);
                } else {
                    toiletProductDao.updateProductBySource(productDO);
                }

                return null;
            });
        }
        ToiletProductDO productDOFromDB = toiletProductDao.queryProductBySource(buildProductSource(productDTO));
        ToiletPatternDO patternDO = toiletPatternDao.queryPatternById(productDOFromDB.getPatternId());

        ToiletProductDTO productDTOFromDB = ProductConverter.toDTO(productDOFromDB);
        productDTOFromDB.setToiletPatternDTO(ProductConverter.toDTO(patternDO));
        return productDTOFromDB;
    }

    private String buildProductSource(ToiletProductDTO productDTO) {
        return String.format("%s-%s-%s", productDTO.getProductName(), productDTO.getPatternName(), productDTO.getCompanyEmail());
    }

    private String buildPatternSource(ToiletPatternDTO patternDTO) {
        return String.format("%s-%s", patternDTO.getProductType(), patternDTO.getPatternType());
    }

    @Override
    public ToiletPatternDTO savePattern(ToiletPatternDTO patternDTO) {
        ToiletPatternDO patternDO = toiletPatternDao.savePattern(ProductConverter.toDO(patternDTO));

        patternDTO = ProductConverter.toDTO(patternDO);
        return patternDTO;
    }
}
