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
                    <a href="${pageContext.request.contextPath}/company/index" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品申请</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back8" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-pencil"></i>模式申请</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/toPage?url=company_back2"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>企业基本信息</a>
                </li>
                <li class="active">
                    <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
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
                                    <div class="col-12 col-md-9"><input type="text" id="product_name"
                                                                        name="product_name"
                                                                        placeholder="请输入产品名称" class="form-control">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="producer_name" class="form-control-label">厂家
                                        <i id="producer_name_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="producer_name"
                                                                        name="producer_name"
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
                                            <option value="0">完整下水道水冲式厕所</option>
                                            <option value="1">化粪池式厕所</option>
                                            <option value="2">双瓮漏斗式厕所</option>
                                            <option value="3">三联沼气池式厕所</option>
                                            <option value="4">复合生物反应微水冲厕所</option>
                                            <option value="5">真空负压厕所</option>
                                            <option value="6">多级生化组合电催化氧化厕所</option>
                                            <option value="7">膜生物反应器（MBR）厕所</option>
                                            <option value="8">生态旱厕</option>
                                            <option value="9">双坑交替式厕所</option>
                                            <option value="10">粪尿分集式厕所</option>
                                            <option value="11">泡沫封堵液</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="multiple-select" class=" form-control-label">模式类型
                                        <i id="model_type_tips" class="fa fa-question-circle" data-toggle="tooltip"
                                           data-placement="top" title="输入注意事项"></i></label></div>
                                    <div class="col col-md-9">
                                        <div class="multiple-select">
                                    </div>

                                    </div>
                                </div>
                                <div id="many_factors">


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
                                                        <div class="col col-md-3"><label class="form-control-label">温度条件：
                                                            <i class="fa fa-question-circle" data-toggle="tooltip"
                                                               data-placement="top" title="输入注意事项"></i></label></div>
                                                        <div class="col-12 col-md-9">
                                                            <input class="col-md-1" type="checkbox" name="temperaturecondition"
                                                                   value="高寒"/>高寒
                                                            <input class="col-md-1" type="checkbox" name="temperaturecondition"
                                                                   value="无特殊"/>无特殊
                                                        </div>
                                                    </div>


                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label class="form-control-label">水资源条件：
                                                            <i class="fa fa-question-circle" data-toggle="tooltip"
                                                               data-placement="top" title="输入注意事项"></i></label></div>
                                                        <div class="col-12 col-md-9">
                                                            <input class="col-md-1" type="checkbox" name="watercondition"
                                                                   value="缺水"/>缺水
                                                            <input class="col-md-1" type="checkbox" name="watercondition"
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
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="diliweizhi_check" value="城市近郊"/>城市近郊
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="diliweizhi_check" value="城中村"/>城中村
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="diliweizhi_check" value="中心城镇地区"/>中心城镇地区
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="diliweizhi_check" value="一般地区"/>一般地区
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
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="shengtai_check" value="生态保护区"/>生态保护区
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="shengtai_check" value="水源保护区"/>水源保护区
                                                            <input class="col-md-1" type="checkbox"
                                                                   name="shengtai_check" value="一般地区"/>一般地区
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
                                                <div class="tab-pane fade active show" id="custom-nav-pip"
                                                     role="tabpanel"
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
                                                    <a class="nav-item nav-link active show"
                                                       id="custom-nav-resource-tab"
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
                                        <div class="col-12 col-md-9"><input type="text" id="wendufanwei"
                                                                            name="wendufanwei"
                                                                            placeholder="输入适用温度范围" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row form-group" id="chanpinzucheng" style="display: none">
                                        <div class="col col-md-3"><label for="chanpinyuanli" class="form-control-label">产品原理及组成
                                            <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                               title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><textarea name="chanpinyuanli" id="chanpinyuanli"
                                                                               rows="9" placeholder="请输入产品原理及组成..."
                                                                               class="form-control"></textarea></div>
                                    </div>
                                </div>
                                <div class="row form-group" id="shiyong" style="display: none">
                                    <div class="col col-md-3"><label for="shiyongtiaojian" class="form-control-label">适用条件
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="shiyongtiaojian" id="shiyongtiaojian"
                                                                           rows="9" placeholder="适用条件..."
                                                                           class="form-control"></textarea></div>
                                </div>

                                <%--                                <div class="row form-group">--%>
                                <%--                                    <div class="col col-md-3"><label for="yongtu" class="form-control-label">用途--%>
                                <%--                                        <i id="use_for" class="fa fa-question-circle" data-toggle="tooltip"--%>
                                <%--                                           data-placement="top" title="输入用途的注意事项"></i></label></div>--%>
                                <%--                                    <div class="col-12 col-md-9"><textarea name="yongtu" id="yongtu"--%>
                                <%--                                                                           rows="5" placeholder="用途..."--%>
                                <%--                                                                           class="form-control"></textarea></div>--%>
                                <%--                                </div>--%>
                                <div class="custom-tab" id="chanpincanshu">
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

                                            <div class="row form-group" id="gui">
                                                <div class="col col-md-3"  style="margin-top: 5px"><label for="guige"
                                                                                                          class="form-control-label">规格（平方米）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="guige" name="guige"
                                                           placeholder="规格（平方米）" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="shiyongrenshu" class="form-control-label">适用人数（人）
                                                    <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                                       title="输入注意事项"></i></label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="shiyongrenshu" name="shiyongrenshu"
                                                                                    placeholder="输入适用人数" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group" id="chicun" >
                                                <div class="row">
                                                    <div class="col col-md-4"><label for="chicun_chang"
                                                                                     class="form-control-label">尺寸（长*宽*高mm）:</label>
                                                    </div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">长：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text" id="chicun_chang"
                                                                                        name="chicun_changt"
                                                                                        class="form-control"></div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">宽：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text" id="chicun_kuan"
                                                                                        name="chicun_kuan"
                                                                                        class="form-control"></div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">高：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text" id="chicun_gao"
                                                                                        name="chicun_gao"
                                                                                        class="form-control"></div>
                                                </div>
                                            </div>
                                            <div class="row form-group" id="hou" style="display: none;">
                                                <div class="col col-md-3"><label for="bihou"
                                                                                 class=" form-control-label">壁厚（mm）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="bihou" name="bihou"
                                                           placeholder="壁厚" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group" id="zhong" style="display: none;">
                                                <div class="col col-md-3"><label for="zhongliang"
                                                                                 class=" form-control-label">重量（kg）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="zhongliang" name="zhongliang"
                                                           placeholder="重量" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group" id="cai">
                                                <div class="col col-md-3"><label for="caizhi"
                                                                                 class=" form-control-label">材质：</label>
                                                </div>

                                                <%--                                                    <div class="form-check-inline form-check">--%>
                                                <div class="col col-md-1" id="hidden_caizhi1">
                                                    <input  type="radio" name="caizhi"
                                                            value="玻璃钢">玻璃钢
                                                </div>
                                                <div class="col col-md-2" id="hidden_caizhi2">
                                                    <input type="radio" name="caizhi"
                                                           value="预制钢筋混凝土">预制钢筋混凝土
                                                </div>
                                                <div class="col col-md-1" id="hidden_caizhi3">
                                                    <input type="radio"  name="caizhi"
                                                           value="PP">PP
                                                </div>
                                                <div class="col col-md-1" id="hidden_caizhi4">
                                                    <input type="radio" name="caizhi"
                                                           value="PE">PE
                                                </div>
                                                <div class="col col-md-1">
                                                    <input type="radio" id="qitacaizhi" name="caizhi"
                                                           value="qita">其他
                                                </div>
                                                <div class="col col-md-2">
                                                    <input  type="text" id="jvticaizhi" name="jvticaizhi" placeholder="输入材质" disabled>
                                                </div>

                                                <%--                                                    </div>--%>


                                            </div>

                                            <div class="row form-group" id="yan">
                                                <div class="col col-md-3"><label for="yanse"
                                                                                 class=" form-control-label">颜色：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yanse" name="yanse"
                                                           placeholder="请填写颜色。例：白色、蓝色" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group" id="shou" >
                                                <div class="col col-md-3"><label for="shouming"
                                                                                 class=" form-control-label">使用寿命：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="shouming" name="shouming"
                                                           placeholder="请填写使用寿命(年)" class="form-control">
                                                </div>

                                            </div>


                                            <div class="row form-group" id="qita" style="display: none">
                                                <div class="col col-md-3"><label for="qitacanshu"
                                                                                 class="form-control-label">其他参数
                                                </label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="qitacanshu"
                                                                                    name="qitacanshu"
                                                                                    placeholder="输入其他参数"
                                                                                    class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group" id="jia">
                                                <div class="col col-md-3"><label for="jiage"
                                                                                 class=" form-control-label">价格（元）：</label>
                                                </div>
                                                <div class="col col-md-9">
                                                    <input type="text" id="jiage" name="jiage"
                                                           placeholder="请输入价格" class="form-control">
                                                </div>

                                            </div>
                                            <div class="row form-group" id="yong">
                                                <div class="col col-md-3"><label class="form-control-label">用途：
                                                </label></div>
                                                <div class="col-12 col-md-9">
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="户厕"/>户厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="公厕"/>公厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="均可"/>均可
                                                </div>
                                            </div>
                                            <div class="row form-group" id="yong1" >
                                                <div class="col col-md-3"><label for="jvtiyongtu"
                                                                                 class="form-control-label">
                                                </label></div>
                                                <div class="col-12 col-md-9"><textarea name="jvtiyongtu" id="jvtiyongtu"
                                                                                       rows="9" placeholder="请输入具体用途..."
                                                                                       class="form-control"></textarea>
                                                </div>
                                            </div>

                                            <div class="row form-group" id="yun">
                                                <div class="col col-md-3"><label for="yunxingchengben"
                                                                                 class=" form-control-label">运行成本：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yunxingchengben" name="yunxingchengben"
                                                           placeholder="请运行成本" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group" id="qing" >
                                                <div class="col col-md-3"><label for="qinglizhouqi"
                                                                                 class=" form-control-label">清理周期：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="qinglizhouqi" name="qinglizhouqi"
                                                           placeholder="请提供具体清理周期(月)" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group" id="peculiar" style="display: none">
                                    <div class="col col-md-3"><label for="peculiar_canshu" class="form-control-label">产品参数
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="peculiar_canshu" id="peculiar_canshu"
                                                                           rows="9" placeholder="产品参数..."
                                                                           class="form-control"></textarea></div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="zhiliangbaozhang" class="form-control-label">质量保障材料
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i> </label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="zhiliangbaozhang"
                                                                        name="zhiliangbaozhang"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="shiyongshuoming" class=" form-control-label">使用说明
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="shiyongshuoming"
                                                                        name="shiyongshuoming"
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
                                    <div class="col col-md-3"><label for="picturefile1" class=" form-control-label">使用图片1
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="picturefile1"
                                                                        name="picturefile1"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="picturefile2" class=" form-control-label">使用图片2
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="picturefile2"
                                                                        name="picturefile2"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="picturefile3" class=" form-control-label">使用图片3
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="picturefile3"
                                                                        name="picturefile3"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="picturefile4" class=" form-control-label">使用图片4
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="picturefile4"
                                                                        name="picturefile4"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="yingyonganli" class="form-control-label">应用案例
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><textarea name="yingyonganli" id="yingyonganli"
                                                                           rows="9" placeholder="应用案例..."
                                                                           class="form-control"></textarea></div>
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
                                <button type="button" class="btn btn-outline-secondary" onclick="entry()">
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

    var mode_content_selectMap = '';
    var mode_content_patternDTOMap = '';

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
            } else if (this.value == 'hideNewMode') {
                var modediv = document.getElementById("newModeAdding");
                modediv.style.cssText = "display:none;"
            }
        });
    });

    $(document).ready(function () {
        $('input[type=radio][name=caizhi]').change(function () {
            if (this.value == "qita") {
                $("#jvticaizhi").removeAttr("disabled");//将输入可用
            } else {
                $("#jvticaizhi").attr({"disabled":"disabled"});
            }
        });
    });

    $(document).ready(function () {
        $.ajax({
            url: "/toilet/company/product/modes/get",
            type: "POST",
            dataType: "json",
            data: '',
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    mode_content_selectMap = result['selectMap'];
                    mode_content_patternDTOMap = result['patternDTOMap'];
                    //动态赋值给控件  productselect   multiple-select
                    var productSelect = document.getElementById("productselect");
                    var productTpyes = result['selectMap'];
                    var mode_selectDiv = document.getElementsByClassName("multiple-select")[0];
                    var product_value = productSelect.options[0].text;
                    var mode_list = mode_content_selectMap[product_value];
                    mode_selectDiv.innerHTML="";
                    var ul=document.createElement("ul");

                    for(var i=0;i<mode_list.length;i++){
                        var arr=mode_list[i];
                        // 加入复选框
                        var checkBox=document.createElement("input");
                        checkBox.setAttribute("type","checkbox");
                        checkBox.setAttribute("name","moshileixing");
                        checkBox.setAttribute("value",arr);


                        ul.appendChild(checkBox);
                        ul.appendChild(document.createTextNode(arr));
                        ul.appendChild(document.createElement("div"))
                    }


                    mode_selectDiv.appendChild(ul);



                } else {
                    var msg = confirm(result.errorMessage);
                    show(msg);
                }
            }
        });
    });


    function productchange() { // mode_content_selectMap   mode_content_patternDTOMap

        var product_select = document.getElementById("productselect");
        var mode_selectDiv = document.getElementsByClassName("multiple-select")[0];
        var zhongliangdiv = $("#zhong").get(0);
        var bihoudiv = $("#hou").get(0);
        var chanpinyuanli = $("#chanpinzucheng").get(0);
        var qitacanshu = $("#qita").get(0);
        var guige = $("#gui").get(0);
        var chicun = $("#chicun").get(0);
        var caizhi = $("#cai").get(0);
        var hidden_caizhi1 = $("#hidden_caizhi1").get(0);
        var hidden_caizhi2 = $("#hidden_caizhi2").get(0);
        var hidden_caizhi3 = $("#hidden_caizhi3").get(0);
        var hidden_caizhi4 = $("#hidden_caizhi4").get(0);
        var yanse = $("#yan").get(0);
        var yunxingchengben = $("#yun").get(0);
        var qinglizhouqi = $("#qing").get(0);
        var many_factors = $("#many_factors").get(0);
        var shiyong = $("#shiyong").get(0);
        var chanpincanshu = $("#chanpincanshu").get(0);
        var peculiar_canshu = $("#peculiar").get(0);
        if (product_select.value == 2) { //双瓮漏斗式厕所
            zhongliangdiv.style.display = "";
            bihoudiv.style.display = "";
        } else {
            zhongliangdiv.style.cssText = "display:none;"
            bihoudiv.style.cssText = "display:none;"
        }
        if (product_select.value == 3 || product_select.value == 4 || product_select.value == 6 || product_select.value == 7 || product_select.value == 8 || product_select.value == 10) {
            //三联沼气池式厕所;复合生物反应微水冲厕所;多级生化组合电催化氧化厕所;膜生物反应器（MBR）厕所;生态旱厕;粪尿分集式厕所
            chanpinyuanli.style.cssText = "";
            qitacanshu.style.cssText = "";
            guige.style.cssText = "display:none;"
            chicun.style.cssText = "display:none;"
            caizhi.style.cssText = "display:none;"
            yanse.style.cssText = "display:none;"
            yunxingchengben.style.cssText = "display:none;"
            qinglizhouqi.style.cssText = "display:none;"
        } else {
            chanpinyuanli.style.cssText = "display:none;"
            qitacanshu.style.cssText = "display:none;"
            guige.style.cssText = "";
            chicun.style.cssText = "";
            caizhi.style.cssText = "";
            yanse.style.cssText = "";
            yunxingchengben.style.cssText = "";
            qinglizhouqi.style.cssText = "";
        }
        if (product_select.value == 2){ //双瓮漏斗式厕所
            hidden_caizhi1.style.cssText = "";
            hidden_caizhi2.style.cssText = "";
            hidden_caizhi3.style.cssText = "";
            hidden_caizhi4.style.cssText = "";
        }
        else if (product_select.value == 5){//真空负压厕所
            hidden_caizhi1.style.cssText = "display:none;";
            hidden_caizhi2.style.cssText = "display:none;";
            hidden_caizhi3.style.cssText = "display:none;";
            hidden_caizhi4.style.cssText = "display:none;";
        }
        else if (product_select.value == 9){//双坑交替式厕所
            hidden_caizhi3.style.cssText = "display:none;";
            hidden_caizhi4.style.cssText = "display:none;";
            hidden_caizhi1.style.cssText = "";
            hidden_caizhi2.style.cssText = "";
        }
        if (product_select.value == 11) { //泡沫封堵液
            many_factors.style.cssText = "display:none;"
            shiyong.style.cssText = "";
            chanpincanshu.style.cssText = "display:none;"
            peculiar_canshu.style.cssText = "";
        } else {
            many_factors.style.cssText = "";
            shiyong.style.cssText = "display:none;"
            chanpincanshu.style.cssText = "";
            peculiar_canshu.style.cssText = "display:none;"
        }

        var product_index = product_select.selectedIndex;
        var product_value = product_select.options[product_index].text;

        var mode_list = mode_content_selectMap[product_value];

        mode_selectDiv.innerHTML="";
        var ul=document.createElement("ul");

        for(var i=0;i<mode_list.length;i++){
            var arr=mode_list[i];
            // 加入复选框
            var checkBox=document.createElement("input");
            checkBox.setAttribute("type","checkbox");
            checkBox.setAttribute("name","moshileixing");
            checkBox.setAttribute("value",arr);


            ul.appendChild(checkBox);
            ul.appendChild(document.createTextNode(arr));
            ul.appendChild(document.createElement("div"))
        }


        mode_selectDiv.appendChild(ul);

    }

    function entry() {
        let data = new FormData();
        data.append("productName", encodeURI($('#product_name').val())); //产品名称
        data.append("factoryName", encodeURI($('#producer_name').val())); //厂家
        data.append("factoryNum", $('#phonenum').val()); //联系方式

        var myselect = document.getElementById("productselect"); //产品类型
        var index = myselect.selectedIndex;
        data.append("productType", encodeURI(myselect.options[index].text));

        // myselect = document.getElementById("multiple-select"); //模式类型
        // index = myselect.selectedIndex;
        // data.append("patternType", encodeURI(myselect.options[index].text));
        const moshileixingcheckbox = document.getElementsByName("moshileixing"); //模式类型
        let moshileixingcheck_val = "";
        for (let k = 0; k < moshileixingcheckbox.length; k++) {
            if (moshileixingcheckbox[k].checked)
                moshileixingcheck_val = moshileixingcheck_val + "," + moshileixingcheckbox[k].value;
        }
        data.append("patternType", encodeURI(moshileixingcheck_val));


        data.append("patternName", encodeURI($('#newmodename').val())); //新模式名称

        var radio = document.getElementsByName("newmoderadios"); //是否添加新模式
        data.append("newmoderadios1", radio[0].checked); //True 为添加
        data.append("newmoderadios2", radio[1].checked); //True 为不添加


        //新模式参数
        const wenducheckbox = document.getElementsByName("temperaturecondition"); //温度条件
        let wenducheck_val = "";
        for (let k = 0; k < wenducheckbox.length; k++) {
            if (wenducheckbox[k].checked)
                wenducheck_val = wenducheck_val + "," + wenducheckbox[k].value;
        }
        data.append("natureTemp", encodeURI(wenducheck_val));

        const shuiziyuancheckbox = document.getElementsByName("watercondition"); //水资源条件
        let shuiziyuancheck_val = "";
        for (let k = 0; k < shuiziyuancheckbox.length; k++) {
            if (shuiziyuancheckbox[k].checked)
                shuiziyuancheck_val = shuiziyuancheck_val + "," + shuiziyuancheckbox[k].value;
        }
        data.append("water", encodeURI(shuiziyuancheck_val));

        const mycheckbox = document.getElementsByName("dixing_check"); //地形条件
        let check_val = "";
        for (let k = 0; k < mycheckbox.length; k++) {
            if (mycheckbox[k].checked)
                check_val = check_val + "," + mycheckbox[k].value;
        }
        data.append("terrain", encodeURI(check_val));

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

        data.append("province", encodeURI($('#province').val())); //适用省份
        data.append("temperature", encodeURI($('#wendufanwei').val())); //适用温度范围
        data.append("features", encodeURI($('#chanpingtedian').val())); //产品特点
        data.append("applicableCondition", encodeURI($('#shiyongtiaojian').val())); //适用条件
        data.append("productTheory", encodeURI($('#chanpinyuanli').val())); //产品原理及组成

        // 文件上传
        var quality = $('#zhiliangbaozhang')[0].files[0];
        var introduction = $('#shiyongshuoming')[0].files[0];
        var pic1 = $('#picturefile1')[0].files[0];
        var pic2 = $('#picturefile2')[0].files[0];
        var pic3 = $('#picturefile3')[0].files[0];
        var pic4 = $('#picturefile4')[0].files[0];
        data.append("qualityMaterial", quality); //质量保障材料
        data.append("introductions", introduction); //使用说明
        data.append("pics1", pic1); //使用图片
        data.append("pics2", pic2); //使用图片
        data.append("pics3", pic3); //使用图片
        data.append("pics4", pic4); //使用图片

        // 产品参数
        data.append("standard", encodeURI($('#guige').val())); //规格（平方米）
        data.append("weight", encodeURI($('#zhongliang').val())); //重量kg
        data.append("thickness", encodeURI($('#bihou').val())); //壁厚
        data.append("applicableNum", encodeURI($('#shiyongrenshu').val())); //适用人数（人）
        data.append("length", $('#chicun_chang').val()); //尺寸（长*宽*高mm）
        data.append("wide", $('#chicun_kuan').val());
        data.append("high", $('#chicun_gao').val());

        radio = document.getElementsByName("caizhi"); //材质
        const texture = getRadioValue(radio);

        data.append("texture", encodeURI(texture));
        data.append("color", encodeURI($('#yanse').val())); //颜色
        data.append("serviceLife", encodeURI($('#shouming').val())); //使用寿命
        data.append("price", $('#jiage').val()); //价格（元）

        radio = document.getElementsByName("cesuoyongtu"); //厕所用途
        const toiletPurpose = getRadioValue(radio);
        data.append("toiletPurpose", encodeURI(toiletPurpose));

        data.append("purpose", encodeURI($('#jvtiyongtu').val())); //具体用途
        data.append("runningCost", encodeURI($('#yunxingchengben').val())); //运行成本
        data.append("cleanupCycle", encodeURI($('#qinglizhouqi').val())); //清理周期
        data.append("specialParam", encodeURI($('#peculiar_canshu').val())); //产品参数
        data.append("otherParams", encodeURI($('#qitacanshu').val())); //其他参数

        //应用案例
        data.append("case", encodeURI($('#yingyonganli').val())); //应用案例
        //判断输入
        if (! data.get("productName")){show("产品名称不能为空!");}
        else if (! data.get("factoryName")){show("厂家不能为空!");}
        else if (! data.get("patternType")){show("模式类型不能为空!");}
        else if (! data.get("standard")){show("产品规格不能为空!");}
        else if (! data.get("price")){show("价格不能为空!");}
        else if (! data.get("applicableNum")){data["applicableNum"] = "0"}
        else{
            $.ajax({
                url: "/toilet/company/product/entry",
                type: "POST",
                dataType: "json",
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result.success) {
                        show("保存成功!");
                    } else {
                        show(result.errorMessage);
                    }
                }
            });
        }
    }

</script>


<script>
    function getRadioValue(radio) {
        let texture = "";
        for (let i=0;i<radio.length;i++) {
            if (radio[i].checked) {
                texture = radio[i].value;
            }
        }

        if (texture==="qita") {
            texture = $('#jvticaizhi').val();
        }
        return texture;
    }
</script>


</body>
</html>
