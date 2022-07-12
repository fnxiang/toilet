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
                        <h3><a href="./" target="_blank"><img src="${pageContext.request.contextPath}/static/base/res/logo.png" class="img-fluid" alt=""></a> 企业用户注册</h3>
                    </div>
                    <br>
                    <form>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group row">
                                    <label for="companyName" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">公司名称：</label>
                                    <input type="text" id="companyName" class="form-control col-sm-9" placeholder="请输入正确的公司名称">
                                </div>
                                <div class="form-group row">
                                    <label for="creditCode" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">统一社会信用代码：</label>
                                    <input type="text" id="creditCode" class="form-control col-sm-9" placeholder="统一社会信用代码由18位数字或者大写字母组成，但是字母不包括 I、O、Z、S、V">
                                </div>
                                <div class="form-group row">
                                    <label for="file" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">上传营业执照附件：</label>
                                    <input type="file" class="form-control-file" id="file" aria-describedby="fileHelp">
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">企业地址：</label>
                                    <div class="form-group col-sm-9 row" style="margin-bottom: 0px;padding-left: 0px;">
                                        <div class="form-group col-sm-4" style="margin-bottom: 0px;">
                                            <div><label for="provinceSelect" class="" style="margin-bottom: 0px;">请选择省份：</label></div>
                                            <div><select class="form-control" id="provinceSelect"></select></div>
                                        </div>
                                        <div class="form-group col-sm-4" style="margin-bottom: 0px;">
                                            <div><label for="citySelect" class="" style="margin-bottom: 0px;">请选择城市：</label></div>
                                            <select class="form-control" id="citySelect"></select>
                                        </div>
                                        <div class="form-group col-sm-4" style="margin-bottom: 0px;">
                                            <div><label for="countrySelect" class="" style="margin-bottom: 0px;">请选择县/区：</label></div>
                                            <select class="form-control" id="countrySelect"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fullAddress" class="col-sm-3 align-self-center" style="margin-bottom: 0px;"></label>
                                    <input type="text" class="form-control col-sm-9" id="fullAddress" placeholder="请输入企业详细地址">
                                </div>
                                <div class="form-group row">
                                    <label for="emailAddress" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">注册邮箱：</label>
                                    <input type="email" required class="form-control col-sm-7" id="emailAddress" aria-describedby="emailHelp" placeholder="注册邮箱">
                                    <input type="button" id="getcode" value="发送验证码" class="btn btn-link"
                                           onclick="sendCode()">
                                </div>
                                <div class="form-group row">
                                    <label for="code" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">验证码：</label>
                                    <input id="code" class="form-control col-sm-9" placeholder="验证码">
                                </div>
                                <div class="form-group row">
                                    <label for="webAddress" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">企业官网：</label>
                                    <input type="url" class="form-control col-sm-9" id="webAddress" placeholder="企业官网">
                                </div>
                                <div class="form-group row">
                                    <label for="contactName" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">联系人：</label>
                                    <input type="text" class="form-control col-sm-9" id="contactName"  placeholder="联系人">
                                </div>
                                <div class="form-group row">
                                    <label for="phoneNum" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">手机号：</label>
                                    <input type="text" class="form-control col-sm-9" id="phoneNum" placeholder="手机号">
                                </div>
                                <div class="form-group row">
                                    <label for="registerPasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">密码：</label>
                                    <input type="password" class="form-control col-sm-9" id="registerPasswd" aria-describedby="emailHelp" placeholder="密码">
                                </div>
                                <div class="form-group row">
                                    <label for="confirmPasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">确认密码：</label>
                                    <input type="password" class="form-control col-sm-9" id="confirmPasswd" aria-describedby="emailHelp" placeholder="确认密码">
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
                            <button onclick="register()" class="btn btn-general btn-blue mr-2" role="button">提交注册</button>
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

<script src="${pageContext.request.contextPath}/static/base/./js/final/cityinfo.js"></script>

