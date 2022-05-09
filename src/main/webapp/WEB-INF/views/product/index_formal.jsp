<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.collections4.CollectionUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">

    <meta name="description" content="">
    <meta name="keywords" content="">

    <title>厕所选型系统</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/product/res/logo.ico">
    <link href="${pageContext.request.contextPath}/static/product/css/style.css" media="screen" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/static/product/css/grid.css" media="screen" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/product/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/product/css/bootstrap-table.css">



</head>
<body>
<jsp:include page="product_banner.jsp"/>
<%
    String sort_condition = "price";
    String sort_way = "false";
    if (request.getAttribute("sort_condition") != null) {
        sort_condition = request.getAttribute("sort_condition").toString();
    }
    if (request.getAttribute("sort_way") != null) {
        sort_way = request.getAttribute("sort_way").toString();
    }
%>
<!-- .container_12 -->

<div class="clear"></div>

<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li class="curent"><a href="index_formal.index_formal.jsp">首页</a></li>
                    <li>
                        <a href="#">预留</a>
                        <ul class="sub">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="text_page.html">Typography and basic styles</a></li>
                            <li><a href="catalog_grid.html">Catalog (grid view)</a></li>
                            <li><a href="catalog_list.html">Catalog (list type view)</a></li>
                            <li><a href="product_page.html">Product view</a></li>
                            <li><a href="shopping_cart.html">Shoping cart</a></li>
                            <li><a href="checkout.html">Proceed to checkout</a></li>
                            <li><a href="compare.html">Products comparison</a></li>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="contact_us.html">Contact us</a></li>
                            <li><a href="404.html">404</a></li>
                            <li><a href="blog.html">Blog posts</a></li>
                            <li><a href="blog_post.html">Blog post view</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- .primary -->
        </div>
        <!-- .grid_12 -->
    </div>
    <!-- .container_12 -->
</div>
<!-- .block_nav_primary -->

<section id="main" class="home">
    <div class="container_12">
        <div class="clear"></div>

        <div class="carousel">
            <div class="c_header">
                <div class="grid_6">
                    <h2>产品展示</h2>
                </div>
<%--                <div class="grid_2">--%>
<%--                    <select class="grid_2" name="sortCondition" id="sortCondition">--%>
<%--                        <option value="price">价格</option>--%>
<%--                        <option value="life">使用寿命</option>--%>
<%--                        <option value="cleanCycle">清理周期</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="grid_2">--%>
<%--                    <select class="grid_2" name="sortWay" id="sortWay">--%>
<%--                        <option value="false">升序</option>--%>
<%--                        <option value="true">降序</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="grid_2">--%>
<%--                    <button class="grid_2" onclick="sort()">应用</button>--%>
<%--                </div>--%>
                <!-- .grid_10 -->


            </div>
            <!-- .c_header -->
            <div id="list_carousel" class="list_carousel">

                <% List<ToiletProductDTO> productList = (List<ToiletProductDTO>) request.getAttribute("productList");%>
                <c:set var="list" value="<%=JSON.toJSONString(productList)%>" scope="application"/>
                <% String path = request.getContextPath();
                    String basePath = request.getScheme() + "://"
                            + request.getServerName() + ":" + request.getServerPort()
                            + path + "/";%>
                <div class="card">
                    <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover">
                    </table>
                </div>
                <div class="clearfix"></div>
                <div class="clear"></div>
                <div id="content_bottom">
                    <div class="grid_12">
                        <div class="bottom_block about_as">
                            <h3>关于我们</h3>

                            <p>
                                2003年3月，中国建筑设计研究院（集团）为促进国有资产增值保值，实现集团业务板块发展布局，决定出资人民币500万元在原科技信息研究所基础上，注册成立国有独资的信息研究院，开展建设领域信息服务等业务。同年7月，经国家工商总局核准，亚太建设科技信息研究院正式挂牌成立。2014年6月9日，“亚太建设科技信息研究院”出于发展需要，正式更名为“亚太建设科技信息研究院有限公司”。</p>

                            <p>
                                公司的发展战略是：以巩固、培育、发展品牌信息产品和优势业务为目标，逐步形成拥有包括专业技术期刊、信息咨询、软课题研究、网站媒体等众多品牌产品和优势业务.目前，该公司设有建筑技术分院、施工技术信息研究所、给水排水信息研究所、暖通空调信息研究所、《建筑经济》杂志社、科技发展研究所和公司职能管理部门以及全国给水排水技术信息网管理办公室、全国建筑智能技术情报网管理办公室、中国勘察设计协会建筑环境与设备专业委员会、中国建筑业协会建筑防水专业分会、中国建筑学会建筑经济分会、中国建筑学会工程建设学术委员会、建设部科技查新部等机构。公司主办并公开发行的《暖通空调》、《建筑结构》、《给水排水》、《施工技术》、《建筑经济》、《建筑技艺》（原《建筑技术及设计》）、《城市住宅》、《智能建筑电气技术》八种专业期刊，在建筑领域都具有较高的品牌影响力和权威性。</p>

                            <p>然后写点儿系统介绍……………………</p>
                        </div>
                        <!-- .about_as -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- #content_bottom -->
                <div class="clear"></div>
                <!-- .container_12 -->
            </div>
        </div>
    </div>

