<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/flag-icon.min.css"><link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back1" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>我的申请</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>企业基本信息</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/company/index"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="./res/logo.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=company_back2"><i class="fa fa-user"></i>企业信息管理</a>

                            <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=company_back4"><i class="fa fa-cog"></i>设置</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i>注销</a>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->

		<div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>企业后台管理系统</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                    <li class="active">产品审核结果</li>
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
                                <strong class="card-title">产品审核结果</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <td>产品名称</td>
                                            <td>XXXXXXXXXX</td>
                                        </tr>
										<tr>
                                            <td>审核结果</td>
                                            <td>不通过</td>
                                        </tr>
                                        <tr>
                                            <td>专家评审意见</td>
                                            <td>论文反映作者阅读了大量相关文献，对本专业基础理论和课题方面的知识掌握深入、牢固，能利用所学知识解决课题中的实际问题，具有较强的科研工作能力和动手能力。论文条理清楚、图表规范、数据可信，已达到硕士论文水平，同意该同学按期参加答辩。</td>
                                        </tr>
										<tr>
                                            <td>审核结果</td>
                                            <td>
												<!--<a href="./company_back3.jsp" class="btn btn-link">返回修改</a>-->
												<button type="button" class="btn btn-link" onclick="javascript:window.location.href='company_back3.jsp'">返回修改</button>
												<button type="button" class="btn btn-link" onclick="javascript:window.location.href='company_back1.jsp'">舍弃该申请</button>
											</td>
                                        </tr>
                                    </tbody>
                                </table>
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


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>


</body>
</html>
