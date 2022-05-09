package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.domain.request.ProductRequest;
import cn.edu.bjtu.toilet.domain.response.ProductQueryResponse;

import java.util.List;

public interface ProductService {

    ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO);

    ToiletPatternDTO savePattern(ToiletPatternDTO patternDTO);

    List<ToiletProductDTO> queryAllProductList(String email);

    ProductQueryResponse queryPageProduct(ProductRequest request);

    List<ToiletProductDTO> queryProductListByPattern(Integer patternId);

    ToiletProductDTO queryToiletById(String id);

    List<ToiletPatternDTO> queryAllPattern();
}
