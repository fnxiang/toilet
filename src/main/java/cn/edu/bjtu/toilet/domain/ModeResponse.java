package cn.edu.bjtu.toilet.domain;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class ModeResponse {

    private Boolean success;

    private Map<String, List<String>> selectMap;

    private Map<String, ToiletPatternDTO> patternDTOMap;

    private String errorMessage;

    public static ModeResponse success(){
        ModeResponse response = new ModeResponse();
        response.setSuccess(true);
        return response;
    }

    public static ModeResponse failed(String message){
        ModeResponse response = new ModeResponse();
        response.setSuccess(false);
        response.setErrorMessage(message);
        return response;
    }
}
