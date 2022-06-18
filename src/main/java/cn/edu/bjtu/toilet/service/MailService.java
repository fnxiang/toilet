package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.domain.response.CommandResponse;

public interface MailService {
    CommandResponse getCode(String mailAddress, String operation);

    Boolean verifyCode(String mailAddress, String code);
}
