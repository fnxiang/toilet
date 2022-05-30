package cn.edu.bjtu.toilet.domain;

import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import lombok.Data;

import java.util.List;

@Data
public class ProductResponse {

    private Boolean success;

    private List<ToiletProductDTO> productList;

    private String errorMessage;

    public static ProductResponse success(){
        ProductResponse response = new ProductResponse();
        response.setSuccess(true);
        return response;
    }

    public static ProductResponse failed(String message){
        ProductResponse response = new ProductResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