</section>
<!-- #main -->

<div class="clear"></div>

<jsp:include page="../common/footer.jsp"/>

</body>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->


<script src="${pageContext.request.contextPath}/static/manage/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>

<script src="${pageContext.request.contextPath}/static/product/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/bootstrap-table.min.js"></script>



<script>
    $(document).ready(function () {
        $("#myController").jFlow({
            controller: ".control", // must be class, use . sign
            slideWrapper: "#jFlowSlider", // must be id, use # sign
            slides: "#slider",  // the div where all your sliding divs are nested in
            selectedWrapper: "jFlowSelected",  // just pure text, no sign
            width: "984px",  // this is the width for the content-slider
            height: "480px",  // this is the height for the content-slider
            duration: 400,  // time in miliseconds to transition one slide
            prev: ".slidprev", // must be class, use . sign
            next: ".slidnext", // must be class, use . sign
            auto: true
        });
    });
    <%--$(document).ready(function () {--%>
    <%--    $('#sortCondition').val('<%=sort_condition%>');--%>
    <%--    $('#sortWay').val('<%=sort_way%>');--%>
    <%--    $("button").click(function () {--%>
    <%--        $(this).addClass('click')--%>
    <%--    });--%>
    <%--});--%>
    var tableColumns = [
        {field: "pic", width: "300%", align: "center", title: "设备图片", formatter: function (value, row, index) {
                var image =  '<div ><a href="${pageContext.request.contextPath}/toProductPage?url=product_info&product_id=' + row.id + '">'+
                    '<img src=' + value + ' style="width: 280px;height: 220px; margin: auto" title=""/></a></div><h3 class="title" style="height: 5px;"><div style="font-size: 20px;">' + row.name + '</div></h3>'+
                // '<div class="cart">'+
                    // '<div class="price" style="width: 120px">'+
                    //     '<div class="vert">'+
                    //         '<div class="price_new">'+
                    //             '价格：' + row.price + '万元'+
                    //         '</div>'+
                    //         '<div class="price_new">'+
                    //             '使用寿命：' + row.life + '年'+
                    //         '</div>'+
                    //         '<div class="price_new">'+
                    //             '清理周期：' + row.clear_cycle + '个月' +
                    //         '</div>'+
                    //     '</div>'+
                    // '</div>'+
               '</div>';
                return image;
            }
        },
        {field: 'price', title: '价格', sortable: true},
        {field: 'life', title: '使用寿命', sortable: true},
        {field: 'clear_cycle', title: '清理周期', sortable: true}
    ];
    var product_list = []
    <% for(int i=0; i<productList.size();i++){%>
        var product = {};
        product.id = "<%=productList.get(i).getId()%>";
        product.name = "<%=productList.get(i).getProductName()%>";
        product.price = <%=productList.get(i).getProductParameters().getPrice()%>;
        product.life = <%=productList.get(i).getProductParameters().getServiceLife()%>
        product.clear_cycle =  <%=productList.get(i).getProductParameters().getCleanupCycle()%>
        <% String firstPicPath = productList.get(i).getPicsPath().split(";")[0];%>
        product.pic = "<%=basePath+firstPicPath%>"
        product_list.push(product)
    <%}%>
    $('#bootstrap-data-table').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格
    console.log(product_list)
    $('#bootstrap-data-table').bootstrapTable({//表格初始化
        columns : tableColumns,
        data : product_list,
        showRefresh : false,
        showToggle : false,
        pageSize: 4, //每页3条
        pageNumber: 1,  //第1页
        cache: false,   //不缓存
        striped: true,
        pagination: true,
        sidePagination: 'client',
        queryParams : function(params) {
            return {
                // 说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                limit : params.limit,
                offset : params.offset
            };
        },
    });
</script>

<%--排序--%>
<%--<script>--%>
<%--    function sort() {--%>
<%--        let data = {};--%>
<%--        data["sortBy"] = $('#sortCondition').val();--%>
<%--        data["desc"] = $('#sortWay').val();--%>
<%--        data["list"] = '${list}';--%>

<%--        Post("${pageContext.request.contextPath}/product/sort", data);--%>
<%--    }--%>
<%--</script>--%>
</html>
