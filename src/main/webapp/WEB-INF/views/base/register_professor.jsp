<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>用户注册</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/base/res/logo.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/font-icon-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/pages/register.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/pages/login.css">
	
	<style>
		label.xrequired:before {
			content: '* ';
			color: red;
		}
	</style>
</head>

<body> 
	<section>
		<div class="overlay"></div>
        <div class="container">
            <!--***** CONTENT *****-->     
            <div class="row" style="padding-top: 50px;"> 
                <!--***** USER INFO *****-->
                <div class="col-md-12">
                    <div class="card form" id="form1">
                        <div class="card-header">
                            <h3><a href="" target="_blank"><img src="${pageContext.request.contextPath}/static/base/res/logo.png" class="img-fluid" alt=""></a> 专家用户注册</h3>
                        </div>
                        <br>
                        <form>
                            <div class="row">
								<div class="col-md-12">
									<div class="form-group row">
                                        <label for="userName" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">姓名：</label>
                                        <input type="text" class="form-control col-sm-9" id="userName" placeholder="姓名">
                                    </div>
									<div class="form-group row">
                                        <label for="company" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">单位：</label>
                                        <input type="text" class="form-control col-sm-9" id="company" placeholder="单位">
                                    </div>
									<div class="form-group row">
										<label for="position" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">职务：</label>
										<input type="text" required class="form-control col-sm-9" id="position" placeholder="职务">
									</div>
									<div class="form-group row">
										<label for="title" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">职称：</label>
										<input type="text" required class="form-control col-sm-9" id="title" placeholder="职称">
									</div>
									<div class="form-group row">
										<label for="phoneNum" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">手机号：</label>
										<input type="text" class="form-control col-sm-9" id="phoneNum" placeholder="手机号">
									</div>
									<div class="form-group row">
										<label for="emailAddress" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">邮箱：</label>
										<input type="email" class="form-control col-sm-7" id="emailAddress" aria-describedby="emailHelp" placeholder="邮箱">
                                        <input type="button" id="getcode" value="发送验证码" class="btn btn-link"
                                               onclick="getCode()">
									</div>
                                    <div class="form-group row">
                                        <label for="code" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">验证码：</label>
                                        <input id="code" class="form-control col-sm-9" placeholder="验证码">
                                    </div>
									<div class="form-group row">
										<label for="registerPasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">密码：</label>
										<input type="password" class="form-control col-sm-9" id="registerPasswd" placeholder="密码">
									</div>
									<div class="form-group row">
										<label for="confirmPasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">确认密码：</label>
										<input type="password" class="form-control col-sm-9" id="confirmPasswd" placeholder="确认密码">
									</div>
								</div>
								
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" required id="yonghuxieyi">
                                            <span class="custom-control-indicator"></span>
                                            <span class="custom-control-description">我已阅读并同意 <a href="" target="_blank">用户协议</a></span>
                                        </label> 
                                    </div>
                                </div>
                            </div> 
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h4 style="border-bottom: 1px solid #ddd; padding-bottom: 7px; color:#555;"></h4>
                                </div>
                            </div>
                            <div class="form-group text-center">
								<button type="button" onclick="register()" class="btn btn-general btn-blue mr-2">提交注册</button>
							</div>
                        </form>
                    </div>
                </div>    
            
			
			</div> 

        </div>

        <%--弹窗--%>
        <jsp:include page="../common/dialog.jsp"/>
        <%--弹窗--%>

	</section>
    <!--Global Javascript -->
    <script src="${pageContext.request.contextPath}/static/base/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/base/js/front.js"></script>
	
	<script src="./${pageContext.request.contextPath}/static/base/js/final/cityinfo.js"></script>

    <%--register script--%>
    <script>
        function register(){
            const data = new FormData();
            data.append("userName", encodeURI($('#userName').val()));
            data.append("company", encodeURI($('#company').val()));
            data.append("position",encodeURI($('#position').val()));
            data.append("title", encodeURI($('#title').val()));
            data.append("phoneNum", $('#phoneNum').val());
            data.append("emailAddress", $('#emailAddress').val());
            data.append("password", encodeURI($('#registerPasswd').val()));
            data.append("confirmPassword", $('#confirmPasswd').val());
            data.append("code", $('#code').val())
            if (! data.get("userName")){show("姓名不能为空!");}
            else if (! data.get("company")){show("单位不能为空!");}
            else if (! data.get("position")){show("职务不能为空!");}
            else if (! data.get("title")){show("职称不能为空!");}
            else if (data.get("phoneNum").length > 11){show("请输入正确手机号!");}
            else if (! IsEmail(data.get("emailAddress"))){show("请输入正确邮箱地址!");}
            else if (! data.get("password")){show("密码不能为空!");}
            else if (! data.get("confirmPassword")){show("确认密码不能为空!");}
            else if(! document.getElementById('yonghuxieyi').checked){show('请勾选同意用户协议！');}
            else{
            $.ajax({
                url:"/toilet/register/professor",
                type:"POST",
                dataType: "json",
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success:function(result){
                    if (result.success) {
                        window.location.replace('${pageContext.request.contextPath}/login/index');
                    } else {
                        show(result.errorMessage);
                    }
                }
            });
        }}
    </script>
    <script>
        // 校验邮箱
        function IsEmail(el) {
            var reg =  /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/;
            return reg.test(el);
        }
        //短信验证码倒计时
        function getCode(){
            sendCode()
            var btn = $('#getcode')
            var number = 60;
            var countdown = function(){
                if (number == 0) {
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
            }
            setTimeout(countdown,1000);
        }

        function sendCode() {
            var data = new FormData();
            data.append("sendAddress", $('#emailAddress').val());
            $.ajax({
                url: "/toilet/mail/getRegisterCode",
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
    </script>
	
</body>

</html>