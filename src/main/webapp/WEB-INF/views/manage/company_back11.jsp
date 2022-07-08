<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO" %>
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

    <link rel="shortcut icon" href="${pageContext.request.contextPath}">

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
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <jsp:include page="company_header.jsp"/>
    <!-- Header-->
    <% ToiletPatternDTO patternDTO = (ToiletPatternDTO)request.getAttribute("pattern");%>
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
                                <li class="active">我的申请</li>
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
                            <strong class="card-title">模式信息修改</strong>
                        </div>
                        <div class="card-body card-block">
                            <div id="newModeAdding" style="">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="moshimingcheng" class=" form-control-label">新模式名称</label></div>
                                    <div class="col-12 col-md-4"><input type="text" id="moshimingcheng" name="moshimingcheng" placeholder="" class="form-control" value="<%=patternDTO.getPatternType()%>" disabled></div>
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
                                                <div class="col col-md-3"><label for="wendutiaojian" class=" form-control-label">温度条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="wendutiaojian" id="wendutiaojian" class="form-control">
                                                        <option value="寒冷地区" <%if(patternDTO.getEnvConditions().getTemperature().equals("寒冷地区")){%>
                                                                selected="selected" <%}%>>寒冷地区</option>
                                                        <option value="普通地区"  <%if(patternDTO.getEnvConditions().getTemperature().equals("普通地区")){%>
                                                                selected="selected" <%}%>>普通地区</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="shuiziyuan" class=" form-control-label">水资源条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="shuiziyuan" id="shuiziyuan" class="form-control">
                                                        <option value="缺水"  <%if(patternDTO.getEnvConditions().getWaterResource().equals("缺水")){%>
                                                                selected="selected" <%}%>>缺水</option>
                                                        <option value="良好" <%if(patternDTO.getEnvConditions().getWaterResource().equals("良好")){%>
                                                                selected="selected" <%}%>>良好</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="dixing" class=" form-control-label">地形条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="dixing" id="dixing" class="form-control">
                                                        <option value="0" <%if(patternDTO.getEnvConditions().getTerrain().equals("平坦")){%>
                                                                selected="selected" <%}%>>平坦</option>
                                                        <option value="1" <%if(patternDTO.getEnvConditions().getTerrain().equals("丘陵")){%>
                                                                selected="selected" <%}%>>丘陵</option>
                                                        <option value="2" <%if(patternDTO.getEnvConditions().getTerrain().equals("山地")){%>
                                                                selected="selected" <%}%>>山地</option>
                                                        <option value="2" <%if(patternDTO.getEnvConditions().getTerrain().equals("高原")){%>
                                                                selected="selected" <%}%>>高原</option>
                                                        <option value="3" <%if(patternDTO.getEnvConditions().getTerrain().equals("盆地")){%>
                                                                selected="selected" <%}%>>盆地</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="diliweizhi" class=" form-control-label">地理位置条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="diliweizhi" id="diliweizhi" class="form-control">
                                                        <option value="0" <%if(patternDTO.getEnvConditions().getGeolocation().equals("中心镇")){%>
                                                                selected="selected" <%}%>>中心镇</option>
                                                        <option value="1" <%if(patternDTO.getEnvConditions().getGeolocation().equals("一般镇")){%>
                                                                selected="selected" <%}%>>一般镇</option>
                                                        <option value="2" <%if(patternDTO.getEnvConditions().getGeolocation().equals("中心村")){%>
                                                                selected="selected" <%}%>>中心村</option>
                                                        <option value="3" <%if(patternDTO.getEnvConditions().getGeolocation().equals("基层村")){%>
                                                                selected="selected" <%}%>>基层村</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="shengtai" class=" form-control-label">生态限制条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="shengtai" id="shengtai" class="form-control">
                                                        <option value="0" <%if(patternDTO.getEnvConditions().getEcotope().equals("生态保护区")){%>
                                                                selected="selected" <%}%>>生态保护区</option>
                                                        <option value="1" <%if(patternDTO.getEnvConditions().getEcotope().equals("水源保护区")){%>
                                                                selected="selected" <%}%>>水源保护区</option>
                                                        <option value="2" <%if(patternDTO.getEnvConditions().getEcotope().equals("普通地区")){%>
                                                                selected="selected" <%}%>>普通地区</option>
                                                    </select>
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
                                                <div class="col col-md-3"><label for="renkou" class=" form-control-label">人口密集程度：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="renkou" id="renkou" class="form-control">
                                                        <option value="0" <%if(patternDTO.getHumanFactors().getDensity().equals("聚集")){%>
                                                                selected="selected" <%}%>>聚集</option>
                                                        <option value="1" <%if(patternDTO.getHumanFactors().getDensity().equals("分散")){%>
                                                                selected="selected" <%}%>>分散</option>
                                                        <option value="2" <%if(patternDTO.getHumanFactors().getDensity().equals("普通")){%>
                                                                selected="selected" <%}%>>普通</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="yetaifei" class=" form-control-label">液态肥使用习惯：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="yetaifei" id="yetaifei" class="form-control">
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
                                                <div class="col col-md-3"><label for="guandao" class=" form-control-label">需要具备管网条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="guandao" id="guandao" class="form-control">
                                                        <option value="0" <%if(patternDTO.getPipNetworkConditions().getHasSewerLines()){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getPipNetworkConditions().getHasSewerLines()){%>
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
                                                <div class="col col-md-3"><label for="zhaoqi" class=" form-control-label">具有沼气利用工程：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="zhaoqi" id="zhaoqi" class="form-control">
                                                        <option value="0" <%if(patternDTO.getResourceUtilization().getIsBiogasUtilization()){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1" <%if(patternDTO.getResourceUtilization().getIsBiogasUtilization()){%>
                                                                selected="selected" <%}%>>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="hunhe" class=" form-control-label">可以与其他生活污水混合处理：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="hunhe" id="hunhe" class="form-control">
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
                                                <div class="col col-md-3"><label for="jihua" class=" form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="jihua" id="jihua" class="form-control">
                                                        <option value="0" <%if(patternDTO.getResourceUtilization().getOtherTreatment()){%>
                                                                selected="selected" <%}%>>是</option>
                                                        <option value="1"  <%if(patternDTO.getResourceUtilization().getOtherTreatment()){%>
                                                                selected="selected" <%}%>>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary"
                                        onclick="mode_enter()">
                                    确认修改
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
<%--弹窗--%>
<jsp:include page="../common/dialog.jsp"/>
<%--弹窗--%>
<!-- /#right-panel -->

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

    <%--	文字提示	--%>
    $('use_for').tooltip({boundary: 'window'});

    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });

    function mode_enter() {

        var data = new FormData();

        data.append("patternName", encodeURI($('#moshimingcheng').val())); //模式名称
        //新模式参数
        data.append("natureTemp", encodeURI(document.querySelector('#wendutiaojian option:checked').value)); //温度条件
        data.append("water", encodeURI(document.querySelector('#shuiziyuan option:checked').value)); //水资源条件
        data.append("terrain", encodeURI(document.querySelector('#dixing option:checked').value)); //地形条件
        data.append("geolocation", encodeURI(document.querySelector('#diliweizhi option:checked').value)); //地理位置条件
        data.append("ecotope", encodeURI(document.querySelector('#shengtai option:checked').value)); //生态限制条件
        data.append("density", encodeURI(document.querySelector('#renkou option:checked').value)); //人口密集程度
        data.append("usageHabits", encodeURI(document.querySelector('#yetaifei option:checked').value)); //液态肥使用习惯
        data.append("sewerLines", encodeURI(document.querySelector('#guandao option:checked').value)); //具有管网条件
        data.append("biogasUtilization", encodeURI(document.querySelector('#zhaoqi option:checked').value)); //具有沼气利用工程
        data.append("mixedTreatment", encodeURI(document.querySelector('#hunhe option:checked').value)); //计划与其他生活污水混合处理
        data.append("otherTreatment", encodeURI(document.querySelector('#jihua option:checked').value)); //计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理

        $.ajax({
            url: "/toilet/company/pattern/entry",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    show("修改成功！");
                } else {
                    show(result.errorMessage);
                }
            }
        });
    }

</script>


</body>
</html>
