package cn.edu.bjtu.toilet.domain;

import lombok.Data;

@Data
public class UploadFileResponse {

    private Boolean success;

    private String errorMessage;

    public static UploadFileResponse success(){
        UploadFileResponse response = new UploadFileResponse();
        response.setSuccess(true);
        return response;
    }

    public static UploadFileResponse failed(String message){
        UploadFileResponse response = new UploadFileResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
