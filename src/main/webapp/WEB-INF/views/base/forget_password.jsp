<%--
  Created by IntelliJ IDEA.
  User: 18356
  Date: 2022/6/13
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>用户登录</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/base/res/logo.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/base/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/font-icon-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/dialog.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/style.default.css"
          id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/pages/login.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/style.css">
</head>
<body>
<section class="hero-area">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="contact-h-cont">
                    <h3 class="text-center"><a href="${pageContext.request.contextPath}/" target="_blank"><img
                            src="${pageContext.request.contextPath}/static/base/res/logo.png" class="img-fluid" alt=""></a>
                    </h3><br>
                    <h4 class="card-title">找回密码</h4>
                    <iframe src=""  name="iframeName" style="display: none"></iframe>
                    <form action="" target="iframeName">
                        <div class="form-group">
                            <input id="email" type="email" class="form-control" name="email" value="" required placeholder="请输入您的邮箱地址">
                        </div>
                        <div class="form-group" style="height: 40px;">
                            <input id="code" class="form-control" name="code" value="" required placeholder="请输入验证码">
                            <input type="button" id="getcode" value="发送验证码" class="btn btn-link" style="position: relative; left: 310px; top:-37px;"
                                   onclick="sendCode()">
                        </div>
                        <div class="form-group">
                            <input id="newPWD" type="password" class="form-control" name="newPWD" value="" required placeholder="请输入新密码">
                        </div>
                        <div class="form-group">
                            <input id="rePWD" type="password" class="form-control" name="rePWD" value="" required placeholder="请再次输入密码">
                        </div>

                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" onclick="resetPWD()">
                                重置密码
                            </button>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/toBasePage?url=login_final'">
                                返回登录
                            </button>
                        </div>
                    </form>
                    <div>
                    </div>
                </div>
            </div>
        </div>
        <div id="chongzhi" style="position: absolute; left: 720px; top: 400px; background: #99999975; height: 100px; display: none">
            <!-- 弹窗遮罩层 -->
            <div class="aclose">
                <a class="close" href="javascript:choseClose();">&times;</a>
            </div>
            <div class="contain" id="dialog">
                重置成功，
                <a id="time">2
                </a>s后跳转
            </div>
        </div>
    </div>
    <jsp:include page="../common/dialog.jsp"/>
</section>
<script src="${pageContext.request.contextPath}/static/base/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/bootstrap.min.js"></script>

<script>
    //短信验证码倒计时
    function getCode(){
        var btn = $('#getcode');
        var number = 60;
        var countdown = function(){
            if (number === 0) {
                btn.attr("disabled",false);
                btn.attr("value", "发送验证码");
                number = 60;
                return;
            } else {
                btn.attr("disabled",true);
                btn.attr("value", number + "s 后重新发送");
                number--;
            }
            setTimeout(countdown,1000);
        };
        setTimeout(countdown,1000);
    }

    function sendCode() {
        var data = new FormData();
        data.append("sendAddress", $('#email').val());
        $.ajax({
            url: "/toilet/mail/getForgetCode",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    show("验证码发送成功！");
                    getCode();
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }

    // 提交验证码
    function resetPWD() {
        var data = new FormData();
        data.append("requestEmail", $('#email').val());
        data.append("code", $('#code').val());
        var newPWD = $('#newPWD').val();
        var rePWD = $('#rePWD').val();
        data.append("pwd", newPWD);
        data.append("confirmPwd", rePWD);
        if(newPWD !== rePWD){
            show("两次输入密码不一致！");
        }
        else{
        $.ajax({
            url: "/toilet/pwd/reset",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    // 等待2秒后跳转
                    chose();
                    var countdown = function(){
                        var time = document.getElementById("time");
                        if(time.innerHTML == 0){
                            //等于0时清除计时
                            window.location.href="${pageContext.request.contextPath}/toBasePage?url=login_final";
                        }else{
                            time.innerHTML = time.innerHTML-1;
                        }
                        setTimeout(countdown,1000);
                    }
                    setTimeout(countdown,1000);
                } else {
                    show(result.errorMessage);
                }
            }
        });}
    }
</script>

<script>
    function chose() {
        $("#chongzhi").css("display", "block");
    }

    function choseClose() {
        $("#chongzhi").css("display", "none");
    }

    function close(){
        $(".content_dialog").css("height","90px");
        $(".dialog").css("display","none");
    }
</script>
</body>
</html>
