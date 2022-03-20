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
                <li class="active">
                    <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
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
                            <h1>产品信息录入</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                <li class="active">产品信息录入</li>
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
                            <strong class="card-title">产品信息录入</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="product_name" class="form-control-label">产品名称
                                        <i id="product_name_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="product_name" name="product_name"
                                                                        placeholder="请输入产品名称" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="producer_name" class="form-control-label">厂家
                                        <i id="producer_name_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="producer_name" name="producer_name"
                                                                        placeholder="请输入厂家名称" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="phonenum" class="form-control-label">联系方式
                                        <i id="contact_name_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="phonenum" name="phonenum"
                                                                        placeholder="请输入正确的联系方式" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="productselect" class="form-control-label">产品类型
                                        <i id="product_type_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9">
                                        <select name="productselect" id="productselect" class="form-control"
                                                onChange="productchange()">
                                            <option value="0">完整的下水道水冲厕所</option>
                                            <option value="1">化粪池式厕所</option>
                                            <option value="2">双瓮漏斗式厕所</option>
                                            <option value="3">三联沼气式池厕所</option>
                                            <option value="4">复合生物反应微水冲厕所</option>
                                            <option value="5">真空负压厕所</option>
                                            <option value="6">多级生化组合电催化氧化厕所</option>
                                            <option value="7">膜生物反应器（MBR）厕所</option>
                                            <option value="8">堆肥式生态旱厕</option>
                                            <option value="9">双坑交替式厕所</option>
                                            <option value="10">粪尿分集式厕所</option>
                                            <option value="11">泡沫封堵厕所</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="multiple-select" class=" form-control-label">模式类型
                                        <i id="model_type_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col col-md-9">
                                        <select name="multiple-select" id="multiple-select" multiple=""
                                                class="form-control">
                                            <option value="1">收集：集中收集</option>
                                            <option value="2">转运：抽排设备</option>
                                            <option value="3">处理：无害化处理</option>
                                            <option value="4">资源化利用：发酵池</option>
                                        </select>
                                    </div>
                                </div>
                                <hr>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">是否添加新模式</label></div>
                                    <div class="col col-md-9">
                                        <div class="form-check-inline form-check">
                                            <label for="newmoderadios1" class="form-check-label">
                                                <input type="radio" id="newmoderadios1" name="newmoderadios"
                                                       value="showNewMode" class="form-check-input">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </label>
                                            <label for="newmoderadios2" class="form-check-label">
                                                <input type="radio" id="newmoderadios2" name="newmoderadios"
                                                       value="hideNewMode" class="form-check-input">否
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-1"><label class=" form-control-label"></label></div>
                                    <div class="col col-md-11"><p>如果添加新模式请勾选是，并按照提示要求进行填写。新模式名称示例:洁具便器+化粪池+分散处理。</p>
                                    </div>
                                </div>


                                <!--  style="display:none;"  -->
                                <div id="newModeAdding" style="">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="newmodename" class=" form-control-label">新模式名称
                                            <i id="new_model_name_tips" class="fa fa-question-circle"
                                               data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label>
                                        </div>
                                        <div class="col-12 col-md-9"><input type="text" id="newmodename"
                                                                            name="newmodename" placeholder="新模式名称"
                                                                            class="form-control"></div>
                                    </div>


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
                                                    <div class="col col-md-3"><label for="temperaturecondition"
                                                                                     class=" form-control-label">温度条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="temperaturecondition" id="temperaturecondition" class="form-control">
                                                            <option value="0">高寒</option>
                                                            <option value="1">无特殊</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="watercondition"
                                                                                     class=" form-control-label">水资源条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="watercondition" id="watercondition" class="form-control">
                                                            <option value="0">缺水</option>
                                                            <option value="1">良好</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">地形条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="dixing_check" value="山区"/>山区
                                                        <input class="col-md-1" type="checkbox" name="dixing_check" value="丘陵"/>丘陵
                                                        <input class="col-md-1" type="checkbox" name="dixing_check" value="一般地区"/>一般地区
                                                        <%--<select name="dixing" id="dixing" class="form-control">--%>
                                                            <%--<option value="0">平坦</option>--%>
                                                            <%--<option value="1">山区</option>--%>
                                                            <%--<option value="2">丘陵</option>--%>
                                                            <%--<option value="3">无特殊</option>--%>
                                                        <%--</select>--%>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">地理位置条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check" value="城市近郊"/>城市近郊
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check" value="城中村"/>城中村
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check" value="中心城镇地区"/>中心城镇地区
                                                        <input class="col-md-1" type="checkbox" name="diliweizhi_check" value="一般地区"/>一般地区
                                                        <%--<select name="position" id="position" class="form-control">--%>
                                                            <%--<option value="0">城市近郊</option>--%>
                                                            <%--<option value="1">城中村</option>--%>
                                                            <%--<option value="2">中心城镇地区</option>--%>
                                                            <%--<option value="3">其他</option>--%>
                                                        <%--</select>--%>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label class="form-control-label">生态限制条件：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check" value="生态保护区"/>生态保护区
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check" value="水源保护区"/>水源保护区
                                                        <input class="col-md-1" type="checkbox" name="shengtai_check" value="一般地区"/>一般地区
                                                        <%--<select name="shengtai" id="shengtai" class="form-control">--%>
                                                            <%--<option value="0">生态保护区</option>--%>
                                                            <%--<option value="1">水源保护区</option>--%>
                                                            <%--<option value="2">一般地区</option>--%>
                                                        <%--</select>--%>
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
                                                    <div class="col col-md-3"><label for="renkou"
                                                                                     class="form-control-label">人口密集程度：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="renkou" id="renkou" class="form-control">
                                                            <option value="0">聚集</option>
                                                            <option value="1">分散</option>
                                                            <option value="2">一般</option>
                                                        </select>
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
                                                        <select name="wushuiguandao" id="wushuiguandao" class="form-control">
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
                                                        <select name="wushuichuli" id="wushuichuli" class="form-control">
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
                                                        <select name="wushuihunhe" id="wushuihunhe" class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3"><label for="yibingchuli"
                                                                                     class="form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：
                                                        <i class="fa fa-question-circle" data-toggle="tooltip"
                                                           data-placement="top" title="输入注意事项"></i></label></div>
                                                    <div class="col-12 col-md-9">
                                                        <select name="yibingchuli" id="yibingchuli" class="form-control">
                                                            <option value="0">是</option>
                                                            <option value="1">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="province" class="form-control-label">适用省份
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="province" name="province"
                                                                        placeholder="输入省份名称" class="form-control">
                                        <small class="form-text text-muted">输入省份名称，以逗号间隔</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="wendufanwei" class="form-control-label">适用温度范围
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="wendufanwei" name="wendufanwei"
                                                                        placeholder="输入适用温度范围" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="yongtu" class="form-control-label">用途
                                        <i id="use_for" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入用途的注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="yongtu" id="yongtu"
                                                                           rows="5" placeholder="用途..."
                                                                           class="form-control"></textarea></div>
                                </div>
                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-nature-tab"
                                               data-toggle="tab" href="#custom-nav-nature" role="tab"
                                               aria-controls="custom-nav-nature" aria-selected="true">产品参数</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-nature" role="tabpanel"
                                             aria-labelledby="custom-nav-nature-tab">

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="guige"
                                                                                 class="form-control-label">规格（平方米）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="guige" name="guige"
                                                           placeholder="规格（平方米）" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="renshu"
                                                                                 class=" form-control-label">适用人数（人）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="renshu" name="renshu"
                                                           placeholder="适用人数（人）" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chicun_chang"
                                                                                 class="form-control-label">尺寸（长*宽*高mm）:</label></div>
                                                <div class="col-12 col-md-1"><label
                                                        class="form-control-label">长：</label></div>
                                                <div class="col-12 col-md-2"><input type="text" id="chicun_chang"
                                                                                    name="chicun_changt"
                                                                                    class="form-control"></div>
                                                <div class="col-12 col-md-1"><label
                                                        class="form-control-label">宽：</label></div>
                                                <div class="col-12 col-md-2"><input type="text" id="chicun_kuan"
                                                                                    name="chicun_kuan"
                                                                                    class="form-control"></div>
                                                <div class="col-12 col-md-1"><label
                                                        class="form-control-label">高：</label></div>
                                                <div class="col-12 col-md-2"><input type="text" id="chicun_gao"
                                                                                    name="chicun_gao"
                                                                                    class="form-control"></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="caizhi"
                                                                                 class=" form-control-label">材质：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="caizhi" id="caizhi" class="form-control">
                                                        <option value="0">A.玻璃钢</option>
                                                        <option value="1">B.PP</option>
                                                        <option value="2">C.PE</option>
                                                        <option value="3">D.预制钢筋混凝土</option>
                                                        <option value="4">E.其他</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="yanse"
                                                                                 class=" form-control-label">颜色：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yanse" name="yanse"
                                                           placeholder="请填写颜色。例：白色、蓝色" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="shouming"
                                                                                 class=" form-control-label">使用寿命：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="shouming" name="shouming"
                                                           placeholder="请填写使用寿命" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="jiage"
                                                                                 class=" form-control-label">价格（万元）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="jiage" name="jiage"
                                                           placeholder="请输入价格" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="cesuoyongtu"
                                                                                 class=" form-control-label">用途：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="cesuoyongtu" id="cesuoyongtu" class="form-control">
                                                        <option value="0">A.户厕</option>
                                                        <option value="1">B.公厕</option>
                                                        <option value="2">C.均可</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="qinglizhouqi"
                                                                                 class=" form-control-label">清理周期：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="qinglizhouqi" name="qinglizhouqi"
                                                           placeholder="请提供具体清理周期" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="zhiliangbaozhang" class="form-control-label">质量保障材料
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i> </label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="zhiliangbaozhang" name="zhiliangbaozhang"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="shiyongshuoming" class=" form-control-label">使用说明
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="shiyongshuoming" name="shiyongshuoming"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="chanpingtedian" class="form-control-label">产品特点
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="chanpingtedian" id="chanpingtedian"
                                                                           rows="9" placeholder="产品特点..."
                                                                           class="form-control"></textarea></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="picturefile" class=" form-control-label">使用图片
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="picturefile" name="picturefile"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                    </div>
                                </div>
                                <!--
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="file-multiple-input" class=" form-control-label">Multiple File input</label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="file-multiple-input" name="file-multiple-input" multiple="" class="form-control-file"></div>
                                </div>
                                -->
                            </form>

                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary">保存草稿</button>
                                <button type="button" class="btn btn-outline-secondary offset-md-2" onclick="entry()">确认提交</button>
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

    $(document).ready(function () {
        $('input[type=radio][name=newmoderadios]').change(function () {
            if (this.value == 'showNewMode') {
                var modediv = document.getElementById("newModeAdding");
                modediv.style.cssText = "";
            }
            else if (this.value == 'hideNewMode') {
                var modediv = document.getElementById("newModeAdding");
                modediv.style.cssText = "display:none;"
            }
        });
    });


    function productchange() {
        var x = document.getElementById("productselect");
        var y = document.getElementById("multiple-select");

        y.options.length = 0; // 清除second下拉框的所有内容

        if (x.selectedIndex == 0) { //完整的下水道水冲厕所
            y.options.add(new Option("洁具便器+完整下水道水冲式厕所+市政污水处理系统", "0"));
        }

        if (x.selectedIndex == 1) { //化粪池式厕所
            y.options.add(new Option("洁具便器+化粪池+分散处理", "0"));
            y.options.add(new Option("洁具便器+化粪池+污水管网输送+污水集中处理系统", "1"));
            y.options.add(new Option("洁具便器+化粪池+抽排设备转运+污水集中处理系统", "2"));
            y.options.add(new Option("洁具便器+化粪池+抽排设备转运+发酵池或已有沼气工程", "3"));
        }

        if (x.selectedIndex == 2) { //双瓮漏斗式厕所
            y.options.add(new Option("洁具便器+双瓮漏斗式厕所+后瓮粪液利用、前瓮粪渣无害化处理利用", "0"));
        }

        if (x.selectedIndex == 3) { //三联沼气式池厕所
            y.options.add(new Option("洁具便器+三联沼气池式厕所+沼液沼渣利用（施肥、堆肥）", "0"));
        }

        if (x.selectedIndex == 4) { //复合生物反应微水冲厕所
            y.options.add(new Option("无", "0"));
        }

        if (x.selectedIndex == 5) { //真空负压厕所
            y.options.add(new Option("真空便器+真空管网+真空泵站+污水管道+污水集中处理系统（与生活污水等混合处理）", "0"));
            y.options.add(new Option("真空便器+真空管网+真空泵站+抽排设备转运+污水集中处理系统（与生活污水等混合处理）", "1"));
            y.options.add(new Option("真空便器+真空管网+真空泵站+抽排设备转运+发酵池或已有沼气工程", "2"));
            y.options.add(new Option("洁具便器+真空污水箱+真空管网+真空泵站+污水管道（或抽排设备转运）+污水集中处理系统（与生活污水等混合处理）", "3"));
        }

        if (x.selectedIndex == 6) { //多级生化组合电催化氧化厕所
            y.options.add(new Option("灰水收集处理系统+洁具便器+污水管网+市政污水处理系统", "0"));
        }

        if (x.selectedIndex == 7) { //膜生物反应器（MBR）厕所
            y.options.add(new Option("无", "0"));
        }

        if (x.selectedIndex == 8) { //堆肥式生态旱厕
            y.options.add(new Option("堆肥式生态旱厕+原位资源化利用", "0"));
            y.options.add(new Option("堆肥式生态旱厕+抽排设备转运+资源化利用", "1"));
        }

        if (x.selectedIndex == 9) { //双坑交替式厕所
            y.options.add(new Option("洁具便器+双坑交替式厕所+抽排设备+粪污利用", "0"));
        }

        if (x.selectedIndex == 10) { //粪尿分集式厕所
            y.options.add(new Option("洁具便器+粪尿分集式厕所+资源化利用（堆肥肥田或焚烧）", "0"));
        }

        if (x.selectedIndex == 11) { //泡沫封堵厕所
            y.options.add(new Option("无", "0"));
        }
    }

    function entry(){

        var data = new FormData();
        data.append("productName", encodeURI($('#product_name').val())); //产品名称
        data.append("factoryName", encodeURI($('#producer_name').val())); //厂家
        data.append("factoryNum", $('#phonenum').val()); //联系方式

        var myselect=document.getElementById("productselect"); //产品类型
        var index=myselect.selectedIndex;
        data.append("productType", encodeURI(myselect.options[index].text));

        myselect=document.getElementById("multiple-select"); //模式类型
        index=myselect.selectedIndex;
        data.append("patternType", encodeURI(myselect.options[index].text));

        data.append("patternName", encodeURI($('#newmodename').val())); //新模式名称

        var radio = document.getElementsByName("newmoderadios"); //是否添加新模式
        data.append("newmoderadios1", radio[0].checked); //True 为添加
        data.append("newmoderadios2", radio[1].checked); //True 为不添加

        //新模式参数
        myselect=document.getElementById("temperaturecondition"); //温度条件
        index=myselect.selectedIndex;
        data.append("natureTemp", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("watercondition"); //水资源条件
        index=myselect.selectedIndex;
        data.append("water", encodeURI(myselect.options[index].text));

        const mycheckbox=document.getElementsByName("dixing_check"); //地形条件
        let check_val = "";
        for (let k=0; k<mycheckbox.length;k++) {
            if (mycheckbox[k].checked)
                check_val = check_val + "," + mycheckbox[k].value;
        }
        data.append("terrain", encodeURI(check_val));

        const positioncheckbox=document.getElementsByName("diliweizhi_check"); //地理位置条件
        let position_check_val = "";
        for (let k=0; k<positioncheckbox.length;k++) {
            if (positioncheckbox[k].checked)
                position_check_val = position_check_val + "," + positioncheckbox[k].value;
        }
        data.append("geolocation", encodeURI(position_check_val));

        const shengtaicheckbox=document.getElementsByName("shengtai_check"); //地形条件
        let shengtai_check_val = "";
        for (let k=0; k<shengtaicheckbox.length;k++) {
            if (shengtaicheckbox[k].checked)
                shengtai_check_val = shengtai_check_val + "," + shengtaicheckbox[k].value;
        }
        data.append("ecotope", encodeURI(shengtai_check_val));

        myselect=document.getElementById("renkou"); //人口密集程度
        index=myselect.selectedIndex;
        data.append("density", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("yetaifei"); //液态肥使用习惯
        index=myselect.selectedIndex;
        data.append("usageHabits", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("wushuiguandao"); //具有污水管道
        index=myselect.selectedIndex;
        data.append("sewerLines",encodeURI( myselect.options[index].text));
        myselect=document.getElementById("wushuichuli"); //具有完整城镇污水处理系统
        index=myselect.selectedIndex;
        data.append("sewageTreatment", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("zhaoqi"); //具有沼气利用工程
        index=myselect.selectedIndex;
        data.append("biogasUtilization", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("wushuihunhe"); //计划与其他生活污水混合处理
        index=myselect.selectedIndex;
        data.append("mixedTreatment", encodeURI(myselect.options[index].text));
        myselect=document.getElementById("yibingchuli"); //计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
        index=myselect.selectedIndex;
        data.append("otherTreatment", encodeURI(myselect.options[index].text));

        data.append("province", encodeURI($('#province').val())); //适用省份
        data.append("temperature", encodeURI($('#wendufanwei').val())); //适用温度范围
        data.append("purpose", encodeURI($('#yongtu').val())); //用途
        data.append("features", encodeURI($('#chanpingtedian').val())); //产品特点

        // 文件上传
        var quality = $('#zhiliangbaozhang')[0].files[0];
        var introduction = $('#shiyongshuoming')[0].files[0];
        var pic1 = $('#picturefile')[0].files[0];
        data.append("qualityMaterial", quality); //质量保障材料
        data.append("introductions", introduction); //使用说明
        data.append("pics", pic1); //使用图片

        // 产品参数
        data.append("standard", encodeURI($('#guige').val())); //规格（平方米）
        data.append("applicableNum", encodeURI($('#renshu').val())); //适用人数（人）
        data.append("length", $('#chicun_chang').val()); //尺寸（长*宽*高mm）
        data.append("wide", $('#chicun_kuan').val());
        data.append("high", $('#chicun_gao').val());
        myselect=document.getElementById("caizhi"); //材质
        index=myselect.selectedIndex;
        data.append("texture", encodeURI(myselect.options[index].text));
        data.append("color", encodeURI($('#yanse').val())); //颜色
        data.append("serviceLife", encodeURI($('#shouming').val())); //使用寿命
        data.append("price", $('#jiage').val()); //价格（万元）
        myselect=document.getElementById("cesuoyongtu"); //材质
        index=myselect.selectedIndex;
        data.append("paramPurpose", encodeURI(myselect.options[index].text));
        data.append("cleanupCycle", encodeURI($('#qinglizhouqi').val())); //清理周期

        $.ajax({
            url:"/toilet/company/product/entry",
            type:"POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function(result){
                if (result.success) {
                    alert("save product success!");
                } else {
                    alert(result.errorMessage);
                }
            }
        });
    }

</script>


</body>
</html>
