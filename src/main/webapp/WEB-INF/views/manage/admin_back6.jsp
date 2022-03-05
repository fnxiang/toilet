<%--
  Created by IntelliJ IDEA.
  User: kokorozashinao
  Date: 2022/3/5
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link rel="shortcut icon" href="res/logo.ico">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">

    <link href="res/css/stylenew.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
<!-- Left Panel -->

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="./admin_back1.html" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-laptop"></i>用户管理</a>
                </li>
                <li>
                    <a href="./admin_back2.html" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-glass"></i>用户审核</a>
                </li>
                <li>
                    <a href="./admin_back3.html" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-tasks"></i>产品管理</a>
                </li>
                <li>
                    <a href="./admin_back4.html" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-cogs"></i>模式管理</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><img src="res/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">


                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="./res/logo.png" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="./admin_back5.html"><i class="fa fa-cog"></i>设置</a>

                        <a class="nav-link" href="#"><i class="fa fa-power-off"></i>注销</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- /header -->
    <!-- Header-->

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
                                <li><a href="#">后台</a></li>
                                <li class="active">用户管理</li>
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
                                    <div class="col col-md-3"><label for="text-input"
                                                                     class=" form-control-label">公司名称</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input"
                                                                        value="公司名称" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">统一社会信用代码</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input"
                                                                        value="112233456" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input"
                                                                     class=" form-control-label">营业执照</label></div>
                                    <div class="col-12 col-md-9">
                                        <iframe src="./res/PR_final.pdf" width="100%" height="100%"
                                                style="height: 500px;"></iframe>
                                    </div>
                                </div>


                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabledSelect" class=" form-control-label">企业地址</label>
                                    </div>
                                    <div class="col-md-3">
                                        <select name="disabledSelect" id="disabledSelect" class="form-control">
                                            <option value="0">北京市</option>
                                            <option value="1">山西省</option>
                                            <option value="2">江苏省</option>
                                            <option value="3">广东省</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="disabledSelect" id="disabledSelect" class="form-control">
                                            <option value="0">北京市</option>
                                            <option value="1">朔州市</option>
                                            <option value="2">南京市</option>
                                            <option value="3">广州市</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="disabledSelect" id="disabledSelect" class="form-control">
                                            <option value="0">海淀区</option>
                                            <option value="1">朔城区</option>
                                            <option value="2">建邺区</option>
                                            <option value="3">不知道</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-9 offset-md-3"><input type="text" id="disabled-input"
                                                                             name="disabled-input" placeholder=""
                                                                             value="北京市海淀区上园村3号" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">注册邮箱</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input"
                                                                        name="disabled-input" value="123@456.com"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">公司官网</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input"
                                                                        name="disabled-input"
                                                                        value="https://123.456.789.com"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">联系人</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input"
                                                                        name="disabled-input" value="张三"
                                                                        class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">手机号</label>
                                    </div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input"
                                                                        name="disabled-input" value="1234567890"
                                                                        class="form-control"></div>
                                </div>
                            </form>

                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary" onclick="">保存</button>
                                <button type="button" class="btn btn-outline-secondary offset-md-2" onclick="">取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- .animated -->
    </div>
    <!-- .content -->


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

</div>
<!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<!--
<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>


<script src="assets/js/lib/data-table/datatables.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/jszip.min.js"></script>
<script src="assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="assets/js/init/datatables-init.js"></script>
-->
<!-- All Jquery -->
<script src="res/js/lib/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="res/js/lib/bootstrap/js/popper.min.js"></script>
<script src="res/js/lib/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="res/js/jquery.slimscroll.js"></script>
<!--Menu sidebar -->
<script src="res/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="res/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="res/js/custom.min.js"></script>


<script src="res/js/lib/datatables/datatables.min.js"></script>
<script src="res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="res/js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="res/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="res/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<script src="res/js/lib/datatables/datatables-init.js"></script>

<script type="text/javascript">


</script>


</body>
</html>

