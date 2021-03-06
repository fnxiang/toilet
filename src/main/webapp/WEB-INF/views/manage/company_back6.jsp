<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.common.collect.Lists" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.CompanyDTO" %>
<%@ page import="cn.edu.bjtu.toilet.utils.DateUtil" %>
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
    <%--    fixme productDTO为空--%>
    <%ToiletProductDTO productDTO = (ToiletProductDTO) request.getAttribute("product");
        CompanyDTO companyDTO = (CompanyDTO)request.getAttribute("company");
    %>
    <%--获取路径用于显示图片和文件--%>
    <% String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";%>
    <!-- Header-->
    <jsp:include page="company_header.jsp"/>
    <!-- Header-->
    <div class="breadcrumbs">
        <div class="breadcrumbs-inner">
            <div class="row m-0">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>产品信息修改</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                <li class="active">产品信息修改</li>
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
                            <strong class="card-title">产品信息</strong>
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
                                                                                                    >

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
                                                                                                    >
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
                                                                                            >
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
                                                                                            >
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
                                                                                    value=<%=productDTO.getApplicableProvince()%> >
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="wendufanwei"
                                                                                 class=" form-control-label">适用温度范围</label>
                                                </div>
                                                <div class="col-12 col-md-9"><input type="text" id="wendufanwei"
                                                                                    name="wendufanwei" placeholder=""
                                                                                    class="form-control"
                                                                                    value="<%=productDTO.getApplicableTemperature()%>" ></div>
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
                                                                                 class="form-control-label">适用人数（人）：
                                                    <i class="fa" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="输入注意事项"></i></label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="shiyongrenshu"
                                                                                    name="shiyongrenshu"
                                                                                    placeholder="输入适用人数"
                                                                                    class="form-control"
                                                                                    value="<%=productDTO.getProductParameters().getApplicableNum()%>" >
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
                                                                                 class="form-control"></div>
                                                <label class="form-control-label">mm</label>
                                                <div class="col col-1"><div class="text-center">x</div></div>
                                                <label
                                                        class="form-control-label">宽：</label>
                                                <div class="col col-md-1"><input type="text" id="chicun_kuan"
                                                                                 name="chicun_kuan"
                                                                                 class="form-control"></div>
                                                <label class="form-control-label">mm</label>
                                                <div class="col col-1"><div class="text-center">x</div></div>
                                                <label
                                                        class="form-control-label">高：</label>
                                                <div class="col col-md-1"><input type="text" id="chicun_gao"
                                                                                 name="chicun_gao"
                                                                                 class="form-control"></div>
                                                <label class="form-control-label">mm</label>
                                            </div>
                                            <div class="row form-group" id="hou">
                                                <div class="col col-md-3"><label for="bihou"
                                                                                 class=" form-control-label">壁厚（mm）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="bihou" name="bihou"
                                                           placeholder="壁厚" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getWallThickness()%>" >
                                                </div>
                                            </div>

                                            <div class="row form-group" id="zhong">
                                                <div class="col col-md-3"><label for="zhongliang"
                                                                                 class=" form-control-label">重量（kg）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="zhongliang" name="zhongliang"
                                                           placeholder="重量" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getWeight()%>" >
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
                                                           value="<%=productDTO.getProductParameters().getTexture()%>" >
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
                                                           value="<%=productDTO.getProductParameters().getColor()%>" >
                                                </div>
                                            </div>
                                            <div class="row form-group" id="shou">
                                                <div class="col col-md-3"><label for="shouming"
                                                                                 class=" form-control-label">使用寿命（年）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="shouming" name="shouming"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getServiceLife()%>" >
                                                </div>

                                            </div>


                                            <div class="row form-group" id="yong">
                                                <div class="col col-md-3"><label class="form-control-label">用途：
                                                </label></div>
                                                <div class="col-12 col-md-9">
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="户厕" <%if(productDTO.getPurpose().equals("户厕")){%>
                                                           checked <%}%> >户厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="公厕" <%if(productDTO.getPurpose().equals("公厕")){%>
                                                           checked <%}%> >公厕
                                                    <input class="col-md-1" type="radio" name="cesuoyongtu"
                                                           value="均可" <%if(productDTO.getPurpose().equals("均可")){%>
                                                           checked <%}%> >均可
                                                </div>
                                            </div>

                                            <div class="row form-group" id="yun">
                                                <div class="col col-md-3"><label for="yunxingchengben"
                                                                                 class=" form-control-label">运行成本（元/人·天）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="yunxingchengben" name="yunxingchengben"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getRunCost()%>" >
                                                </div>
                                            </div>

                                            <div class="row form-group" id="qing">
                                                <div class="col col-md-3"><label for="qinglizhouqi"
                                                                                 class=" form-control-label">清理周期（月）：</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="qinglizhouqi" name="qinglizhouqi"
                                                           placeholder="" class="form-control"
                                                           value="<%=productDTO.getProductParameters().getCleanupCycle()%>" >
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
                                                                                       class="form-control" ><%=productDTO.getProductParameters().getParamPurpose()%></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chanpingtedian"
                                                                                 class=" form-control-label">产品特点</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="chanpingtedian"
                                                                                       id="chanpingtedian" rows="9"
                                                                                       placeholder=""
                                                                                       class="form-control" ><%=productDTO.getProductFeatures()%></textarea>
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
                                                                                       class="form-control" ><%=productDTO.getSpecialParam()%></textarea></div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="chanpingtedian"
                                                                                 class=" form-control-label">应用案例</label>
                                                </div>
                                                <div class="col-12 col-md-9"><textarea name="chanpingtedian"
                                                                                       id="chanpingtedian" rows="9"
                                                                                       placeholder=""
                                                                                       class="form-control" ><%=productDTO.getProductParameters().getApplyCase()%></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group" id="qita">
                                                <div class="col col-md-3"><label for="qitacanshu"
                                                                                 class="form-control-label">其他参数
                                                </label></div>
                                                <div class="col-12 col-md-9"><textarea type="text" id="qitacanshu"
                                                                                       name="qitacanshu"
                                                                                       placeholder="输入其他参数"
                                                                                       class="form-control" ><%=productDTO.getProductParameters().getOtherParams()%></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label
                                                        class=" form-control-label">使用图片</label>
                                                </div>


                                                <div class="col-12 col-md-8">
                                                    <style>
                                                        .img-box {
                                                            display: inline-block;
                                                            border: 1px solid #ececec;
                                                            position: relative;
                                                        }
                                                        .image-remove {
                                                            background-color: white;
                                                            font-color: #ececec;
                                                            font-size: 20px;
                                                            width: 30px;
                                                            height: 30px;
                                                            text-align: center;
                                                            border-radius: 100%;
                                                            transform: rotate(45deg);
                                                            cursor: pointer;
                                                            opacity: 0.5;
                                                            top: 2px;
                                                            right: 2px;
                                                            display: block;
                                                            position: absolute;
                                                        }
                                                    </style>
                                                    <div id="removeImage" class="col col-md-8">
                                                        <%int i;%>
                                                        <%for (i = 0; i < pathList.size(); i++) {%>
                                                        <div class="img-box" id="delete<%=i + 1%>">
                                                            <img src="<%=basePath+pathList.get(i)%>"
                                                                 alt="Card image cap">
                                                            <span class="image-remove" id="<%=i + 1%>">+</span>
                                                        </div>
                                                        <div class="row form-group" id="shuru<%=i + 1%>"
                                                             style="display: none">
                                                            <div class="col col-md-4"><label for="picturefile<%=i + 1%>"
                                                                                             class=" form-control-label">上传使用图片<%=i + 1%>
                                                                <i class="fa fa-question-circle" data-toggle="tooltip"
                                                                   data-placement="top"
                                                                   title="输入注意事项"></i></label></div>
                                                            <div class="col-12 col-md-8"><input type="file"
                                                                                                id="picturefile<%=i + 1%>"
                                                                                                name="picturefile<%=i + 1%>"
                                                                                                class="form-control-file">
                                                                <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                                            </div>
                                                        </div>
                                                        <%}%>
                                                    </div>
                                                    <div class="col col-md-8">
                                                        <%while (i < 4) {%>
                                                        <div class="row form-group">
                                                            <div class="col col-md-4"><label for="picturefile<%=i + 1%>"
                                                                                             class=" form-control-label">上传使用图片<%=i + 1%>
                                                                <i class="fa fa-question-circle" data-toggle="tooltip"
                                                                   data-placement="top"
                                                                   title="输入注意事项"></i></label></div>
                                                            <div class="col-12 col-md-8"><input type="file"
                                                                                                id="picturefile<%=i + 1%>"
                                                                                                name="picturefile<%=i + 1%>"
                                                                                                class="form-control-file">
                                                                <small class="form-text text-muted">请选择PNG文件作为主要展示图片</small>
                                                            </div>
                                                        </div>
                                                        <%i++;%>
                                                        <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-tab" id="qualityinsurance">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-quality-tab"
                                               data-toggle="tab" href="#custom-nav-quality" role="tab"
                                               aria-controls="custom-nav-quality" aria-selected="true">质量保障</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-quality" role="tabpanel"
                                             aria-labelledby="custom-nav-quality-tab">
                                            <%String qualityassurancematerialsfilepath = productDTO.getQualityAssuranceMaterialsFilePath();%>
                                            <%if (qualityassurancematerialsfilepath.length() != 0) {%>
                                            <iframe src="<%=basePath + qualityassurancematerialsfilepath%>" width="100%"
                                                    height="100%"
                                                    style="height: 500px;"></iframe>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group" id="shuruqualityinsurance" style="display: none">
                                    <div class="col col-md-3"><label for="zhiliangbaozhang" class="form-control-label">质量保障材料
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i> </label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="zhiliangbaozhang"
                                                                        name="zhiliangbaozhang"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="card-text text-lg-center">
                                    <button type="button" id="qualityinsurance_button" class="btn btn-outline-secondary"
                                            onclick="upload_qualityinsurance()">上传质量保证材料
                                    </button>
                                </div>
                                <div class="custom-tab" id="instruction">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active show" id="custom-nav-use-tab"
                                               data-toggle="tab" href="#custom-nav-use" role="tab"
                                               aria-controls="custom-nav-use" aria-selected="true">使用说明</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade active show" id="custom-nav-use" role="tabpanel"
                                             aria-labelledby="custom-nav-use-tab">
                                            <%String instructionfilepath = productDTO.getInstructionFilePath();%>
                                            <%if (instructionfilepath.length() != 0) {%>
                                            <iframe src="<%=basePath + instructionfilepath%>" width="100%" height="100%"
                                                    style="height: 500px;"></iframe>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group" id="shuruinstruction" style="display: none">
                                    <div class="col col-md-3"><label for="shiyongshuoming" class=" form-control-label">使用说明
                                        <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top"
                                           title="输入注意事项"></i></label></div>
                                    <div class="col-12 col-md-9"><input type="file" id="shiyongshuoming"
                                                                        name="shiyongshuoming"
                                                                        class="form-control-file">
                                        <small class="form-text text-muted">请选择PDF文件上传</small>
                                    </div>
                                </div>
                                <div class="card-text text-lg-center">
                                    <button type="button" id="instruction_button" class="btn btn-outline-secondary"
                                            onclick="upload_instruction()">上传使用说明
                                    </button>
                                </div>

                            </div>


                            <hr>
                            <div class="card-text text-lg-center">
                                <button type="button" class="btn btn-outline-secondary" onclick="modify()">提交修改</button>
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
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });
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

<script>
    function changeimg(obj) {
        var _this = $(obj);
        var src = _this.attr("src");
        $("#sampleimg").attr("src", src);
    }
    var pic1 = null;
    var pic2 = null;
    var pic3 = null;
    var pic4 = null;
    <%for(int j = 0; j < pathList.size(); j++){%>
    pic<%=j + 1%> = "<%=pathList.get(j).replaceAll("\\\\", "/")%>"
    <%}%>
    var introduction = "<%=productDTO.getInstructionFilePath().replaceAll("\\\\", "/")%>"
    var quality = "<%=productDTO.getQualityAssuranceMaterialsFilePath().replaceAll("\\\\", "/")%>"
    //删除使用图片
    $('#removeImage').click(function (e) {
        var pic = document.getElementById("delete" + e.target.id);
        pic.style.display = "none";
        var shuru = document.getElementById("shuru" + e.target.id);
        shuru.style.cssText = "";
        switch (e.target.id) {
            case "1":
                pic1 = null;
                break;
            case "2":
                pic2 = null;
                break;
            case "3":
                pic3 = null;
                break;
            case "4":
                pic4 = null;
                break;
        }
    });
    //上传使用说明
    function upload_instruction() {
        var instruction = document.getElementById("instruction");
        var shuruinstruction = document.getElementById("shuruinstruction");
        var instruction_button = document.getElementById("instruction_button");
        instruction_button.style.cssText = "display:none;";
        instruction.style.cssText = "display:none;";
        shuruinstruction.style.cssText = "";
        introduction = null;
    }
    //上传质量保证材料
    function upload_qualityinsurance() {
        var qualityinsurance = document.getElementById("qualityinsurance");
        var qualityinsurance_button = document.getElementById("qualityinsurance_button");
        var shuruqualityinsurance = document.getElementById("shuruqualityinsurance");
        qualityinsurance_button.style.cssText = "display:none;";
        qualityinsurance.style.cssText = "display:none;";
        shuruqualityinsurance.style.cssText = "";
        quality = null;
    }
    //提交修改
    function modify() {
        let data = new FormData();
        data.append("productId", "<%=productDTO.getId()%>"); //产品编号
        data.append("productName", encodeURI($('#product_name').val())); //产品名称
        data.append("factoryName", encodeURI($('#producer_name').val())); //厂家
        data.append("factoryNum", $('#phonenum').val()); //联系方式
        data.append("updateTime", encodeURI($('#updateTime').val())); //更新时间
        data.append("address", encodeURI($('#address').val())); //地址
        data.append("province", encodeURI($('#province').val())); //适用省份
        data.append("temperature", encodeURI($('#wendufanwei').val())); //适用温度范围
        data.append("features", encodeURI($('#chanpingtedian').val())); //产品特点
        data.append("applicableCondition", encodeURI($('#shiyongtiaojian').val())); //适用条件
        data.append("productTheory", encodeURI($('#chanpinyuanli').val())); //产品原理及组成
        data.append("standard", encodeURI($('#guige').val())); //规格（平方米）
        data.append("weight", encodeURI($('#zhongliang').val())); //重量kg
        data.append("thickness", encodeURI($('#bihou').val())); //壁厚
        data.append("applicableNum", encodeURI($('#shiyongrenshu').val())); //适用人数（人）
        data.append("length", $('#chicun_chang').val()); //尺寸（长*宽*高mm）
        data.append("wide", $('#chicun_kuan').val());
        data.append("high", $('#chicun_gao').val());
        data.append("texture", encodeURI('#jvticaizhi'));
        data.append("color", encodeURI($('#yanse').val())); //颜色
        data.append("serviceLife", encodeURI($('#shouming').val())); //使用寿命
        data.append("price", $('#price').val()); //价格（元）
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
        // 文件上传
        if (!quality) {
            quality = $('#zhiliangbaozhang')[0].files[0];
        }
        if (!introduction) {
            introduction = $('#shiyongshuoming')[0].files[0];
        }
        if (!pic1) {
            pic1 = $('#picturefile1')[0].files[0];
        }
        if (!pic2) {
            pic2 = $('#picturefile2')[0].files[0];
        }
        if (!pic3) {
            pic3 = $('#picturefile3')[0].files[0];
        }
        if (!pic4) {
            pic4 = $('#picturefile4')[0].files[0];
        }
        data.append("qualityMaterial", quality); //质量保障材料
        data.append("introductions", introduction); //使用说明
        data.append("pics1", pic1); //使用图片
        data.append("pics2", pic2); //使用图片
        data.append("pics3", pic3); //使用图片
        data.append("pics4", pic4); //使用图片
        $.ajax({
            url: "/toilet/company/product/update",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    show("更新成功!");
                } else {
                    show("更新失败!");
                }
            }
        });
    }
</script>

<script>
    function getRadioValue(radio) {
        let texture = "";
        for (let i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                texture = radio[i].value;
            }
        }
        if (texture === "qita") {
            texture = $('#jvticaizhi').val();
        }
        return texture;
    }
    function close(){
        $(".dialog").css("display","none");
    }
</script>


</body>
</html>