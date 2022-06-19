package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.Constants;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.MailService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/mail")
public class MailController {
    @Resource
    private MailService mailService;

    @Resource
    private UserService userService;

    @Resource
    private CompanyService companyService;

    /**
     * 获取重置密码的验证码
     */
    @PostMapping("/getForgetCode")
    public CommandResponse getForgetCode(HttpServletRequest request){
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            String mailAddress = params.get("sendAddress");
            // 账号存在校验
            UserDO userDO = userService.queryUserByEmail(mailAddress);
            CompanyDO companyDO = companyService.queryCompanyByEmail(mailAddress);
            if (null == userDO && companyDO == null) return CommandResponse.failed("User not found!");
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
            UserDO userDO = userService.queryUserByEmail(mailAddress);
            CompanyDO companyDO = companyService.queryCompanyByEmail(mailAddress);
            if (Objects.isNull(userDO)&&Objects.isNull(companyDO)) {
                return mailService.getCode(mailAddress, Constants.REGISTER_MAIL);
            }
            return CommandResponse.failed("用户已存在");
        } catch (Exception e) {
            return CommandResponse.failed(e.getMessage());
        }
    }
}
