package cn.edu.bjtu.toilet.domain.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserUpdateRequest {

    private String email;

    private String originPassword;

    private String password;

    private String confirmPassword;
}
