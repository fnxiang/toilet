package cn.edu.bjtu.toilet.domain.response;

import lombok.Data;

@Data
public class CommandResponse {

    private Boolean success;

    private String errorMessage;

    public static CommandResponse success(){
        CommandResponse response = new CommandResponse();
        response.setSuccess(true);
        return response;
    }

    public static CommandResponse failed(String message){
        CommandResponse response = new CommandResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
