<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.common.collect.Lists" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.CompanyDTO" %><%--
  Created by IntelliJ IDEA.
  User: kokorozashinao
  Date: 2022/3/5
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
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
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back1" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-laptop"></i>用户管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back2" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-glass"></i>用户审核</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-tasks"></i>产品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back4" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-cogs"></i>模式管理</a>
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
    <%ToiletProductDTO productDTO = (ToiletProductDTO) request.getAttribute("product");
        CompanyDTO companyDTO = (CompanyDTO)request.getAttribute("company");
    %>
    <%--获取路径用于显示图片和文件--%>
    <% String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";%>

    <!-- Header-->
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/static/manage/images/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">


                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/toPage?url=admin_back5"><i class="fa fa-cog"></i>设置</a>

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
                            <strong class="card-title">产品信息审核</strong>
                        </div>
                        <div class="card-body">


                            <div id="newModeAdding" style="">


                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-basic-tab"
                                               data-toggle="tab" href="#custom-nav-basic" role="tab"
                                               aria-controls="custom-nav-basic" aria-selected="true">基础信息</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-basic" role="tabpanel"
                                             aria-labelledby="custom-nav-basic-tab">
                                            <div class="row form-group">

                                                <!-- 承载大图片的div -->
                                                <div id="outerdiv"
                                                     style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
                                                    　　
                                                    <div id="innerdiv" style="position:absolute;">
                                                        　　　　<img id="bigimg" style="border:5px solid #fff;" src=""/>
                                                        　　
                                                    </div>
                                                </div>

                                                <div class="col col-md-5">
                                                    <%String firstPicPath = productDTO.getPicsPath().split(";")[0];%>
                                                    <div class="col-12 col-md-12">
                                                        <img class="card-img-top" src="<%=basePath+firstPicPath%>"
                                                             alt="Card image cap"
                                                             id="sampleimg" onclick="showbigpic(this)">
                                                    </div>
                                                    <%
                                                        List<String> pathList = Lists.newArrayList(productDTO.getPicsPath().split(";"));
                                                        int sizeOfPic = 12 / (pathList.size() + 1);
                                                    %>
                                                    <div class="col-12 col-md-12">
                                                        <%for (String value : pathList) {%>
                                                        <img class="card-img-top col-md-<%=sizeOfPic%>"
                                                             src="<%=basePath+value%>"
                                                             alt="Card image cap" onclick="changeimg(this)">
                                                        <%}%>
                                                    </div>

                                                </div>
                                                <div class="col-12 col-md-7">
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="product_name"
                                                                                         class=" form-control-label">产品名称</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text"
                                                                                            id="product_name"
                                                                                            name="product_name"
                                                                                            placeholder=""
                                                                                            class="form-control"
                                                                                            value="<%=productDTO.getProductName()%>"
                                                                                            disabled>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="price"
                                                                                         class=" form-control-label">价格（元）</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text" id="price"
                                                                                            name="text-input"
                                                                                            placeholder=""
                                                                                            class="form-control"
                                                                                            value=<%=productDTO.getProductParameters().getPrice() * 10000%>
                                                                                                    disabled>

                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="producer_name"
                                                                                         class=" form-control-label">企业名称</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text"
                                                                                            id="producer_name"
                                                                                            name="producer_name"
                                                                                            placeholder=""
                                                                                            class="form-control"
                                                                                            value="<%=productDTO.getManufacturerName()%>"
                                                                                            disabled>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="phonenum"
                                                                                         class=" form-control-label">联系方式</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text" id="phonenum"
                                                                                            name="phonenum"
                                                                                            placeholder=""
                                                                                            class="form-control"
                                                                                            value=<%=productDTO.getManufacturerCell()%>
                                                                                                    disabled>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="address"
                                                                                         class=" form-control-label">地址</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text" id="address"
                                                                                            name="address"
                                                                                            placeholder=""
                                                                                            value="<%=companyDTO.getCompanyAddress()%>"
                                                                                            class="form-control"
                                                                                            disabled>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3"><label for="updateTime"
                                                                                         class=" form-control-label">最后更新</label>
                                                        </div>
                                                        <div class="col-12 col-md-9"><input type="text" id="updateTime"
                                                                                            name="updateTime"
                                                                                            placeholder=""
                                                                                            class="form-control"
                                                                                            value="<%=productDTO.getGmtModified().toInstant()%>"
                                                                                            disabled>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-condition-tab"
                                               data-toggle="tab" href="#custom-nav-condition" role="tab"
                                               aria-controls="custom-nav-condition" aria-selected="true">适用条件</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-condition" role="tabpanel"
                                             aria-labelledby="custom-nav-condition-tab">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="province"
                                                                                 class=" form-control-label">适用省份</label>
                                                </div>
                                                <div class="col-12 col-md-9"><input type="text" id="province"
                                                                                    name="province" placeholder=""
                                                                                    class="form-control"
                                                                                    value=<%=productDTO.getApplicableProvince()%> disabled>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="wendufanwei"
                                                                                 class=" form-control-label">适用温度范围</label>
                                                </div>
                                                <div class="col-12 col-md-9"><input type="text" id="wendufanwei"
                                                                                    name="wendufanwei" placeholder=""
                                                                                    class="form-control"
                                                                                    value="<%=productDTO.getApplicableTemperature()%>" disabled></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="jvtiyongtu"
                                                                                 class=" form-control-label">用途</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="jvtiyongtu"
                                                                                       id="jvtiyongtu" rows="5"
                                                                                       placeholder=""
                                                                                       class="form-control" disabled><%=productDTO.getPurpose()%></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-parameter-tab"
                                               data-toggle="tab" href="#custom-nav-parameter" role="tab"
                                               aria-controls="custom-nav-parameter" aria-selected="true">产品参数</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-nature"
                                             role="tabpanel"
                                             aria-labelledby="custom-nav-nature-tab">

                                            <div class="row form-group" id="gui">
                                                <div class="col col-md-3" style="margin-top: 5px"><label for="guige"
                                                                                                         class="form-control-label">规格（平方米）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="guige" name="guige"
                                                           placeholder="规格（平方米）" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getStandard()%>"
                                                           disabled>
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="shiyongrenshu"
                                                                                 class="form-control-label">适用人数（人）
                                                    <i class="fa fa-question-circle" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="输入注意事项"></i></label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="shiyongrenshu"
                                                                                    name="shiyongrenshu"
                                                                                    placeholder="输入适用人数"
                                                                                    class="form-control"
                                                                                    value="<%=productDTO.getProductParameters().getApplicableNum()%>" disabled>
                                                </div>
                                            </div>

                                            <div class="row form-group" id="chicun">
                                                <div class="row">
                                                    <div class="col col-md-4"><label for="chicun_chang"
                                                                                     class="form-control-label">尺寸（长*宽*高mm）:</label>
                                                    </div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">长：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text"
                                                                                        id="chicun_chang"
                                                                                        name="chicun_changt"
                                                                                        class="form-control"
                                                                                        value="<%=productDTO.getProductParameters().getLength()%>" disabled>
                                                    </div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">宽：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text" id="chicun_kuan"
                                                                                        name="chicun_kuan"
                                                                                        class="form-control"
                                                                                        value="<%=productDTO.getProductParameters().getWide()%>" disabled>
                                                    </div>
                                                    <div class="col-12 col-md-1"><label
                                                            class="form-control-label">高：</label></div>
                                                    <div class="col-12 col-md-1"><input type="text" id="chicun_gao"
                                                                                        name="chicun_gao"
                                                                                        class="form-control"
                                                                                        value="<%=productDTO.getProductParameters().getHigh()%>" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group" id="hou">
                                                <div class="col col-md-3"><label for="bihou"
                                                                                 class=" form-control-label">壁厚（mm）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="bihou" name="bihou"
                                                           placeholder="壁厚" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getWallThickness()%>" disabled>
                                                </div>
                                            </div>

                                            <div class="row form-group" id="zhong">
                                                <div class="col col-md-3"><label for="zhongliang"
                                                                                 class=" form-control-label">重量（kg）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="zhongliang" name="zhongliang"
                                                           placeholder="重量" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getWeight()%>" disabled>
                                                </div>
                                            </div>

                                            <div class="row form-group" id="cai">
                                                <div class="col col-md-3"><label
                                                        class=" form-control-label">材质：</label>
                                                </div>

                                                <%--   <div class="form-check-inline form-check">--%>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="jvticaizhi" name="jvticaizhi"
                                                           placeholder="输入材质" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getTexture()%>" disabled>
                                                </div>

                                                <%--                                                    </div>--%>


                                            </div>

                                            <div class="row form-group" id="yan">
                                                <div class="col col-md-3"><label for="yanse"
                                                                                 class=" form-control-label">颜色：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yanse" name="yanse"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getColor()%>" disabled>
                                                </div>
                                            </div>
                                            <div class="row form-group" id="shou">
                                                <div class="col col-md-3"><label for="shouming"
                                                                                 class=" form-control-label">使用寿命（年）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="shouming" name="shouming"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getServiceLife()%>" disabled>
                                                </div>

                                            </div>


                                            <div class="row form-group" id="yong">
                                                <div class="col col-md-3"><label class="form-control-label">用途：
                                                </label></div>
                                                <div class="col-12 col-md-9">
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="户厕" <%if(productDTO.getPurpose().equals("户厕")){%>
                                                           checked <%}%> disabled>户厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="公厕" <%if(productDTO.getPurpose().equals("公厕")){%>
                                                           checked <%}%> disabled>公厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="均可" <%if(productDTO.getPurpose().equals("均可")){%>
                                                           checked <%}%> disabled>均可
                                                </div>
                                            </div>

                                            <div class="row form-group" id="yun">
                                                <div class="col col-md-3"><label for="yunxingchengben"
                                                                                 class=" form-control-label">运行成本：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yunxingchengben" name="yunxingchengben"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getRunCost()%>" disabled>
                                                </div>
                                            </div>

                                            <div class="row form-group" id="qing">
                                                <div class="col col-md-3"><label for="qinglizhouqi"
                                                                                 class=" form-control-label">清理周期（月）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="qinglizhouqi" name="qinglizhouqi"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getCleanupCycle()%>" disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-features-tab"
                                               data-toggle="tab" href="#custom-nav-features" role="tab"
                                               aria-controls="custom-nav-features" aria-selected="true">产品特点</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-features" role="tabpanel"
                                             aria-labelledby="custom-nav-features-tab">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chanpingtedian"
                                                                                 class=" form-control-label">产品特点</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="chanpingtedian"
                                                                                       id="chanpingtedian" rows="9"
                                                                                       placeholder=""
                                                                                       class="form-control" disabled><%=productDTO.getProductFeatures()%></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label
                                                        class=" form-control-label">使用图片</label>
                                                </div>


                                                <!-- 承载大图片的div -->
                                                <div id="outerdiv"
                                                     style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
                                                    　　
                                                    <div id="innerdiv" style="position:absolute;">
                                                        　　　　<img id="bigimg" style="border:5px solid #fff;" src=""/>
                                                        　　
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-9">
                                                    <%for (String value : pathList) {%>
                                                    <img class="card-img-top col-md-3"
                                                         src="<%=basePath+value%>"
                                                         alt="Card image cap" onclick="changeimg(this)">
                                                    <%}%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-quality-tab"
                                               data-toggle="tab" href="#custom-nav-quality" role="tab"
                                               aria-controls="custom-nav-quality" aria-selected="true">质量保障</a>
                                        </div>
                                    </nav>
                                    <%String filePath = productDTO.getQualityAssuranceMaterialsFilePath();%>
                                    <%if(filePath.length() != 0){%>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-quality" role="tabpanel"
                                             aria-labelledby="custom-nav-quality-tab">
                                            <iframe src="<%=basePath + filePath%>"
                                                    width="100%" height="100%" style="height: 500px;"></iframe>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>

                                <div class="custom-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-use-tab"
                                               data-toggle="tab" href="#custom-nav-use" role="tab"
                                               aria-controls="custom-nav-use" aria-selected="true">使用说明</a>
                                        </div>
                                    </nav>
                                    <%filePath = productDTO.getInstructionFilePath();%>
                                    <%if(filePath.length() != 0){%>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-use" role="tabpanel"
                                             aria-labelledby="custom-nav-use-tab">
                                            <iframe src="<%=basePath + filePath%>"
                                                    width="100%" height="100%" style="height: 500px;"></iframe>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>

                            </div>

                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back3'">返回</button>
                            </div>

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

</div>
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


</body>
</html>

