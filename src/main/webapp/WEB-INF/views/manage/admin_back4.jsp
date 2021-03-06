<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO" %>
<%@ page import="cn.edu.bjtu.toilet.utils.DateUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.bjtu.toilet.constant.AuditStatus" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
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
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back1" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>用户管理</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back14" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-user"></i>添加用户</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>用户审核</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品管理</a>
                    </li>
					<li class="active">
                        <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>模式管理</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back5"
                           style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cog" aria-hidden="true"></i>修改密码</a>
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
                                    <li class="active">模式管理</li>
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
                                <strong class="card-title">模式管理</strong>
                            </div>
                            <div class="card-body">

                                <div class="grid_2">
                                    <button class="grid_2" style="position: absolute;left: 30px; top: 40px;"
                                            onclick="exportXSL()">导出模式信息
                                    </button>
                                </div>
                                <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>序号</th>
											<th>模式类型</th>
											<th>提交时间</th>
											<th>状态</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<% List<ToiletPatternDTO> list = (List<ToiletPatternDTO>)request.getAttribute("patternList");%>
									<tbody>
									<% for (int i=0;i<list.size();i++) {%>
									<tr>
										<td><%=i+1%></td>
										<td><%=list.get(i).getPatternType()%></td>
										<td><%=DateUtil.toStandardFormat(list.get(i).getGmtCreate())%></td>
										<td><%=list.get(i).getStatus().getName()%></td>
										<td class="text-center">
											<a type="button" class="btn btn-link fa fa-edit" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back11&patternId=<%=list.get(i).getId()%>'"> 查看详情</a>
                                            <%if (list.get(i).getStatus().equals(AuditStatus.WAITED_PROFESSOR) && StringUtils.isEmpty(list.get(i).getProfessorEmail())) {%>
											<a type="button" class="btn btn-link fa fa-check-square" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back13&patternId=<%=list.get(i).getId()%>'">分配专家</a>
                                            <%}%>
											<a type="button" class="btn btn-link fa fa-trash-o" onclick="confirm_delete('pattern', <%=list.get(i).getId()%>)"> 删除</a>
										</td>
									</tr>
									<%}%>
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
        // fixme 删除模式接口
        function deletePattern(pattern_id) {
            let data = new FormData();
            data.append("patternId", pattern_id)
            $.ajax({
                url: "/toilet/admin/pattern/delete",
                type: "POST",
                dataType: "json",
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result.success) {
                        show("删除成功!");
                    } else {
                        show(result.errorMessage);
                    }
                }
            });
        }
        function cancalDelete(){
            $(".content_dialog").css("height","90px");
            $(".dialog").css("display","none");
        }

  </script>
    <%--导出--%>
    <script>
        //json转换为excel
        <jsp:include page="admin_export.jsp"/>
        //转换为json
        function exportXSL() {
            //获取整个产品列表
            <%
            List<JSONObject> data = new ArrayList<>();
            //遍历获取到的需要导出的数据
            for(int i = 0; i < list.size(); i++) {
                JSONObject dataMap = new JSONObject(true);
                ToiletPatternDTO patternDTO = list.get(i);
                dataMap.put("序号",patternDTO.getId());
                dataMap.put("产品类型",patternDTO.getProductType());
                dataMap.put("模式类型",patternDTO.getPatternType());
                dataMap.put("生态条件",patternDTO.getEnvConditions().getEcotope());
                dataMap.put("地理位置条件",patternDTO.getEnvConditions().getGeolocation());
                dataMap.put("温度条件",patternDTO.getEnvConditions().getTemperature());
                dataMap.put("地形条件",patternDTO.getEnvConditions().getTerrain());
                dataMap.put("水资源条件",patternDTO.getEnvConditions().getWaterResource());
                dataMap.put("人口密集程度",patternDTO.getHumanFactors().getDensity());
                dataMap.put("液态肥使用习惯",patternDTO.getHumanFactors().getUsageHabits());
                if(patternDTO.getPipNetworkConditions().getHasSewerLines() == Boolean.TRUE){
                     dataMap.put("具备管网条件","是");
                }else{
                    dataMap.put("具备管网条件","否");
                }
                if(patternDTO.getResourceUtilization().getIsBiogasUtilization() == Boolean.TRUE){
                    dataMap.put("具有沼气利用工程","是");
                }else{
                    dataMap.put("具有沼气利用工程","否");
                }
                dataMap.put("可以与其他生活污水混合处理",patternDTO.getResourceUtilization().getMixedSewageTreatment());
                if(patternDTO.getResourceUtilization().getOtherTreatment() == Boolean.TRUE){
                    dataMap.put("计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理","是");
                }else{
                    dataMap.put("计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理","否");
                }
                data.add(dataMap);}%>
            var dataList = new Array();
            <%for(JSONObject x : data){%>
            dataList.push(<%=x%>);
            <%}%>
            JSONToExcelConvertor(dataList,"模式详情");
        }
    </script>

</body>
</html>
