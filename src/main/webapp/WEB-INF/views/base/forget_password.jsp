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
                    <form action="#" id="first">
                        <div class="form-group">
                            <input id="email" type="email" class="form-control" name="email" value="" required placeholder="请输入您的邮箱地址">
                        </div>
                        <div class="form-group">
                            <input id="code" class="form-control" name="code" value="" required placeholder="请输入验证码">
                            <input type="button" id="getcode" value="发送验证码" class="btn btn-link" style="position: relative; left: 310px; top:-37px;"
                                   onclick="getCode()">
                        </div>

                        <div class="form-group text-center">
                            <button class="btn btn-primary" onclick="resetPWD()">
                                重置密码
                            </button>
                        </div>
                    </form>
                    <form id="second" action="#" style="display: none">
                        <div class="form-group">
                            <input id="newPWD" class="form-control" name="newPWD" value="" required placeholder="请输入新密码">
                        </div>
                        <div class="form-group">
                            <input id="rePWD" class="form-control" name="rePWD" value="" required placeholder="请再次输入密码">
                        </div>
                        <div class="form-group m-0">
                            <button  class="btn btn-primary" onclick="commit()">
                                确认修改
                            </button>
                        </div>
                    </form>
                    <div>
                    </div>
                </div>
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
        sendCode();
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
            url: "/toilet/mail/getCode",
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
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }


    // 提交验证码
    function resetPWD() {
        var data = new FormData();
        data.append("email", $('#email').val());
        data.append("code", $('#code').val());
        $.ajax({
            url: "/toilet/verifyCode",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    $('#first').get(0).style.display = "none";
                    $('#second').get(0).style.display = "";
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }
    // 提交新密码
    function commit() {
        var data = new FormData();
        var newPWD = $('#newPWD').val();
        var rePWD = $('#rePWD').val();
        if(newPWD != rePWD){
            show("两次输入密码不一致！");
        }
        else{
            data.append("email", $('#email').val());
            data.append("PWD", newPWD);
            $.ajax({
                url: "/toilet/changePWD",
                type: "POST",
                dataType: "json",
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result.success) {
                        show("修改成功！");
                        location.href="${pageContext.request.contextPath}/toBasePage?url=login_final"

                    } else {
                        show(result.errorMessage);
                    }
                }
            });
        }
    }
</script>
</body>
</html>
