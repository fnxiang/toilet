package cn.edu.bjtu.toilet.domain.response;

import lombok.Data;

@Data
public class LoginResponse {

    private Boolean success;

    private String forwardUrl;

    private String errorMessage;

    public static LoginResponse success(String forwardUrl){
        LoginResponse response = new LoginResponse();
        response.setSuccess(true);
        response.setForwardUrl(forwardUrl);
        return response;
    }

    public static LoginResponse failed(String message){
        LoginResponse response = new LoginResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
