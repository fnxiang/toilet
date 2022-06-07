<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

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
</head>

<body>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<section class="hero-area">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="contact-h-cont">
                    <h3 class="text-center"><a href="${pageContext.request.contextPath}/" target="_blank"><img
                            src="${pageContext.request.contextPath}/static/base/res/logo.png" class="img-fluid" alt=""></a>
                    </h3><br>
                    <form id="login_form">
                        <div class="form-group">
                            <label for="accountId">账号</label>
                            <input type="text" class="form-control" id="accountId" value="" placeholder="统一社会信用代码登录/邮箱">
                        </div>
                        <div class="form-group">
                            <label for="accPassword">密码</label>
                            <input class="form-control" type="password" value="" id="accpassword">
                        </div>
                        <div class="form-group text-right">
                            <a href="" target="_blank">忘记密码</a>
                        </div>
                        <div class="form-group text-right">
                            <a type="button" onclick="goRegister()" href="javascript:;">没有账号？点击注册</a>
                        </div>
                    </form>
                    <div class="form-group text-center">
                        <button id="login_btn" onclick="login()" class="btn btn-general btn-blue" role="button">登录
                        </button>
                    </div>
                    <div>
                    </div>
                </div>
            </div>

            <div id="zhuce" style="position: absolute; left: 720px; top: 400px; background: #99999975; height: 100px; display: none">
                <!-- 弹窗遮罩层 -->
                <div class="aclose">
                    <a class="close" href="javascript:choseClose();">&times;</a>
                </div>
                <div class="contain" id="dialog">
                    <a href='${pageContext.request.contextPath}/toBasePage?url=register_final'
                             role="button">企业注册&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <a href='${pageContext.request.contextPath}/toBasePage?url=register_professor'
                             role="button">专家注册
                    </a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/dialog.jsp"/>
</section>

<!--Global Javascript -->
<script src="${pageContext.request.contextPath}/static/base/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/bootstrap.min.js"></script>

<script>
    var accountId = document.getElementById('accountId');
    console.log(accountId.textContent);

    function preCheck() {
        if (accountId.length < 3 || accountId.length > 20) {
            alert("account error")
        }
    }
</script>

<script>
    function login() {
        preCheck();
        var data = new FormData();
        data.append("accountId", $('#accountId').val());
        data.append("accountPwd", $('#accpassword').val());

        $.ajax({
            url: "/toilet/login",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    location.href = result.forwardUrl;
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }
</script>

<%--注册--%>
<script>
    function goRegister() {
        chose()
    }

</script>
<script>
    function chose() {
        $("#zhuce").css("display", "block");
    }

    function choseClose() {
        $("#zhuce").css("display", "none");
    }
</script>
</body>

</html>