package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.Constants;
import cn.edu.bjtu.toilet.dao.CompanyDao;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.helper.RedisHelper;
import cn.edu.bjtu.toilet.service.MailService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Component
public class MailServiceImpl implements MailService {

    @Resource
    private JavaMailSender mailSender;

    @Resource
    private RedisHelper redisHelper;

    @Value("${spring.mail.username}")
    private String mailUserName;

    @Value("${mail.code.overtime}")
    private Integer overtime;

    /**
     * 获取重置密码的验证码
     *
     * @param mailAddress 用户邮箱
     * @return
     */
    @Override
    public CommandResponse getCode(String mailAddress, String operation) {
        // 非空校验
        if (null == mailAddress || "".equals(mailAddress)) return CommandResponse.failed("邮箱不能为空！");

        String verifyCode = redisHelper.getCacheObject(Constants.MAIL_CODE_KEY + mailAddress);
        String gapCache = redisHelper.getCacheObject(Constants.MAIL_GAP_KEY + mailAddress);
        if (verifyCode == null) {
            verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);//生成短信验证码
        }

        if (gapCache != null) {
            return CommandResponse.failed("请稍后再发");
        }


        // 验证码存入redis并设置过期时间
        redisHelper.setCacheObject(Constants.MAIL_CODE_KEY + mailAddress, verifyCode, overtime, TimeUnit.MINUTES);

        // 编写邮箱内容
        String mailContent = Constants.getMailContent(operation);
        mailContent = String.format(mailContent, verifyCode, overtime);
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        // 发件配置并发送邮件
        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            //这里只是设置username 并没有设置host和password，因为host和password在springboot启动创建JavaMailSender实例的时候已经读取了
            mimeMessageHelper.setFrom(mailUserName);
            // 用户的邮箱地址
            mimeMessageHelper.setTo(mailAddress);
            mimeMessageHelper.addBcc(new InternetAddress("654879744@qq.com","接收人","utf-8"));
            // 邮件的标题
            mimeMessage.setSubject("厕所选型系统-找回密码");
            // 上面所拼接的邮件内容
            mimeMessageHelper.setText(mailContent, true);
            mailSender.send(mimeMessage);
            redisHelper.setCacheObject(Constants.MAIL_GAP_KEY + mailAddress, "one", 1, TimeUnit.MINUTES);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return CommandResponse.success();
    }

    @Override
    public Boolean verifyCode(String mailAddress, String code) {
        String verifyCode = redisHelper.getCacheObject(Constants.MAIL_CODE_KEY + mailAddress);
        if (StringUtils.isEmpty(verifyCode)) {
            throw new ToiletBizException("verify code has expired!", -1);
        }

        return verifyCode.equals(code);
    }
}
