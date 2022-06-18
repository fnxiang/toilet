package cn.edu.bjtu.toilet.constant;

public class Constants {

    public static final String MAIL_CODE_KEY = "M";

    public static final String FORGET_MAIL = "forget_mail";

    public static final String REGISTER_MAIL = "register_mail";

    public static String getMailContent(String type) {
        if (type.equals(FORGET_MAIL)) {
            return "<html><head><title></title></head><body>" +
                    "尊敬的用户，您好<br/>" +
                    "您的验证码是：%s <br/>" +
                    "您可以复制此验证码并返回至厕所选型系统找回密码页面，以验证您的邮箱。<br/>" +
                    "此验证码只能使用一次，在" +
                    "%s" +
                    "分钟内有效。验证成功则自动失效。<br/>" +
                    "如果您没有进行上述操作，请忽略此邮件。";
        } else if (type.equals(REGISTER_MAIL)) {
            return "<html><head><title></title></head><body>" +
                    "您好<br/>" +
                    "您的验证码是：%s <br/>" +
                    "您可以复制此验证码并返回至厕所选型系统注册页面，以验证您的邮箱。<br/>" +
                    "此验证码只能使用一次，在" +
                    "%s" +
                    "分钟内有效。验证成功则自动失效。<br/>" +
                    "如果您没有进行上述操作，请忽略此邮件。";
        } else {
            return "";
        }
    }
}