<script>
    function register(){
        var data = new FormData();
        var file = $('#file')[0].files[0];
        data.append("file", file)
        data.append("companyName", encodeURI($('#companyName').val()));
        data.append("creditCode", $('#creditCode').val());
        data.append("companyAddress",getSelectorContent());
        data.append("detailAddress", encodeURI($('#fullAddress').val()));
        data.append("email", $('#emailAddress').val());
        data.append("webAddress", $('#webAddress').val());
        data.append("contactName", encodeURI($('#contactName').val()));
        data.append("phoneNum", $('#phoneNum').val());
        data.append("password", $('#registerPasswd').val());
        data.append("confirmPassword", $('#confirmPasswd').val());
        data.append("code", $('#code').val());
        if (! data.get("companyName")){show("公司名称不能为空!");}
        else if (! data.get("creditCode")){show("统一社会信用代码不能为空!");}
        else if (! IsCreditCode(data.get("creditCode"))){show("请输入正确社会信用代码!");}
        else if (! $('#file').val().length){show("营业执照不能为空!");}
        else if (! data.get("webAddress")){show("企业官网不能为空!");}
        else if (! data.get("contactName")){show("联系人不能为空!");}
        else if (data.get("phoneNum").length > 11){show("请输入正确手机号!");}
        else if (! IsEmail(data.get("email"))){show("请输入正确邮箱地址!");}
        else if (! data.get("password")){show("密码不能为空!");}
        else if (! data.get("confirmPassword")){show("确认密码不能为空!");}
        else if(! document.getElementById('yonghuxieyi').checked){show('请勾选同意用户协议！');}
        else{
            $.ajax({
                url:"/toilet/register/company",
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
        }
    }
    function getSelectorContent() {
        const provinceName = $('#provinceSelect').find("option:selected").text();
        const cityName = $('#citySelect').find("option:selected").text();
        const countryName = $('#countrySelect').find("option:selected").text();
        const address = provinceName+","+cityName+","+countryName;
        return encodeURIComponent(address);
    }
    function encodeUtf8(text) {
        const code = encodeURIComponent(text);
        const bytes = [];
        for (var i = 0; i < code.length; i++) {
            const c = code.charAt(i);
            if (c === '%') {
                const hex = code.charAt(i + 1) + code.charAt(i + 2);
                const hexVal = parseInt(hex, 16);
                bytes.push(hexVal);
                i += 2;
            } else bytes.push(c.charCodeAt(0));
        }
        return bytes;
    }
</script>

<!--Core Javascript -->
<script>
    // 当框框加载完成之后调用设置省份
    window.onload = setProvince;

    // 获取省市县/区的select选择框对象
    var province = document.getElementById("provinceSelect");
    var city = document.getElementById("citySelect");
    var county = document.getElementById("countrySelect");
    //var province = document.getElementsByTagName("select")[0];
    //var city = document.getElementsByTagName("select")[1];
    //var county = document.getElementsByTagName("select")[2];

    // 设置省份
    function setProvince() {
        // 遍历省份数组, provinceArr在city.js中
        for (var i = 0; i < provinceArr.length; i++){
            // 创建省份option选项
            var opt = document.createElement("option");
            opt.value = provinceArr[i];         // 设置value-提交给服务器用
            opt.innerHTML = provinceArr[i];     // 设置option文本显示内容
            province.appendChild(opt);          // 追加城市到下拉框

            // 当省份发生变化更改城市
            province.onchange = function(){
                setCity(this.selectedIndex);
            };
        }

        // 省份加载完成，默认显示第一个省份的城市
        setCity(0);
    }

    // 设置城市
    function setCity(provincePos) {
        // 获取省份对象的城市，cityArr在city.js中
        var citys = cityArr[provincePos];
        city.length = 0;                  // 清空长度，重新从0开始赋值下拉框

        for (var i = 0; i < citys.length; i++){
            // 创建城市option选项
            var opt = document.createElement("option");
            opt.value = citys[i];         // 设置value-提交给服务器用
            opt.innerHTML = citys[i];     // 设置option文本显示内容

            city.appendChild(opt);
            city.onchange = function() {
                setCounty(provincePos, this.selectedIndex);
            }
        }

        // 默认显示城市的第一个县/区
        setCounty(provincePos, 0);
    }

    // 设置县/区, 县/区是三位数组，需要传入哪个省份和城市
    function setCounty(provincePos, cityPos) {
        // 获取县/区，countyArr在city.js中国
        var countys = countyArr[provincePos][cityPos];
        county.length = 0;

        for (var i = 0; i < countys.length; i++){
            // 创建县/区option选项
            var opt = document.createElement("option");
            opt.value = countys[i];         // 设置value-提交给服务器用
            opt.innerHTML = countys[i];     // 设置option文本显示内容
            county.appendChild(opt);        // 追加到县/区选择框中
        }
    }

</script>

<script>
    // 校验邮箱
    function IsEmail(el) {
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        return reg.test(el);
    }

    function IsCreditCode(code){
        var reg = /^([0-9A-HJ-NPQRTUWXY]{2}\d{6}[0-9A-HJ-NPQRTUWXY]{10}|[1-9]\d{14})$/;
        return reg.test(code)
    }

    //短信验证码倒计时
    function getCode(){
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
                    getCode();
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }
    function close(){
        $(".content_dialog").css("height","90px");
        $(".dialog").css("display","none");
    }
</script>

</body>

</html>