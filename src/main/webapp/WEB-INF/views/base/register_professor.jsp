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
    <link rel="shortcut icon" href="res/logo.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/register.css">
	<link rel="stylesheet" href="css/pages/login.css">
	
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
                            <h3><a href="" target="_blank"><img src="res/logo.png" class="img-fluid" alt=""></a> 专家用户注册</h3>
                        </div>
                        <br>
                        <form>
                            <div class="row">
								<div class="col-md-12">
									<div class="form-group row">
                                        <label for="username" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">姓名：</label>
                                        <input type="text" class="form-control col-sm-9" id="username" placeholder="姓名">
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
										<label for="phonenum" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">手机号：</label>
										<input type="text" class="form-control col-sm-9" id="phonenum" placeholder="手机号">
									</div>
									<div class="form-group row">
										<label for="emailaddress" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">邮箱：</label>
										<input type="email" class="form-control col-sm-9" id="emailaddress" aria-describedby="emailHelp" placeholder="邮箱">
									</div>
									<div class="form-group row">
										<label for="registerpasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">密码：</label>
										<input type="password" class="form-control col-sm-9" id="registerpasswd" placeholder="密码">
									</div>
									<div class="form-group row">
										<label for="conformpasswd" class="col-sm-3 align-self-center xrequired" style="margin-bottom: 0px;">确认密码：</label>
										<input type="password" class="form-control col-sm-9" id="conformpasswd" placeholder="确认密码">
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
								<button type="submit" class="btn btn-general btn-blue mr-2">提交注册</button>  
							</div>
                        </form>
                    </div>
                </div>    
            
			
			</div> 

        </div>
	</section>
    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.validate.min.js"></script> 
    <script src="js/chart.min.js"></script> 
    <script src="js/front.js"></script> 
	
	<script src="./js/final/cityinfo.js"></script>
    
    <!--Core Javascript -->	
	<script>
		// 当框框加载完成之后调用设置省份
		window.onload = setProvince;
		 
		// 获取省市县/区的select选择框对象
		var province = document.getElementById("provinceselect");
		var city = document.getElementById("cityselect");
		var county = document.getElementById("countyselect");
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
	
</body>

</html>