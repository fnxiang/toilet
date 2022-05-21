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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/flag-icon.min.css"><link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/cs-skin-elastic.css">
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
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back1" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品信息审核列表</a>
                    </li>
                    <li class="active">
                        <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>模式审核列表</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>基本信息</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <jsp:include page="professor_header.jsp"/>
        <!-- Header-->

		<div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>专家后台管理系统</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/professor/index">后台</a></li>
                                    <li class="active">模式审核列表</li>
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
                                <strong class="card-title">我的申请</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>模式名称</th>
                                            <th>提交时间</th>
											<th>截至时间</th>
                                            <th>状态</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr onclick="javascript:window.location.href='${pageContext.request.contextPath}/toPage?url=professor_back6'">
                                            <td>1</td>
                                            <td>模式名称1</td>
                                            <td>2021年9月1日</td>
											<td>2021年10月8日</td>
                                            <td>等待审核</td>
                                        </tr>
										<tr>
                                            <td>2</td>
                                            <td>模式名称2</td>
                                            <td>2021年9月5日</td>
											<td>2021年10月10日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>3</td>
                                            <td>模式名称3</td>
                                            <td>2021年9月10日</td>
											<td>2021年10月13日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>4</td>
                                            <td>模式名称4</td>
                                            <td>2021年9月6日</td>
											<td>2021年10月19日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>5</td>
                                            <td>模式名称6</td>
                                            <td>2021年9月19日</td>
											<td>2021年10月20日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>6</td>
                                            <td>模式名称6</td>
                                            <td>2021年9月18日</td>
											<td>2021年10月22日</td>
                                            <td>审核中</td>
                                        </tr>
										
										<tr>
                                            <td>7</td>
                                            <td>模式名称7</td>
                                            <td>2021年9月19日</td>
											<td>2021年10月22日</td>
                                            <td>等待审核</td>
                                        </tr>
										<tr>
                                            <td>8</td>
                                            <td>模式名称8</td>
                                            <td>2021年9月20日</td>
											<td>2021年10月23日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>9</td>
                                            <td>模式名称9</td>
                                            <td>2021年9月22日</td>
											<td>2021年10月25日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>10</td>
                                            <td>模式名称10</td>
                                            <td>2021年9月26日</td>
											<td>2021年10月27日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>11</td>
                                            <td>模式名称11</td>
                                            <td>2021年9月28日</td>
											<td>2021年10月29日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>12</td>
                                            <td>模式名称12</td>
                                            <td>2021年9月29日</td>
											<td>2021年10月30日</td>
                                            <td>审核中</td>
                                        </tr>
										
										<tr>
                                            <td>13</td>
                                            <td>模式名称13</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>14</td>
                                            <td>模式名称14</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>15</td>
                                            <td>模式名称15</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>16</td>
                                            <td>模式名称16</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>17</td>
                                            <td>模式名称17</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>等待审核</td>
                                        </tr>
										<tr>
                                            <td>18</td>
                                            <td>模式名称18</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										
										<tr>
                                            <td>19</td>
                                            <td>模式名称19</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核中</td>
                                        </tr>
										<tr>
                                            <td>20</td>
                                            <td>模式名称20</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>等待审核</td>
                                        </tr>
										<tr>
                                            <td>21</td>
                                            <td>模式名称21</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>22</td>
                                            <td>模式名称22</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>23</td>
                                            <td>模式名称23</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>审核完成</td>
                                        </tr>
										<tr>
                                            <td>24</td>
                                            <td>模式名称24</td>
                                            <td>2021年10月8日</td>
											<td>2021年11月9日</td>
                                            <td>等待审核</td>
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
