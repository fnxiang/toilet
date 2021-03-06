<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.common.collect.Lists" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.CompanyDTO" %>
<%@ page import="org.springframework.util.StringUtils" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.ApprovalDTO" %>
<%@ page import="cn.edu.bjtu.toilet.constant.AuditStatus" %>
<%@ page import="cn.edu.bjtu.toilet.utils.DateUtil" %><%--
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
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back1" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-laptop"></i>用户管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back14" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-user"></i>添加用户</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back2" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-glass"></i>用户审核</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back3" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-tasks"></i>产品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back4" style="padding-top: 20px; padding-bottom: 20px;"><i
                            class="menu-icon fa fa-cogs"></i>模式管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/toPage?url=admin_back5"
                       style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cog" aria-hidden="true"></i>修改密码</a>
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

                        <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fa fa-power-off"></i>注销</a>
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
                                                                                            value=<%=productDTO.getProductParameters().getPrice()%>
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
                                                                                            value="<%=DateUtil.toStandardFormat(productDTO.getGmtModified())%>"
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
                                        </div>
                                    </div>
                                    <div class="row form-group" id="shiyong" style="display: none">
                                        <div class="col col-md-3"><label for="shiyongtiaojian" class="form-control-label">适用条件
                                            <i class="fa" data-toggle="tooltip" data-placement="top"
                                               title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><textarea name="shiyongtiaojian" id="shiyongtiaojian"
                                                                               rows="9" placeholder="适用条件..."
                                                                               class="form-control"><%=productDTO.getApplicableCondition()%></textarea></div>
                                    </div>
                                </div>

                                <div class="custom-tab" id="chanpincanshu">
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
                                                    <i class="fa" data-toggle="tooltip"
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
                                                <div class="col col-md-3"><label for="chicun_chang"
                                                                                 class="form-control-label">尺寸(mm):</label>
                                                </div>
                                                <label
                                                        class="form-control-label">长：</label>
                                                <div class="col col-md-1"><input type="text" id="chicun_chang"
                                                                                 name="chicun_chang"
                                                                                 class="form-control" value="<%=productDTO.getProductParameters().getLength()%>" disabled></div>
                                                <label class="form-control-label">mm</label>
                                                <div class="col col-1"><div class="text-center">x</div></div>
                                                <label
                                                        class="form-control-label">宽：</label>
                                                <div class="col col-md-1"><input type="text" id="chicun_kuan"
                                                                                 name="chicun_kuan"
                                                                                 class="form-control" value="<%=productDTO.getProductParameters().getWide()%>" disabled></div>
                                                <label class="form-control-label">mm</label>
                                                <div class="col col-1"><div class="text-center">x</div></div>
                                                <label
                                                        class="form-control-label">高：</label>
                                                <div class="col col-md-1"><input type="text" id="chicun_gao"
                                                                                 name="chicun_gao"
                                                                                 class="form-control" value="<%=productDTO.getProductParameters().getHigh()%>" disabled></div>
                                                <label class="form-control-label">mm</label>
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
                                                                                 class=" form-control-label">运行成本（元/人·天）：</label>
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
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-features" role="tabpanel"
                                             aria-labelledby="custom-nav-features-tab">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chanpingtedian"
                                                                                 class=" form-control-label">具体用途</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="chanpingtedian"
                                                                                       id="chanpingtedian" rows="9"
                                                                                       placeholder=""
                                                                                       class="form-control" disabled><%=productDTO.getProductParameters().getParamPurpose()%></textarea>
                                                </div>
                                            </div>
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

                                            <div class="row form-group" id="chanpinzucheng" style="display: none">
                                                <div class="col col-md-3"><label for="chanpinyuanli" class="form-control-label">产品原理及组成
                                                    <i class="fa" data-toggle="tooltip" data-placement="top"
                                                       title="输入注意事项"></i></label></div>
                                                <div class="col-12 col-md-9"><textarea name="chanpinyuanli" id="chanpinyuanli"
                                                                                       rows="9" placeholder="请输入产品原理及组成..."
                                                                                       class="form-control"><%=productDTO.getProductTheory()%></textarea></div>
                                            </div>

                                            <div class="row form-group" id="peculiar">
                                                <div class="col col-md-3"><label for="peculiar_canshu" class="form-control-label">产品参数
                                                    <i class="fa" data-toggle="tooltip" data-placement="top"
                                                       title="输入注意事项"></i></label></div>
                                                <div class="col-12 col-md-9"><textarea name="peculiar_canshu" id="peculiar_canshu"
                                                                                       rows="9" placeholder="产品参数..."
                                                                                       class="form-control" disabled><%=productDTO.getSpecialParam()%></textarea></div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chanpingtedian"
                                                                                 class=" form-control-label">应用案例</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="chanpingtedian"
                                                                                       id="chanpingtedian" rows="9"
                                                                                       placeholder=""
                                                                                       class="form-control" disabled><%=productDTO.getProductParameters().getApplyCase()%></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group" id="qita">
                                                <div class="col col-md-3"><label for="qitacanshu"
                                                                                 class="form-control-label">其他参数
                                                </label></div>
                                                <div class="col-12 col-md-9"><textarea type="text" id="qitacanshu"
                                                                                       name="qitacanshu"
                                                                                       placeholder="输入其他参数"
                                                                                       class="form-control" disabled><%=productDTO.getProductParameters().getOtherParams()%></textarea>
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

                            <%
                                ApprovalDTO approvalDTO = (ApprovalDTO) request.getAttribute("approval");
                                String status = "";
                                String content = "";
                                if (approvalDTO != null) {
                                    status = approvalDTO.getStatus().getName();
                                    content = approvalDTO.getContent();
                                }
                                String productStatus = productDTO.getStatus().getName();
                            %>
                            <hr>
                            <%if (productStatus.equals("审核通过") || productStatus.equals("审核不通过") || productStatus.equals("等待管理员审核") || productStatus.equals("修改后重新审核")){%>
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="select_status"
                                                                     class=" form-control-label">是否通过</label></div>
                                    <div class="col-12 col-md-9">
                                        <select name="select_status" id="select_status" class="form-control" <%if(productStatus.equals("等待管理员审核")){}else{%> disabled <%}%>>
                                            <option value="审核通过"
                                                    <%if (!StringUtils.isEmpty(status) && status.equals("审核通过")){%>selected="selected"<%}%>>审核通过
                                            </option>
                                            <option value="审核不通过"
                                                    <%if (!StringUtils.isEmpty(status) && status.equals("审核不通过")){%>selected="selected"<%}%>>审核不通过
                                            </option>
                                            <option value="修改后重新审核"
                                                    <%if (!StringUtils.isEmpty(status) && (status.equals("修改后重新审核"))){%>selected="selected"<%}%>>修改后重新审核
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="opinion"
                                                                     class=" form-control-label">审核意见</label>
                                    </div>
                                    <div class="col-12 col-md-9"><textarea name="opinion" id="opinion"
                                                                           rows="9" placeholder=""
                                                                           class="form-control" <%if(productStatus.equals("等待管理员审核")){}else{%> disabled="disabled" <%}%>><%=content%></textarea></div>
                                </div>
                            </form>
                            <%}%>
                            <%if (!StringUtils.isEmpty(productStatus) && (productStatus.equals("等待管理员审核"))) {%>
                            <div class="card-text text-lg-center">
                                <button type="button"  class="btn btn-outline-secondary" onclick="commit()">
                                    确认提交
                                </button>
                                <button type="button" class="btn btn-outline-secondary offset-2"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back3'">返回
                                </button>
                            </div>
                            <%}else{%>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/toPage?url=admin_back3'">返回
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
    $(document).ready(function () {
        var zhongliangdiv = $("#zhong").get(0);
        var bihoudiv = $("#hou").get(0);
        var chanpinyuanli = $("#chanpinzucheng").get(0);
        var qitacanshu = $("#qita").get(0);
        var guige = $("#gui").get(0);
        var chicun = $("#chicun").get(0);
        var caizhi = $("#cai").get(0);
        var yanse = $("#yan").get(0);
        var yunxingchengben = $("#yun").get(0);
        var qinglizhouqi = $("#qing").get(0);
        var shiyong = $("#shiyong").get(0);
        var chanpincanshu = $("#chanpincanshu").get(0);
        var peculiar_canshu = $("#peculiar").get(0);
        var productType = '<%=productDTO.getProductType()%>'
        if (productType === '双瓮漏斗式厕所') { //双瓮漏斗式厕所
            zhongliangdiv.style.display = "";
            bihoudiv.style.display = "";
            chanpinyuanli.style.cssText = "display:none;"
            qitacanshu.style.cssText = "display:none;"
            guige.style.cssText = "";
            chicun.style.cssText = "";
            caizhi.style.cssText = "";
            yanse.style.cssText = "";
            yunxingchengben.style.cssText = "";
            qinglizhouqi.style.cssText = "";
            shiyong.style.cssText = "display:none;"
            chanpincanshu.style.cssText = "";
            peculiar_canshu.style.cssText = "display:none;"
        } else if (productType === '三联沼气池式厕所' || productType === '复合生物反应微水冲厕所' || productType === '多级生化组合电催化氧化厕所' || productType === '膜生物反应器（MBR）厕所' || productType === '生态旱厕' || productType === '粪尿分集式厕所') {
            //三联沼气池式厕所;复合生物反应微水冲厕所;多级生化组合电催化氧化厕所;膜生物反应器（MBR）厕所;生态旱厕;粪尿分集式厕所
            chanpinyuanli.style.cssText = "";
            qitacanshu.style.cssText = "";
            guige.style.cssText = "display:none;"
            chicun.style.cssText = "display:none;"
            caizhi.style.cssText = "display:none;"
            yanse.style.cssText = "display:none;"
            yunxingchengben.style.cssText = "display:none;"
            qinglizhouqi.style.cssText = "display:none;"
            zhongliangdiv.style.cssText = "display:none;"
            bihoudiv.style.cssText = "display:none;"
            shiyong.style.cssText = "display:none;"
            chanpincanshu.style.cssText = "";
            peculiar_canshu.style.cssText = "display:none;"
        } else if (productType === '泡沫封堵液') { //泡沫封堵液
            shiyong.style.cssText = "";
            chanpincanshu.style.cssText = "display:none;"
            peculiar_canshu.style.cssText = "";
            chanpinyuanli.style.cssText = "display:none;"
            qitacanshu.style.cssText = "display:none;"
            guige.style.cssText = "";
            chicun.style.cssText = "";
            caizhi.style.cssText = "";
            yanse.style.cssText = "";
            yunxingchengben.style.cssText = "";
            qinglizhouqi.style.cssText = "";
            zhongliangdiv.style.cssText = "display:none;"
            bihoudiv.style.cssText = "display:none;"
        }else{
            chanpincanshu.style.cssText = ""
            peculiar_canshu.style.cssText = "display:none;";
            chanpinyuanli.style.cssText = "display:none;"
            qitacanshu.style.cssText = "display:none;"
            guige.style.cssText = "";
            chicun.style.cssText = "";
            caizhi.style.cssText = "";
            yanse.style.cssText = "";
            yunxingchengben.style.cssText = "";
            qinglizhouqi.style.cssText = "";
            zhongliangdiv.style.cssText = "display:none;"
            bihoudiv.style.cssText = "display:none;"
            shiyong.style.cssText = "display:none;"
        }
    });
</script>
<script>
    function commit() {
        const data = new FormData();
        data.append("productId", "<%=productDTO.getId()%>");
        data.append("auditStatus", encodeURI(document.querySelector('#select_status option:checked').value));
        data.append("comment", encodeURI($('#opinion').val()));
        $.ajax({
            url: "/toilet/admin/product/audit",
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
<script type="text/javascript">
    function showbigpic(obj) {
        var _this = $(obj);//将当前的pimg元素作为_this传入函数
        imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
    }

    function imgShow(outerdiv, innerdiv, bigimg, _this) {
        var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
        $(bigimg).attr("src", src);//设置#bigimg元素的src属性

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
        $("<img/>").attr("src", src).load(function () {
            var windowW = $(window).width();//获取当前窗口宽度
            var windowH = $(window).height();//获取当前窗口高度
            var realWidth = this.width;//获取图片真实宽度
            var realHeight = this.height;//获取图片真实高度
            var imgWidth, imgHeight;
            var scale = 0.9;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

            if (realHeight > windowH * scale) {//判断图片高度
                imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放
                imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度
                if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度
                    imgWidth = windowW * scale;//再对宽度进行缩放
                }
            } else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度
                imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放
                imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度
            } else {//如果图片真实高度和宽度都符合要求，高宽不变
                imgWidth = realWidth;
                imgHeight = realHeight;
            }
            $(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放

            var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距
            var h = (windowH - imgHeight) / 2;//计算图片与窗口上边距
            $(innerdiv).css({"top": h, "left": w});//设置#innerdiv的top和left属性
            $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
        });

        $(outerdiv).click(function () {//再次点击淡出消失弹出层
            $(this).fadeOut("fast");
        });
    }

</script>

<script type="text/javascript">
    function changeimg(obj) {
        var _this = $(obj);
        var src = _this.attr("src");
        $("#sampleimg").attr("src", src);
    }

</script>
</body>
</html>

