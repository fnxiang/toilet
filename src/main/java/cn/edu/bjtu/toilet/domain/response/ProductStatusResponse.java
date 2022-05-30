package cn.edu.bjtu.toilet.domain.response;

import lombok.Data;

import java.util.List;

@Data
public class ProductStatusResponse {

    private Boolean success;

    private List<String> status;

    private String errorMessage;

    public static ProductStatusResponse success() {
        ProductStatusResponse response = new ProductStatusResponse();
        response.setSuccess(true);
        return response;
    }

    public static ProductStatusResponse failed(String message) {
        ProductStatusResponse response = new ProductStatusResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
