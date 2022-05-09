package cn.edu.bjtu.toilet.domain.request;

import cn.edu.bjtu.toilet.dao.model.PageRequest;
import lombok.Data;

@Data
public class ProductRequest extends PageRequest {
    private String email;
}
