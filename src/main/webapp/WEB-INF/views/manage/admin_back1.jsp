<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@page import="java.util.List" %>
<%@ page import="cn.edu.bjtu.toilet.dao.domain.UserDO" %>
<%@ page import="cn.edu.bjtu.toilet.dao.domain.CompanyDO" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
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
	
	<link href="${pageContext.request.contextPath}/static/manage/res/css/stylenew.css" rel="stylesheet">
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
                        <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>用户管理</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>用户审核</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品管理</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>模式管理</a>
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
            <jsp:include page="admin_banner.jsp"/>
        </header><!-- /header -->
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
                                    <li><a href="${pageContext.request.contextPath}/admin/index">后台</a></li>
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
                                <strong class="card-title">用户管理</strong>
                            </div>
                            <div class="card-body">
                                <div class="grid_2">
                                    <button class="grid_2" style="position: absolute;left: 30px; top: 40px;" onclick="exportProfessor()">导出专家信息</button>
                                </div>

                                <div class="grid_2">
                                    <button class="grid_2" style="position: absolute;left: 160px; top: 40px;" onclick="exportCompany()">导出企业信息</button>
                                </div>
                                <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>序号</th>
											<th>用户名</th>
											<th>类型</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<%  int index = 1;
										List<UserDO> list = (List<UserDO>)request.getAttribute("profList");%>
									<tbody>
									<% if (list != null) {
										for (int i=0;i<list.size();i++, index++) {%>
									<tr>
										<td><%=index%></td>
										<td><%=list.get(i).getName()%></td>
										<td>专家用户</td>
										<td class="text-center">
											<a type="button" class="btn btn-link fa fa-edit" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back7&email=<%=list.get(i).getEmail()%>'"> 查看详情</a>
											<a type="button" class="btn btn-link fa fa-trash-o" onclick="show('删除')"> 删除</a>
										</td>
									</tr>
										<%}}%>
										<% List<CompanyDO> companyDOS = (List<CompanyDO>)request.getAttribute("companyList");%>
									<tbody>
									<%if (companyDOS != null) {
										for (int i=0;i<companyDOS.size();i++, index++) {%>
									<tr>
										<td><%=index%></td>
										<td><%=companyDOS.get(i).getCompanyName()%></td>
										<td>企业用户</td>
										<td class="text-center">
											<a type="button" class="btn btn-link fa fa-edit" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back12&email=<%=companyDOS.get(i).getEmail()%>'"> 查看详情</a>
											<a type="button" class="btn btn-link fa fa-trash-o" onclick="show('删除')"> 删除</a>
										</td>
									</tr>
									<%}
									}%>

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
        <%--弹窗--%>
        <jsp:include page="../common/dialog.jsp"/>
        <%--弹窗--%>

    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
	<!--
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
	-->
	<!-- All Jquery -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/bootstrap/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/static/manage/res/js/custom.min.js"></script>


    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/manage/res/js/lib/datatables/datatables-init.js"></script>

    <script type="text/javascript">
  </script>
    <%--导出--%>
    <script>
        //json转换为excel
        <jsp:include page="admin_export.jsp"/>
        //转换为json
        function exportProfessor() {
            //获取专家用户列表
            <%
            List<JSONObject> professor_data = new ArrayList<>();
            //遍历获取到的需要导出的数据
            for(int i = 0; i < list.size(); i++) {
                JSONObject dataMap = new JSONObject(true);
                UserDO userDO = list.get(i);
                dataMap.put("姓名",userDO.getName());
                dataMap.put("单位",userDO.getWorkCompany());
                dataMap.put("职务",userDO.getPosition());
                dataMap.put("职称",userDO.getTitle());
                dataMap.put("电话",userDO.getPhone());
                dataMap.put("电子邮箱",userDO.getEmail());
                professor_data.add(dataMap);}%>
            var dataList = new Array();
            <%for(JSONObject x : professor_data){%>
            dataList.push(<%=x%>);
            <%}%>
            JSONToExcelConvertor(dataList,"专家用户信息");
        }

        function exportCompany() {
            //获取整个企业用户列表
            <%
            List<JSONObject> company_data = new ArrayList<>();
            //遍历获取到的需要导出的数据
            for(int i = 0; i < companyDOS.size(); i++) {
                JSONObject dataMap = new JSONObject(true);
                CompanyDO companyDO = companyDOS.get(i);
                dataMap.put("公司名称",companyDO.getCompanyName());
                dataMap.put("统一社会信用代码",companyDO.getCreditCode());
                dataMap.put("营业执照",companyDO.getBusinessLicenseFilePath());
                dataMap.put("企业地址",companyDO.getEnterpriseAddress());
                dataMap.put("注册邮箱",companyDO.getEmail());
                dataMap.put("公司官网",companyDO.getOfficialSite());
                dataMap.put("联系人",companyDO.getContactName());
                dataMap.put("手机号",companyDO.getContactPhone());
                company_data.add(dataMap);}%>
            var dataList = new Array();
            <%for(JSONObject x : company_data){%>
            dataList.push(<%=x%>);
            <%}%>
            JSONToExcelConvertor(dataList,"企业用户信息");
        }
    </script>


</body>
</html>
