package cn.edu.bjtu.toilet.dao.request;

import cn.edu.bjtu.toilet.dao.model.PageRequest;
import lombok.Data;

@Data
public class ProductQueryRequest extends PageRequest {

    private String email;

    private String professorEmail;

}
