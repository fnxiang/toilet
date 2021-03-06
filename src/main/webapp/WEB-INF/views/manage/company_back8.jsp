<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.bjtu.toilet.constant.AuditStatus" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
                    <a href="${pageContext.request.contextPath}/company/index" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品申请</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back8" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-pencil"></i>模式申请</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back2"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>企业基本信息</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back3"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back_modeInsert"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-info-circle"></i>模式信息录入</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back4"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <jsp:include page="company_header.jsp"/>
    <!-- /header -->
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
                                <li class="active">模式申请信息</li>
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
                        <div class="card-header" id="chanpinxinxi">
                            <strong class="card-title" onclick="change('chanpin')">模式申请</strong>
                        </div>

                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align: center">序号</th>
                                    <th style="text-align: center">模式名称</th>
                                    <th style="text-align: center">状态</th>
                                    <th style="text-align: center">操作</th>
                                </tr>
                                </thead>
                                <% List<ToiletPatternDTO> Patternlist = (List<ToiletPatternDTO>) request.getAttribute("patternList");%>
                                <tbody>
                                <% for (int i = 0; i < Patternlist.size(); i++) {%>
                                <tr>
                                    <td style="text-align: center"><%=i + 1%>
                                    </td>
                                    <td style="text-align: center"><%=Patternlist.get(i).getPatternType()%>
                                    </td>
                                    <td style="text-align: center"><%=Patternlist.get(i).getStatus().getName()%>
                                    </td>
                                    <td style="text-align: center"><a type="button" class="btn btn-link fa fa-edit" id="xiugaimoshi"
                                                                      onclick="javascript:window.location.href='/toilet/toPage?url=company_back11&patternId=<%=Patternlist.get(i).getId()%>'" <%if(Patternlist.get(i).getStatus() == AuditStatus.WAITED || Patternlist.get(i).getStatus() == AuditStatus.UNKNOWN){}else{%>  style="display: none" <%}%>>修改信息</a>
                                        <%if (Patternlist.get(i).getStatus().equals(AuditStatus.APPROVAL)
                                                || Patternlist.get(i).getStatus().equals(AuditStatus.DENY)
                                                || Patternlist.get(i).getStatus().equals(AuditStatus.WAITED_AMEND)) {%>
                                        <a type="button" class="btn btn-link fa fa-eye" onclick="javascript:window.location.href='/toilet/toPage?url=company_back10&patternId=<%=Patternlist.get(i).getId()%>'">查看审批意见</a>
                                        <%} if (Patternlist.get(i).getStatus().equals(AuditStatus.WAITED)
                                                ||Patternlist.get(i).getStatus().equals(AuditStatus.UNKNOWN) || Patternlist.get(i).getStatus().equals(AuditStatus.WAITED_AMEND)) {%>
                                        <a type="button" class="btn btn-link fa fa-upload" id="shenhe"
                                           onclick="submit('<%=Patternlist.get(i).getId()%>', '<%=Patternlist.get(i).getStatus().getCode()%>')">提交审核</a>
                                        <%}%>

                                        <a type="button" class="btn btn-link fa fa-info-circle" onclick="javascript:window.location.href='/toilet/toPage?url=company_back9&patternId=<%=Patternlist.get(i).getId()%>'">模式详情</a>
                                        <a type="button" class="btn btn-link fa fa-trash-o" onclick="confirm_delete('pattern', <%=Patternlist.get(i).getId()%>)"> 删除</a>
                                    </td>
                                </tr>
                                <%}%>

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
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable(
        );
    });

    function submit(patternId, cur_status) {
        const data = new FormData();
        data.append("patternId", patternId);
        if(cur_status === <%=AuditStatus.WAITED_AMEND.getCode()%>){
            data.append("statusCode", '<%=AuditStatus.WAITED_PROFESSOR.getCode()%>');
        }else{
            data.append("statusCode", '<%=AuditStatus.WAITED_ASSIGN.getCode()%>');
        }

        $.ajax({
            url: "/toilet/company/pattern/audit/submit",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    show("提交审核成功！");
                    location.reload();
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }
</script>
<script type="text/javascript">
    function deletePattern(pattern_id) {
        let data = new FormData();
        data.append("patternId", pattern_id)
        $.ajax({
            url: "/toilet/company/pattern/delete",
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

</body>
</html>
