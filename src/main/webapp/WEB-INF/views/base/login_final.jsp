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
    <link rel="shortcut icon" href="static/base/res/logo.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/base/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/base/css/font-icon-style.css">
    <link rel="stylesheet" href="static/base/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="static/base/css/pages/login.css">
</head>

<body> 

<!--====================================================
                        PAGE CONTENT
======================================================--> 
      <section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 ">
                <div class="contact-h-cont">
                  <h3 class="text-center"><a href="" target="_blank"><img src="static/base/res/logo.png" class="img-fluid" alt=""></a></h3><br>
                  <form>
                    <div class="form-group">
                      <label for="accountid">账号</label>
                      <input type="text" class="form-control" id="accountid" placeholder="统一社会信用代码登录/邮箱"> 
                    </div>  
                    <div class="form-group">
                      <label for="accpassword">密码</label>
                      <input class="form-control" type="password" value="" id="accpassword"> 
                    </div> 
					<div class="form-group text-right">
					  <a href="" target="_blank">忘记密码</a>
                    </div>
					<div class="form-group text-right">
					  <a href="register_final.html" target="_blank">没有账号？点击注册</a>
                    </div>
					<div class="form-group text-center">
					  <button class="btn btn-general btn-blue" role="button"><i fa fa-right-arrow></i>登录</button>
					</div>
                  </form>
                </div>
            </div>
          </div>  
        </div>
      </section>
      
    <!--Global Javascript -->
    <script src="static/base/js/jquery.min.js"></script>
    <script src="static/base/js/tether.min.js"></script>
    <script src="static/base/js/bootstrap.min.js"></script>
    <script>
        console.log("..");
    </script>
</body>

</html>