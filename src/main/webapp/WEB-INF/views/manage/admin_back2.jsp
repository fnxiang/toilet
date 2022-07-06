<%@ page import="cn.edu.bjtu.toilet.dao.domain.UserDO" %>
<%@ page import="cn.edu.bjtu.toilet.dao.domain.CompanyDO" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.bjtu.toilet.constant.AuditStatus" %>
<%@ page import="org.checkerframework.checker.units.qual.A" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.CompanyDTO" %>
<%@ page import="cn.edu.bjtu.toilet.utils.DateUtil" %>
<%@ page import="cn.edu.bjtu.toilet.constant.UserStatus" %>
<%@ page import="org.apache.catalina.User" %>
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

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/manage/res/logo.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/manage/assets/css/lib/datatable/dataTables.bootstrap.min.css">

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
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back1"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>用户管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back14" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-user"></i>添加用户</a>
                </li>
                <li class="active">
                    <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>用户审核</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back4"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>模式管理</a>
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
                                <li class="active">用户审核</li>
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
                            <strong class="card-title">用户审核</strong>
                        </div>
                        <div class="card-body">
                            <table id="example23" class="display nowrap table table-hover table-striped table-bordered"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>用户名</th>
                                    <th>提交时间</th>
                                    <th>账号</th>
                                    <th class="text-center">是否允许登录</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% Integer index = 1;
                                    List<UserDO> list = (List<UserDO>) request.getAttribute("profList");%>

                                <% if (list != null) {
                                    for (int i = 0; i < list.size(); i++, index++) {%>
                                <tr>
                                    <td><%=index%>
                                    </td>
                                    <td><%=list.get(i).getName()%>
                                    </td>
                                    <td><%=DateUtil.toStandardFormat(list.get(i).getGmtCreate())%>
                                    </td>
                                    <td><%=list.get(i).getEmail()%>
                                    </td>
                                    <td class="text-center">
                                        <%--                                        fixme 如果接口失败，开关仍然保持原样--%>
                                        <%if (list.get(i).getStatus().equals(UserStatus.WAIT_APPROVE.getCode())) {%>
                                        <div id="shenhe<%=list.get(i).getEmail()%>"
                                             style="display: inline-block">不允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=list.get(i).getEmail()%>"
                                             param_role="<%=list.get(i).getRole()%>">
                                            <div isopen="false" class="btnn"></div>
                                        </div>

                                        <%} else if (list.get(i).getStatus().equals(UserStatus.ALLOWED.getCode())) {%>

                                        <div id="shenhe<%=list.get(i).getEmail()%>"
                                             style="display: inline-block">允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=list.get(i).getEmail()%>"
                                             param_role="<%=list.get(i).getRole()%>" style="background-color: #1976d2">
                                            <div isopen="ture" class="btnn" style="left: 15px;"></div>
                                        </div>

                                        <%} else {%>

                                        <div id="shenhe<%=list.get(i).getEmail()%>"
                                             style="display: inline-block">不允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=list.get(i).getEmail()%>"
                                             param_role="<%=list.get(i).getRole()%>">
                                            <div isopen="false" class="btnn"></div>
                                        </div>
                                        <%}%>
                                    </td>
                                    <td class="text-center">
                                        <a type="button" class="btn btn-link fa fa-edit"
                                           onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back7&email=<%=list.get(i).getEmail()%>'">
                                            查看详情</a>
                                        <%--												<a type="button" id="<%=list.get(i).getEmail()%>" class="btn btn-link fa fa-check-square" onclick="approveUser('<%=list.get(i).getEmail()%>', '<%=list.get(i).getRole()%>')"> 审核通过</a>--%>
                                        <a type="button" class="btn btn-link fa fa-trash-o"
                                           onclick="deleteProfessor(<%=list.get(i).getId()%>)"> 删除</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                <% List<CompanyDTO> companyDOS = (List<CompanyDTO>) request.getAttribute("companyList");%>

                                <%
                                    if (companyDOS != null) {
                                        for (int j = 0; j < companyDOS.size(); j++, index++) {
                                %>
                                <tr>
                                    <td><%=index%>
                                    </td>
                                    <td><%=companyDOS.get(j).getCompanyName()%>
                                    </td>
                                    <td><%=DateUtil.toStandardFormat(companyDOS.get(j).getGmtCreate())%>
                                    </td>
                                    <td><%=companyDOS.get(j).getEmail()%>
                                    </td>
                                    <td class="text-center">
                                        <%if (companyDOS.get(j).getStatus().equals(UserStatus.WAIT_APPROVE)) {%>
                                        <div id="shenhe<%=companyDOS.get(j).getEmail()%>"
                                             style="display: inline-block">不允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=companyDOS.get(j).getEmail()%>"
                                             param_role="<%=companyDOS.get(j).getRole().getCode()%>">
                                            <div isopen="false" class="btnn"></div>
                                        </div>

                                        <%} else if (companyDOS.get(j).getStatus().equals(UserStatus.ALLOWED)) {%>

                                        <div id="shenhe<%=companyDOS.get(j).getEmail()%>"
                                             style="display: inline-block">允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=companyDOS.get(j).getEmail()%>"
                                             param_role="<%=companyDOS.get(j).getRole().getCode()%>" style="background-color: #1976d2">
                                            <div isopen="ture" class="btnn" style="left: 15px;"></div>
                                        </div>

                                        <%} else {%>

                                        <div id="shenhe<%=companyDOS.get(j).getEmail()%>"
                                             style="display: inline-block">不允许
                                        </div>
                                        <div class="right1"
                                             param_email="<%=companyDOS.get(j).getEmail()%>"
                                             param_role="<%=companyDOS.get(j).getRole()%>">
                                            <div isopen="false" class="btnn"></div>
                                        </div>
                                        <%}%>
                                    </td>
                                    <td class="text-center">
                                        <a type="button" class="btn btn-link fa fa-edit"
                                           onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back12&email=<%=companyDOS.get(j).getEmail()%>'">
                                            查看详情</a>
                                        <a type="button" class="btn btn-link fa fa-trash-o"
                                           onclick="deleteCompany(<%=companyDOS.get(j).getId()%>)"> 删除</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>

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
    function approveUser(email, roleCode) {
        const data = new FormData();
        data.append("userEmail", email);
        data.append("roleCode", roleCode);

        $.ajax({
            url: "/toilet/admin/user/approve",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    // document.getElementById(email).hidden = true;
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }

    // 审核不通过
    // fixme 用户审核不通过接口
    function denyUser(email, roleCode) {
        const data = new FormData();
        data.append("userEmail", email);
        data.append("roleCode", roleCode);

        $.ajax({
            url: "/toilet/admin/user/deny",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    // document.getElementById(email).hidden = true;
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }

    function deleteProfessor(professor_id) {
        let data = new FormData();
        data.append("professorId", professor_id)
        $.ajax({
            url: "/toilet/admin/professor/delete",
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

    function deleteCompany(company_id) {
        let data = new FormData();
        data.append("companyId", company_id)
        $.ajax({
            url: "/toilet/admin/company/delete",
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
</script>
<%--滑动按钮滑动时改变样式--%>
<script>

    function setOpen(obj) {
        obj.children('div').attr('isopen', 'true').animate({left: '15px'});
        obj.css('background-color', '#1976d2');
    }

    function setClose(obj) {
        obj.children('div').attr('isopen', 'false').animate({left: '0px'});
        obj.css('background-color', '#838383');
    }
</script>
<%--滑动审核按钮事件--%>
<script>
    $(function () {
        $('.right1').on('click', function () {
            var ele = document.getElementById('shenhe' + $(this).attr('param_email'))
            if ($(this).children('div').attr('isopen') == 'false') {
                setOpen($(this));
                ele.innerHTML = "";
                ele.innerHTML = "允许";
                approveUser($(this).attr('param_email'), $(this).attr('param_role'));
            } else {
                setClose($(this));
                ele.innerHTML = "";
                ele.innerHTML = "不允许";
                denyUser($(this).attr('param_email'), $(this).attr('param_role'));
            }
        });
    });
</script>

</body>
</html>
