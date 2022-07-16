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
                                                    <input class="col-md-1" name="temperature_check" type="checkbox" value="寒冷地区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("寒冷地区")){%>
                                                           checked="checked" <%}}%>>寒冷地区</input>
                                                    <input class="col-md-1" name="temperature_check" type="checkbox"  value="普通地区"  <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通地区")){%>
                                                           checked="checked" <%}}%>>普通地区</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">水资源条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getWaterResource().split(",");%>
                                                    <input class="col-md-1" type="checkbox" name="water_check" value="缺水"  <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("缺水")){%>
                                                           checked="checked" <%}}%>>缺水</input>
                                                    <input class="col-md-1" type="checkbox" name="water_check" value="良好" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("良好")){%>
                                                           checked="checked" <%}}%>>良好</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">地形条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getTerrain().split(",");%>
                                                    <input class="col-md-1" type="checkbox" name="dixing_check" value="平原" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("平坦")){%>
                                                           checked="checked" <%}}%>>平原</input>
                                                    <input class="col-md-1" type="checkbox" name="dixing_check" value="丘陵" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("丘陵")){%>
                                                           checked="checked" <%}}%>>丘陵</input>
                                                    <input class="col-md-1" type="checkbox" name="dixing_check" value="山地" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("山地")){%>
                                                           checked="checked" <%}}%>>山地</input>
                                                    <input class="col-md-1" type="checkbox" name="dixing_check" value="高原" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("高原")){%>
                                                           checked="checked" <%}}%>>高原</input>
                                                    <input class="col-md-1" type="checkbox" name="dixing_check" value="盆地" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("盆地")){%>
                                                           checked="checked" <%}}%>>盆地</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">地理位置条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getGeolocation().split(",");%>
                                                    <input  class="col-md-1" type="checkbox" name="diliweizhi_check" value="中心镇" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("中心镇")){%>
                                                            checked="checked" <%}}%>>中心镇</input>
                                                    <input  class="col-md-1" type="checkbox" name="diliweizhi_check" value="一般镇" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("一般镇")){%>
                                                            checked="checked" <%}}%>>一般镇</input>
                                                    <input  class="col-md-1" type="checkbox" name="diliweizhi_check" value="中心村" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("中心村")){%>
                                                            checked="checked" <%}}%>>中心村</input>
                                                    <input  class="col-md-1" type="checkbox" name="diliweizhi_check" value="基层村" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("基层村")){%>
                                                            checked="checked" <%}}%>>基层村</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">生态限制条件：</label></div>
                                                <div class="col-12 col-md-9">
                                                    <%strArray = patternDTO.getEnvConditions().getEcotope().split(",");%>
                                                    <input class="col-md-1" type="checkbox" name="shengtai_check" value="生态保护区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("生态保护区")){%>
                                                           checked="checked" <%}}%>>生态保护区</input>
                                                    <input class="col-md-1" type="checkbox" name="shengtai_check" value="水源保护区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("水源保护区")){%>
                                                           checked="checked" <%}}%>>水源保护区</input>
                                                    <input class="col-md-1" type="checkbox" name="shengtai_check" value="普通地区" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通地区")){%>
                                                           checked="checked" <%}}%>>普通地区</input>
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
                                                    <input class="col-md-1" type="checkbox" name="renkou_check" value="聚集" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("聚集")){%>
                                                           checked="checked" <%}}%>>聚集</input>
                                                    <input class="col-md-1" type="checkbox" name="renkou_check" value="分散" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("分散")){%>
                                                           checked="checked" <%}}%>>分散</input>
                                                    <input class="col-md-1" type="checkbox" name="renkou_check" value="普通" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("普通")){%>
                                                           checked="checked" <%}}%>>普通</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">液态肥使用习惯：</label></div>
                                                <div class="col-12 col-md-9 radio" id="yetaifei">
                                                    <%strArray = patternDTO.getHumanFactors().getUsageHabits().split(",");%>
                                                    <input class="col-md-1" type="radio" value="是" name="yetaifei" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("是")){%>
                                                           checked="checked" <%}}%>>是</input>
                                                    <input class="col-md-1" type="radio" value="否" name="yetaifei" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("否")){%>
                                                           checked="checked" <%}}%>>否</input>
                                                    <input class="col-md-1" type="radio" value="均可" name="yetaifei" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("均可")){%>
                                                           checked="checked" <%}}%>>均可</input>
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
                                                <div class="col-12 col-md-9 radio" id="wangguantiaojian">
                                                    <input class="col-md-1" type="radio" value="是" name="wangguantiaojian" <%if(patternDTO.getPipNetworkConditions().getHasSewerLines()){%>
                                                           checked="checked" <%}%>>是</input>
                                                    <input class="col-md-1" type="radio" value="否" name="wangguantiaojian" <%if(!patternDTO.getPipNetworkConditions().getHasSewerLines()){%>
                                                           checked="checked" <%}%>>否</input>
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
                                                <div class="col-12 col-md-9 radio" id="zhaoqi">
                                                    <input class="col-md-1" type="radio" value="是" name="zhaoqi" <%if(patternDTO.getResourceUtilization().getIsBiogasUtilization()){%>
                                                           checked="checked" <%}%>>是</input>
                                                    <input class="col-md-1" type="radio" value="否" name="zhaoqi" <%if(!patternDTO.getResourceUtilization().getIsBiogasUtilization()){%>
                                                           checked="checked" <%}%>>否</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">可以与其他生活污水混合处理：</label></div>
                                                <div class="col-12 col-md-9 radio" id="wushuihunhe">
                                                    <%strArray = patternDTO.getResourceUtilization().getMixedSewageTreatment().split(",");%>
                                                    <input class="col-md-1" type="radio" value="是" name="wushuihunhe" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("是")){%>
                                                           checked="checked" <%}}%>>是</input>
                                                    <input class="col-md-1" type="radio" value="否" name="wushuihunhe" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("否")){%>
                                                           checked="checked" <%}}%>>否</input>
                                                    <input class="col-md-1" type="radio" value="均可" name="wushuihunhe" <%for(int i = 0; i < strArray.length; i++){if(strArray[i].equals("均可")){%>
                                                           checked="checked" <%}}%>>均可</input>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="select" class=" form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：</label></div>
                                                <div class="col-12 col-md-9 radio" id="yibingchuli">
                                                    <input class="col-md-1" type="radio" name="yibingchuli" value="是" <%if(patternDTO.getResourceUtilization().getOtherTreatment()){%>
                                                           checked="checked" <%}%>>是</input>
                                                    <input class="col-md-1" type="radio" name="yibingchuli" value="否"  <%if(!patternDTO.getResourceUtilization().getOtherTreatment()){%>
                                                           checked="checked" <%}%>>否</input>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary"
                                        onclick="mode_enter('<%=patternDTO.getId()%>')">
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
</script>
<script>
    function mode_enter(patternId) {

        var data = new FormData();
        data.append("patternId", patternId);
        data.append("productType", '<%=patternDTO.getProductType()%>');
        data.append("patternType", '<%=patternDTO.getPatternType()%>'); //模式类型
        data.append("patternInfo", '<%=patternDTO.getPatternInfo()%>'); //模式介绍


        //新模式参数
        const temperaturecheckbox = document.getElementsByName("temperature_check"); //温度条件
        let temperature_check_val = "";
        for (let k = 0; k < temperaturecheckbox.length; k++) {
            if (temperaturecheckbox[k].checked)
                if(temperature_check_val === ""){
                    temperature_check_val = temperaturecheckbox[k].value;
                }else{
                    temperature_check_val = temperature_check_val + "," + temperaturecheckbox[k].value;
                }
        }
        data.append("natureTemp", encodeURI(temperature_check_val));

        const watercheckbox = document.getElementsByName("water_check"); //水资源条件
        let water_check_val = "";
        for (let k = 0; k < watercheckbox.length; k++) {
            if (watercheckbox[k].checked) {
                if(water_check_val === ""){
                    water_check_val = watercheckbox[k].value;
                }else{
                    water_check_val = water_check_val + "," + watercheckbox[k].value;
                }

            }
        }
        data.append("water", encodeURI(water_check_val));

        const dixingcheckbox = document.getElementsByName("dixing_check"); //地形条件
        let dixing_check_val = "";
        for (let k = 0; k < dixingcheckbox.length; k++) {
            if (dixingcheckbox[k].checked){
                if(dixing_check_val === ""){
                    dixing_check_val = dixingcheckbox[k].value;
                }else{
                    dixing_check_val = dixing_check_val + "," + dixingcheckbox[k].value;
                }
            }

        }
        data.append("terrain", encodeURI(dixing_check_val));

        const positioncheckbox = document.getElementsByName("diliweizhi_check"); //地理位置条件
        let position_check_val = "";
        for (let k = 0; k < positioncheckbox.length; k++) {
            if (positioncheckbox[k].checked){
                if(position_check_val === ""){
                    position_check_val = positioncheckbox[k].value;
                }else{
                    position_check_val = position_check_val + "," + positioncheckbox[k].value;
                }
            }

        }
        data.append("geolocation", encodeURI(position_check_val));

        const shengtaicheckbox = document.getElementsByName("shengtai_check"); //生态限制条件
        let shengtai_check_val = "";
        for (let k = 0; k < shengtaicheckbox.length; k++) {
            if (shengtaicheckbox[k].checked){
                if(shengtai_check_val === ""){
                    shengtai_check_val = shengtaicheckbox[k].value;
                }else{
                    shengtai_check_val = shengtai_check_val + "," + shengtaicheckbox[k].value;
                }
            }

        }
        data.append("ecotope", encodeURI(shengtai_check_val));

        const renkoucheckbox = document.getElementsByName("renkou_check"); //人口密集程度
        let renkou_check_val = "";
        for (let k = 0; k < renkoucheckbox.length; k++) {
            if (renkoucheckbox[k].checked){
                if(renkou_check_val === ""){
                    renkou_check_val = renkoucheckbox[k].value;
                }else{
                    renkou_check_val = renkou_check_val + "," + renkoucheckbox[k].value;
                }
            }

        }
        data.append("density", encodeURI(renkou_check_val));

         //液态肥使用习惯
        data.append("usageHabits", encodeURI($("input[name='yetaifei']:checked").val()));

        myselect = document.getElementById("wangguantiaojian"); //具有管网条件
        data.append("sewerLines", encodeURI($("input[name='wangguantiaojian']:checked").val()));


        myselect = document.getElementById("zhaoqi"); //具有沼气利用工程
        data.append("biogasUtilization", encodeURI($("input[name='zhaoqi']:checked").val()));

        myselect = document.getElementById("wushuihunhe"); //计划与其他生活污水混合处理
        data.append("mixedTreatment", encodeURI($("input[name='wushuihunhe']:checked").val()));

        myselect = document.getElementById("yibingchuli"); //计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
        data.append("otherTreatment", encodeURI($("input[name='yibingchuli']:checked").val()));
        for(var key in data.keys()){
            console.log(data.get(key))
        }
        $.ajax({
            url: "/toilet/company/pattern/modify",
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
