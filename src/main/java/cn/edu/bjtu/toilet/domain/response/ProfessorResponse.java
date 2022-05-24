package cn.edu.bjtu.toilet.domain.response;

import lombok.Data;

import java.util.Map;

@Data
public class ProfessorResponse {

    private Boolean success;

    private Map<String, String> nameMap;

    private String errorMessage;

    public static ProfessorResponse success() {
        ProfessorResponse response = new ProfessorResponse();
        response.setSuccess(true);
        return response;
    }

    public static ProfessorResponse failed(String message) {
        ProfessorResponse response = new ProfessorResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
