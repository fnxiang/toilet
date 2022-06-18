package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.Constants;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.service.MailService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/mail")
public class MailController {
    @Resource
    private MailService mailService;

    /**
     * 获取重置密码的验证码
     */
    @PostMapping("/getForgetCode")
    public CommandResponse getForgetCode(HttpServletRequest request){
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            String mailAddress = params.get("sendAddress");
            return mailService.getCode(mailAddress, Constants.FORGET_MAIL);
        } catch (Exception e) {
            return CommandResponse.failed(e.getMessage());
        }
    }

    /**
     * 获取重置密码的验证码
     */
    @PostMapping("/getRegisterCode")
    public CommandResponse getRegisterCode(HttpServletRequest request){
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            String mailAddress = params.get("sendAddress");
            return mailService.getCode(mailAddress, Constants.REGISTER_MAIL);
        } catch (Exception e) {
            return CommandResponse.failed(e.getMessage());
        }
    }
}
