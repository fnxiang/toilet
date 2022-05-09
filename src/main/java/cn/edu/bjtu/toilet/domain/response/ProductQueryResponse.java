package cn.edu.bjtu.toilet.domain.response;

import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import lombok.Data;

import java.util.List;

@Data
public class ProductQueryResponse {

    private Integer maxPage;

    private Integer currentPage;

    private Integer pageSize;

    private List<ToiletProductDTO> productDTOList;
}
