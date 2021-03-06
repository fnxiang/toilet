package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.domain.dto.ProductSearchConditionsDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.domain.request.ProductSortRequest;
import cn.edu.bjtu.toilet.domain.response.ProductQueryResponse;

import java.util.List;

public interface ProductService {

    ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO);

    ToiletPatternDTO savePattern(ToiletPatternDTO patternDTO);

    List<ToiletProductDTO> queryAllProductList(String email);

    List<ToiletProductDTO> queryAllProductList(String email, List<AuditStatus> statuses);

    List<ToiletProductDTO> queryProductListByProfessor(String email);

    ProductQueryResponse queryPageProduct(ProductSortRequest request);

    ProductQueryResponse queryPageProductWithCondition(ProductSortRequest request, ProductSearchConditionsDTO searchConditions);

    List<ToiletProductDTO> queryProductListByPattern(Integer patternId);

    ToiletProductDTO queryToiletById(String id);

    List<ToiletPatternDTO> queryAllPattern(String email);

    ToiletProductDTO updateProduct(ToiletProductDTO productDTO);

    void deleteProduct(String id);
}
