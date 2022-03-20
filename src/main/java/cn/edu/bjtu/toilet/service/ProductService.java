package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;

public interface ProductService {

    ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO);
}
