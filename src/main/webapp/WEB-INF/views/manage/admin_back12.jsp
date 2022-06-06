<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.edu.bjtu.toilet.dao.domain.CompanyDO" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/manage/res/logo.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>

<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back1" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-laptop"></i>用户管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back2" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-glass"></i>用户审核</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品管理</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back4" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-cogs"></i>模式审核</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- Left Panel -->

<!-- Right Panel -->
<% CompanyDO companyDO = (CompanyDO) request.getAttribute("company");
    EnterpriseAddressDTO enterpriseAddressDTO = JSON.parseObject(companyDO.getEnterpriseAddress(), EnterpriseAddressDTO.class);%>

<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";%>
<div id="right-panel" class="right-panel">

    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/static/manage/images/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">


                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=admin_back5"><i class="fa fa-cog"></i>设置</a>

                        <a class="nav-link" href="${pageContext.request.contextPath}"><i class="fa fa-power-off"></i>注销</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="breadcrumbs">
        <div class="breadcrumbs-inner">
            <div class="row m-0">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>管理员后台管理系统</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                <li class="active">企业基本信息</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">企业基本信息</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="companyName"
                                                                     class=" form-control-label">公司名称</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="companyName" name="companyName"
                                                                        placeholder="公司名称"
                                                                        value="<%=companyDO.getCompanyName()%>"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="creditCode" class=" form-control-label">统一社会信用代码</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="creditCode" name="creditCode"
                                                                        placeholder="112233456"
                                                                        value="<%=companyDO.getCreditCode()%>"
                                                                        class="form-control"></div>
                                </div>
                                <%String filePath = companyDO.getBusinessLicenseFilePath();%>
                                <%if(filePath.length() != 0){%>
                                <div class="row form-group" id="yingyezhizhao">
                                    <div class="col col-md-3"><label class=" form-control-label">营业执照</label></div>
                                    <div class="col-12 col-md-9">
                                        <iframe src="<%=basePath + filePath%>"
                                                width="100%" height="100%" style="height: 500px;"></iframe>
                                    </div>
                                </div>
                                <%}%>

                                <div class="row form-group" id="shuruzhizhao" style="display: none">
                                    <div class="col col-md-3"><label for="file" class="form-control-label">营业执照
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i> </label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="file"
                                                                        name="zhizhao"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="provinceSelect" class=" form-control-label">企业地址</label>
                                    </div>
                                    <div class="col-md-3">
                                        <select name="provinceSelect" id="provinceSelect" class="form-control">
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="citySelect" id="citySelect" class="form-control">
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="countrySelect" id="countrySelect" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-9 offset-md-3"><input type="text" id="fullAddress"
                                                                             name="fullAddress" placeholder=""
                                                                             value="北京市海淀区上园村3号" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="emailAddress"
                                                                     class=" form-control-label">注册邮箱</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="emailAddress"
                                                                        name="emailAddress" placeholder="123@456.com"
                                                                        value="<%=companyDO.getEmail()%>"
                                                                        class="form-control" disabled></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="webAddress"
                                                                     class=" form-control-label">公司官网</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="webAddress" name="webAddress"
                                                                        placeholder="https://123.456.789.com"
                                                                        value="<%=companyDO.getOfficialSite()%>"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="contactName"
                                                                     class=" form-control-label">联系人</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="contactName" name="contactName"
                                                                        placeholder="张三"
                                                                        value="<%=companyDO.getContactName()%>"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="phoneNum"
                                                                     class=" form-control-label">手机号</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="phoneNum" name="phoneNum"
                                                                        placeholder="1234567890"
                                                                        value="<%=companyDO.getContactPhone()%>"
                                                                        class="form-control"></div>
                                </div>

                                <hr>
                                <div class="card-text text-lg-center">
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back1'">返回</button>
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>


            </div>
        </div><!-- .animated -->
    </div><!-- .content -->


    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 亚太建设科技信息研究院
                </div>
                <div class="col-sm-6 text-right"> Designed by Amose
                </div>
            </div>
        </div>
    </footer>

    <%--弹窗--%>
    <jsp:include page="../common/dialog.jsp"/>
    <%--弹窗--%>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/static/manage/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/main.js"></script>


<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/init/datatables-init.js"></script>
<script src="${pageContext.request.contextPath}/static/manage/assets/js/cityinfo.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(document).ready(function() {
            $('#bootstrap-data-table-export').DataTable();
        } );

    });
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
            <%String province = enterpriseAddressDTO.getProvince();%>
            if(provinceArr[i] === "<%=province.substring(0, province.length() - 1)%>"){
                opt.selected = "selected"
            }
            opt.innerHTML = provinceArr[i];     // 设置option文本显示内容
            province.appendChild(opt);          // 追加城市到下拉框
            // 当省份发生变化更改城市
            province.onchange = function(){
                setCity(this.selectedIndex);
            };
        }

        // 省份加载完成，默认显示第一个省份的城市
        setCity(province.selectedIndex);
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
            if(citys[i] === "<%=enterpriseAddressDTO.getCity()%>"){
                opt.selected = "selected"
            }
            opt.innerHTML = citys[i];     // 设置option文本显示内容
            city.appendChild(opt);
            city.onchange = function() {
                setCounty(provincePos, this.selectedIndex);
            }
        }

        // 默认显示城市的第一个县/区
        setCounty(provincePos, city.selectedIndex);
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
            if(countys[i] === "<%=enterpriseAddressDTO.getCountry()%>"){
                opt.selected = "selected"
            }
            opt.innerHTML = countys[i];     // 设置option文本显示内容
            county.appendChild(opt);        // 追加到县/区选择框中
        }
    }

</script>
</body>
</html>
