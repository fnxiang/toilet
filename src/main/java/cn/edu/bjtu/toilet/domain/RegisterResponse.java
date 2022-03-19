package cn.edu.bjtu.toilet.domain;

import lombok.Data;

@Data
public class RegisterResponse {

    private Boolean success;

    private String errorMessage;

    public static RegisterResponse success(){
        RegisterResponse response = new RegisterResponse();
        response.setSuccess(true);
        return response;
    }

    public static RegisterResponse failed(String message){
        RegisterResponse response = new RegisterResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
