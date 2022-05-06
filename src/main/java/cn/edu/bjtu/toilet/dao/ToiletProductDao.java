package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.request.ProductQueryRequest;

import java.util.List;

public interface ToiletProductDao {

    ToiletProductDO insertProduct(ToiletProductDO productDO);

    ToiletProductDO queryProductById(Integer Id);

    List<ToiletProductDO> queryProductByPatternId(Integer patternId);

    ToiletProductDO queryProductBySource(String source);

    List<ToiletProductDO> queryAllProducts(String email);

    List<ToiletProductDO> queryAllProductsByPage(ProductQueryRequest request);

    ToiletProductDO updateProductBySource(ToiletProductDO productDO);
}
