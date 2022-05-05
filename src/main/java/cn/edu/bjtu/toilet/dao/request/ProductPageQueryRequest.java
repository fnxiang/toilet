package cn.edu.bjtu.toilet.dao.request;

import lombok.Data;

@Data
public class ProductPageQueryRequest {

    private String email;

    private Integer offset;

    private Integer limit;

}
