<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.ApprovalDTO" %>
<%@ page import="org.springframework.util.StringUtils" %>
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
                    <a href="${pageContext.request.contextPath}/professor/index" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品信息审核列表</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>模式审核列表</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>基本信息</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">
    <%--		fixme patternDTO为空--%>
    <%ToiletPatternDTO patternDTO = (ToiletPatternDTO) request.getAttribute("pattern");%>
    <%
        ApprovalDTO approvalDTO = (ApprovalDTO) request.getAttribute("approval");
        String status = "";
        String content = "";
        if (approvalDTO != null) {
            status = approvalDTO.getStatus().getName();
            content = approvalDTO.getContent();
        }
        String productStatus = patternDTO.getStatus().getName();
    %>

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
                                <li>模式审核列表</li>
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
                            <strong class="card-title">模式审核</strong>
                        </div>
                        <div class="card-body">
                            <div id="newModeAdding" style="">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">新模式名称</label></div>
                                    <div class="col-12 col-md-4"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="<%=patternDTO.getPatternType()%>" disabled></div>
                                </div>


                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-nature-tab" data-toggle="tab" href="#custom-nav-nature" role="tab" aria-controls="custom-nav-nature" aria-selected="true">适用条件：自然环境条件</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-nature" role="tabpanel" aria-labelledby="custom-nav-nature-tab">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">温度条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%String[] strArray = null;
                                                        strArray = patternDTO.getEnvConditions().getTemperature().split(",");%>
                                                    <input class="col-md-1" type="checkbox" value="寒冷地区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("寒冷地区")){%>
                                                           checked="checked" <%}}%> disabled>寒冷地区</input>
                                                    <input class="col-md-1" type="checkbox"  value="普通地区"  <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通地区")){%>
                                                           checked="checked" <%}}%> disabled>普通地区</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">水资源条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getWaterResource().split(",");%>
                                                    <input class="col-md-1" type="checkbox"  value="缺水"  <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("缺水")){%>
                                                           checked="checked" <%}}%> disabled>缺水</input>
                                                    <input class="col-md-1" type="checkbox"  value="良好" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("良好")){%>
                                                           checked="checked" <%}}%> disabled>良好</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">地形条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getTerrain().split(",");%>
                                                    <input class="col-md-1" type="checkbox"  value="平原" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("平坦")){%>
                                                           checked="checked" <%}}%> disabled>平原</input>
                                                    <input class="col-md-1" type="checkbox"  value="丘陵" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("丘陵")){%>
                                                           checked="checked" <%}}%> disabled>丘陵</input>
                                                    <input class="col-md-1" type="checkbox"  value="山地" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("山地")){%>
                                                           checked="checked" <%}}%> disabled>山地</input>
                                                    <input class="col-md-1" type="checkbox"  value="高原" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("高原")){%>
                                                           checked="checked" <%}}%>disabled>高原</input>
                                                    <input class="col-md-1" type="checkbox"  value="盆地" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("盆地")){%>
                                                           checked="checked" <%}}%>disabled>盆地</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">地理位置条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getGeolocation().split(",");%>
                                                    <input  class="col-md-1" type="checkbox"  value="中心镇" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("中心镇")){%>
                                                            checked="checked" <%}}%>disabled>中心镇</input>
                                                    <input  class="col-md-1" type="checkbox"  value="一般镇" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("一般镇")){%>
                                                            checked="checked" <%}}%>disabled>一般镇</input>
                                                    <input  class="col-md-1" type="checkbox"  value="中心村" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("中心村")){%>
                                                            checked="checked" <%}}%>disabled>中心村</input>
                                                    <input  class="col-md-1" type="checkbox"  value="基层村" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("基层村")){%>
                                                            checked="checked" <%}}%>disabled>基层村</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">生态限制条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getEcotope().split(",");%>
                                                    <input class="col-md-1" type="checkbox"  value="生态保护区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("生态保护区")){%>
                                                           checked="checked" <%}}%>disabled>生态保护区</input>
                                                    <input class="col-md-1" type="checkbox" value="水源保护区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("水源保护区")){%>
                                                           checked="checked" <%}}%>disabled>水源保护区</input>
                                                    <input class="col-md-1" type="checkbox" value="普通地区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通地区")){%>
                                                           checked="checked" <%}}%>disabled>普通地区</input>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-people-tab" data-toggle="tab" href="#custom-nav-people" role="tab" aria-controls="custom-nav-people" aria-selected="true">适用条件：人文因素</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-people" role="tabpanel" aria-labelledby="custom-nav-people-tab">

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">人口密集程度：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getHumanFactors().getDensity().split(",");%>
                                                    <input class="col-md-1" type="checkbox" value="聚集" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("聚集")){%>
                                                           checked="checked" <%}}%> disabled>聚集</input>
                                                    <input class="col-md-1" type="checkbox" value="分散" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("分散")){%>
                                                           checked="checked" <%}}%> disabled>分散</input>
                                                    <input class="col-md-1" type="checkbox" value="普通" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通")){%>
                                                           checked="checked" <%}}%> disabled>普通</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">液态肥使用习惯：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control" disabled>
                                                        <option value="0" <%if(patternDTO.getHumanFactors().getUsageHabits().equals("是")){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getHumanFactors().getUsageHabits().equals("否")){%>
                                                                selected="selected" <%}%>>否</option>
                                                        <option value="2" <%if(patternDTO.getHumanFactors().getUsageHabits().equals("均可")){%>
                                                                selected="selected" <%}%>>均可</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-pip-tab" data-toggle="tab" href="#custom-nav-pip" role="tab" aria-controls="custom-nav-pip" aria-selected="true">适用条件：管网条件</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-pip" role="tabpanel" aria-labelledby="custom-nav-pip-tab">

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">需要具备管网条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control" disabled>
                                                        <option value="0" <%if(patternDTO.getPipNetworkConditions().getHasSewerLines().equals("是")){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getPipNetworkConditions().getHasSewerLines().equals("否")){%>
                                                                selected="selected" <%}%>>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-resource-tab" data-toggle="tab" href="#custom-nav-resource" role="tab" aria-controls="custom-nav-resource" aria-selected="true">适用条件：资源化利用</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-resource" role="tabpanel" aria-labelledby="custom-nav-resource-tab">

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">具有沼气利用工程：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control" disabled>
                                                        <option value="0" <%if(patternDTO.getResourceUtilization().getIsBiogasUtilization().equals("是")){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getResourceUtilization().getIsBiogasUtilization().equals("否")){%>
                                                                selected="selected" <%}%>>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">可以与其他生活污水混合处理：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control" disabled>
                                                        <option value="0" <%if(patternDTO.getResourceUtilization().getMixedSewageTreatment().equals("是")){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getResourceUtilization().getMixedSewageTreatment().equals("否")){%>
                                                                selected="selected" <%}%>>否</option>
                                                        <option value="2" <%if(patternDTO.getResourceUtilization().getMixedSewageTreatment().equals("均可")){%>
                                                                selected="selected" <%}%>>均可</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control" disabled>
                                                        <option value="0" <%if(patternDTO.getResourceUtilization().getOtherTreatment().equals("是")){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1"  <%if(patternDTO.getResourceUtilization().getOtherTreatment().equals("否")){%>
                                                                selected="selected" <%}%>>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <%if(!productStatus.equals("等待提交审核") && !productStatus.equals("无状态")){%>
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="select_status" class=" form-control-label">是否通过</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="select_status" id="select_status" class="form-control" <%if(productStatus.equals("等待专家审核")){}else{%> disabled <%}%>>
                                            <option value="审核通过"
                                                    <%if (StringUtils.isEmpty(status) || status.equals("审核通过")){%>selected="selected"<%}%>>审核通过
                                            </option>
                                            <option value="审核不通过"
                                                    <%if (status.equals("审核不通过")){%>selected="selected"<%}%>>审核不通过
                                            </option>
                                            <option value="修改后重新审核"
                                                    <%if (status.equals("修改后重新审核")){%>selected="selected"<%}%>>修改后重新审核
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="opinion"
                                                                     class=" form-control-label">审核意见</label></div>
                                    <div class="col-12 col-md-9"><textarea name="opinion" id="opinion"
                                                                           rows="9" placeholder=""
                                                                           class="form-control" <%if(StringUtils.isEmpty(productStatus) || productStatus.equals("等待专家审核")){}else{%> disabled <%}%>><%=content%></textarea>
                                    </div>
                                </div>
                            </form>
                            <%}%>
                            <%if(productStatus.equals("等待专家审核")){%>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary" onclick="commit()">
                                    确认提交
                                </button>
                                <button type="button" class="btn btn-outline-secondary offset-2"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back2'">返回
                                </button>
                            </div>
                            <%}else{%>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back2'">返回
                                </button>
                            </div>
                            <%}%>
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
        $('#bootstrap-data-table-export').DataTable();
    });
</script>
<script>
    function commit() {
        const data = new FormData();
        data.append("patternId", "<%=patternDTO.getId()%>");
        data.append("auditStatus", encodeURI(document.querySelector('#select_status option:checked').text));
        data.append("comment", encodeURI($('#opinion').val()));
        console.log(data.get("status"));
        console.log(data.get("comment"));
        $.ajax({
            url: "/toilet/professor/pattern/audit",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    show("提交成功！");
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }
</script>


</body>
</html>
