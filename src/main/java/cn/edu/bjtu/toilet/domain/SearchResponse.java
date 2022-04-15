package cn.edu.bjtu.toilet.domain;

import lombok.Data;

@Data
public class SearchResponse {

    private Boolean success;

    private String errorMessage;

    public static SearchResponse success(){
        SearchResponse response = new SearchResponse();
        response.setSuccess(true);
        return response;
    }

    public static SearchResponse failed(String message){
        SearchResponse response = new SearchResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
