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
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back1"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>我的申请</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back2"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>企业基本信息</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back3"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
                </li>
                <li class="active">
                    <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>模式信息录入</a>
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
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/company/index"><img
                        src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">

                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="user-avatar rounded-circle"
                             src="${pageContext.request.contextPath}/static/manage/./res/logo.png" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href=".${pageContext.request.contextPath}/toPage?url=company_back2"><i
                                class="fa fa-user"></i>企业信息管理</a>

                        <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=company_back4"><i
                                class="fa fa-cog"></i>设置</a>

                        <a class="nav-link" href="${pageContext.request.contextPath}"><i class="fa fa-power-off"></i>注销</a>
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
                            <h1>模式信息录入</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                <li class="active">模式信息录入</li>
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
                            <strong class="card-title">模式信息录入</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="product_type" class="form-control-label">产品类型
                                        <i id="product_type_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入产品类型注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="product_type"
                                                                        name="product_type"
                                                                        placeholder="产品类型" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="producer_mode_type"
                                                                     class="form-control-label">模式类型
                                        <i id="producer_mode_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入模式类型注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="producer_mode_type"
                                                                        name="producer_mode_type"
                                                                        placeholder="请输入模式类型,例如:洁具便器+化粪池+分散处理"
                                                                        class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="producer_mode_info"
                                                                     class="form-control-label">模式介绍
                                        <i id="producer_mode_info_tips" class="fa fa-question-circle"
                                           data-toggle="tooltip"
                                           data-placement="top" title="输入模式介绍注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="producer_mode_info"
                                                                           id="producer_mode_info"
                                                                           rows="5"
                                                                           placeholder="前端是水冲式户厕，农户产生的粪便和生活污水通过化粪井……"
                                                                           class="form-control"></textarea></div>
                                </div>

                                <!--  style="display:none;"  -->
                                <div id="newModeAdding" style="">

                                    <div class="custom-tab">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active show" id="custom-nav-nature-tab"
                                                   data-toggle="tab" href="#custom-nav-nature" role="tab"
                                                   aria-controls="custom-nav-nature"
                                                   aria-selected="true">适用条件：自然环境条件</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                            <div class="tab-pane fade active show" id="custom-nav-nature"
                                                 role="tabpanel" aria-labelledby="custom-nav-nature-tab">

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class=" form-control-label">温度条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="temperature_check"
                                                               value="高寒"/>高寒
                                                        <input class="col-md-1" type="checkbox" name="temperature_check"
                                                               value="普通"/>普通
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class=" form-control-label">水资源条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="water_check"
                                                               value="缺水"/>缺水
                                                        <input class="col-md-1" type="checkbox" name="water_check"
                                                               value="良好"/>良好
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">地形条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="dixing_check"
                                                               value="山区"/>山区
                                                        <input class="col-md-1" type="checkbox" name="dixing_check"
                                                               value="丘陵"/>丘陵
                                                        <input class="col-md-1" type="checkbox" name="dixing_check"
                                                               value="一般地区"/>一般地区
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">地理位置条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check"
                                                               value="城市近郊"/>城市近郊
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check"
                                                               value="城中村"/>城中村
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check"
                                                               value="中心城镇地区"/>中心城镇地区
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check"
                                                               value="一般地区"/>一般地区
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">生态限制条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check"
                                                               value="生态保护区"/>生态保护区
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check"
                                                               value="水源保护区"/>水源保护区
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check"
                                                               value="一般地区"/>一般地区
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="custom-tab">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active show" id="custom-nav-people-tab"
                                                   data-toggle="tab" href="#custom-nav-people" role="tab"
                                                   aria-controls="custom-nav-people" aria-selected="true">适用条件：人文因素
                                                    <i class="fa fa-question-circle" data-toggle="tooltip"
                                                       data-placement="top" title="输入注意事项"></i></a>
                                            </div>
                                        </nav>
                                        <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                            <div class="tab-pane fade active show" id="custom-nav-people"
                                                 role="tabpanel" aria-labelledby="custom-nav-people-tab">

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">人口密集程度：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="renkou_check"
                                                               value="聚集"/>聚集
                                                        <input class="col-md-1" type="checkbox" name="renkou_check"
                                                               value="分散"/>分散
                                                        <input class="col-md-1" type="checkbox" name="renkou_check"
                                                               value="一般"/>一般
                                                    </div>
                                                </div>


                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="yetaifei"
                                                                                     class="form-control-label">液态肥使用习惯：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="yetaifei" id="yetaifei" class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                            <option value="2">均可</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-tab">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active show" id="custom-nav-pip-tab"
                                                   data-toggle="tab" href="#custom-nav-pip" role="tab"
                                                   aria-controls="custom-nav-pip" aria-selected="true">适用条件：管网条件
                                                    <i class="fa fa-question-circle" data-toggle="tooltip"
                                                       data-placement="top" title="输入注意事项"></i></a>
                                            </div>
                                        </nav>
                                        <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                            <div class="tab-pane fade active show" id="custom-nav-pip" role="tabpanel"
                                                 aria-labelledby="custom-nav-pip-tab">

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="wushuiguandao"
                                                                                     class="form-control-label">具有污水管道：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="wushuiguandao" id="wushuiguandao"
                                                                class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="wushuichuli"
                                                                                     class="form-control-label">具有完整城镇污水处理系统：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="wushuichuli" id="wushuichuli"
                                                                class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-tab">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active show" id="custom-nav-resource-tab"
                                                   data-toggle="tab" href="#custom-nav-resource" role="tab"
                                                   aria-controls="custom-nav-resource" aria-selected="true">适用条件：资源化利用
                                                    <i class="fa fa-question-circle" data-toggle="tooltip"
                                                       data-placement="top" title="输入注意事项"></i></a>
                                            </div>
                                        </nav>
                                        <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                            <div class="tab-pane fade active show" id="custom-nav-resource"
                                                 role="tabpanel" aria-labelledby="custom-nav-resource-tab">

                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="zhaoqi"
                                                                                     class=" form-control-label">具有沼气利用工程：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="zhaoqi" id="zhaoqi" class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="wushuihunhe"
                                                                                     class="form-control-label">计划与其他生活污水混合处理：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="wushuihunhe" id="wushuihunhe"
                                                                class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                            <option value="2">均可</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="yibingchuli"
                                                                                     class="form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="yibingchuli" id="yibingchuli"
                                                                class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary">保存草稿</button>
                                <button type="button" class="btn btn-outline-secondary offset-md-2"
                                        onclick="mode_enter()">
                                    确认提交
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

        data.append("productType", encodeURI($('#product_type').val())); //产品类型
        data.append("patternType", encodeURI($('#producer_mode_type').val())); //模式类型
        data.append("patternInfo", encodeURI($('#producer_mode_info').val())); //模式介绍


        //新模式参数
        const temperaturecheckbox = document.getElementsByName("temperature_check"); //温度条件
        let temperature_check_val = "";
        for (let k = 0; k < temperaturecheckbox.length; k++) {
            if (temperaturecheckbox[k].checked)
                temperature_check_val = temperature_check_val + "," + temperaturecheckbox[k].value;
        }
        data.append("natureTemp", encodeURI(temperature_check_val));

        const watercheckbox = document.getElementsByName("water_check"); //水资源条件
        let water_check_val = "";
        for (let k = 0; k < watercheckbox.length; k++) {
            if (watercheckbox[k].checked) {
                water_check_val = water_check_val + "," + watercheckbox[k].value;
            }
        }
        alert(encodeURI(water_check_val));
        data.append("water", encodeURI(water_check_val));

        const dixingcheckbox = document.getElementsByName("dixing_check"); //地形条件
        let dixing_check_val = "";
        for (let k = 0; k < dixingcheckbox.length; k++) {
            if (dixingcheckbox[k].checked)
                dixing_check_val = dixing_check_val + "," + dixingcheckbox[k].value;
        }
        data.append("terrain", encodeURI(dixing_check_val));

        const positioncheckbox = document.getElementsByName("diliweizhi_check"); //地理位置条件
        let position_check_val = "";
        for (let k = 0; k < positioncheckbox.length; k++) {
            if (positioncheckbox[k].checked)
                position_check_val = position_check_val + "," + positioncheckbox[k].value;
        }
        data.append("geolocation", encodeURI(position_check_val));

        const shengtaicheckbox = document.getElementsByName("shengtai_check"); //地形条件
        let shengtai_check_val = "";
        for (let k = 0; k < shengtaicheckbox.length; k++) {
            if (shengtaicheckbox[k].checked)
                shengtai_check_val = shengtai_check_val + "," + shengtaicheckbox[k].value;
        }
        data.append("ecotope", encodeURI(shengtai_check_val));

        const renkoucheckbox = document.getElementsByName("renkou_check"); //人口密集程度
        let renkou_check_val = "";
        for (let k = 0; k < renkoucheckbox.length; k++) {
            if (renkoucheckbox[k].checked)
                renkou_check_val = renkou_check_val + "," + renkoucheckbox[k].value;
        }
        data.append("density", encodeURI(renkou_check_val));

        myselect = document.getElementById("yetaifei"); //液态肥使用习惯
        index = myselect.selectedIndex;
        data.append("usageHabits", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("wushuiguandao"); //具有污水管道
        index = myselect.selectedIndex;
        data.append("sewerLines", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("wushuichuli"); //具有完整城镇污水处理系统
        index = myselect.selectedIndex;
        data.append("sewageTreatment", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("zhaoqi"); //具有沼气利用工程
        index = myselect.selectedIndex;
        data.append("biogasUtilization", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("wushuihunhe"); //计划与其他生活污水混合处理
        index = myselect.selectedIndex;
        data.append("mixedTreatment", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("yibingchuli"); //计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
        index = myselect.selectedIndex;
        data.append("otherTreatment", encodeURI(myselect.options[index].text));

        console.log(data);

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
                    alert("保存成功！");
                    location.reload();
                } else {
                    alert(result.errorMessage);
                }
            }
        });
    }

</script>


</body>
</html>
