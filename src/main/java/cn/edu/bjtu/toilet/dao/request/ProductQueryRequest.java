package cn.edu.bjtu.toilet.dao.request;

import cn.edu.bjtu.toilet.constant.ProductStatus;
import cn.edu.bjtu.toilet.dao.model.PageRequest;
import lombok.Data;

@Data
public class ProductQueryRequest extends PageRequest {

    private String email;

    private String professorEmail;

    private ProductStatus productStatus;

}
