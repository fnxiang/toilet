<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="cn.edu.bjtu.toilet.domain.response.ProductQueryResponse" %>
<%@ page import="org.apache.commons.collections4.CollectionUtils" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.*" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/dialog.css">
    <link href="${pageContext.request.contextPath}/static/product/css/grid.css" media="screen" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/static/product/css/style.css" media="screen" rel="stylesheet"
          type="text/css">
    <%--    <link href="${pageContext.request.contextPath}/static/product/css/bootstrap.min.css" rel="stylesheet">--%>

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
                <div class="grid_2">
                    <select class="grid_2" name="sortCondition" id="sortCondition">
                        <option value="price">价格</option>
                        <option value="service_life">使用寿命</option>
                        <option value="cleanCycle">清理周期</option>
                    </select>
                </div>
                <div class="grid_2">
                    <select class="grid_2" name="sortWay" id="sortWay">
                        <option value="false">升序</option>
                        <option value="true">降序</option>
                    </select>
                </div>
                <div class="grid_2">
                    <button class="grid_2" onclick="sort()">应用</button>
                </div>
                <!-- .grid_10 -->


            </div>
            <!-- .c_header -->
            <div id="list_carousel" class="list_carousel">

                <%--                <% List<ToiletProductDTO> productList = (List<ToiletProductDTO>) request.getAttribute("productList");%>--%>
                <% ProductQueryResponse productQueryResponse = (ProductQueryResponse) request.getAttribute("pageResponse");%>
                <% List<ToiletProductDTO> productList = productQueryResponse.getProductDTOList();%>
                <% String path = request.getContextPath();
                    String basePath = request.getScheme() + "://"
                            + request.getServerName() + ":" + request.getServerPort()
                            + path + "/";%>

                <%
                    if (!CollectionUtils.isEmpty(productList)) {
                        for (int i = 0, j; i < Math.ceil(productList.size() / 4.0); i++) {%>
                <ul id="list_product_<%=i%>" class="list_product">
                    <%
                        for (j = i * 4; j < productList.size() && j < 4 * (i + 1); j++) {
                            String firstPicPath = productList.get(j).getPicsPath().split(";")[0];
                    %>
                    <li value="">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a href="${pageContext.request.contextPath}/toProductPage?url=product_info&product_id=<%=productList.get(j).getId()%>"><img
                                        src="<%=basePath+firstPicPath%>"
                                        alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title" style="height: 25px;"><%=productList.get(j).getProductName()%>
                            </h3>

                            <div class="cart">
                                <div class="price" style="width: 120px">
                                    <div class="vert">
                                        <div class="price_new">
                                            价格：<%=productList.get(j).getProductParameters().getPrice()%>元
                                        </div>
                                        <div class="price_new">
                                            使用寿命：<%=productList.get(j).getProductParameters().getServiceLife()%>年
                                        </div>
                                        <div class="price_new">
                                            清理周期：<%=productList.get(j).getProductParameters().getCleanupCycle()%>个月
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <%
                            }
                        }
                    } else {
                    %>
                    <h3>暂无相关产品</h3>
                    <%}%>
                </ul>
                <div class="clear">

                </div>
                <div style="height: 20px;">
                </div>
                <div class="grid_12" style="text-align: center">
                    <div class="page" id="page" style="text-align: center; height: 50px;">
                    </div>
                </div>
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

            <div id="zhuce" style="position: absolute; left: 720px; top: 400px; background: #99999975; height: 100px; display: none">
                <!-- 弹窗遮罩层 -->
                <div class="aclose">
                    <a class="close" href="javascript:choseClose();">&times;</a>
                </div>
                <div class="contain" id="dialog">
                    <a href='${pageContext.request.contextPath}/toBasePage?url=register_final'
                       role="button">企业注册&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <a href='${pageContext.request.contextPath}/toBasePage?url=register_professor'
                       role="button">专家注册
                    </a>
                </div>
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

<script src="${pageContext.request.contextPath}/static/product/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.pagination.js"></script>

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
    $(document).ready(function () {
        $('#sortCondition').val('<%=sort_condition%>');
        $('#sortWay').val('<%=sort_way%>');
    });
</script>
<script>
    $(function () {
        $('#list_product').carouFredSel({
            prev: '#prev_c1',
            next: '#next_c1',
            auto: false
        });
        $(window).resize();
    });
</script>

<%--fixme 换页时upload products failed : null--%>
<%--分页--%>
<script>
    let $page = $('#page');
    let pageNow = <%=productQueryResponse.getCurrentPage()%>;
    let total = <%=productQueryResponse.getMaxPage()%>;
    if (total === 0) {
        total = 1;
    }
    pageSet(total, pageNow);
    let data = {};

    function getprepage() {
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["pageIndex"] = pageNow - 1;
        Post("${pageContext.request.contextPath}/toProductPage?url=next", data);
    }

    function findpage(pageindex) {
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["pageIndex"] = pageindex;
        Post("${pageContext.request.contextPath}/toProductPage?url=next", data);
    }

    function getnextpage() {
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["pageIndex"] = pageNow + 1;
        Post("${pageContext.request.contextPath}/toProductPage?url=next", data);
    }

    $page.on("click", 'label', function (e) {
        let sign = e.target.innerText;
        console.log(e, sign, sign === '...');
        if (sign === '...') {
            let i = pageNow + 5;
            if (i > total) pageNow = total;
            else pageNow = i
        } else {
            let i = pageNow - 5;
            if (i < 1) pageNow = 1;
            else pageNow = i
        }
        pageSet(total, pageNow);
    });
    $page.on("click", 'span', function (e) {
        var pagenow = parseInt(e.target.innerText);
        if (pagenow === pagenow) {
            findpage(pagenow);
            pageSet(total, pagenow);
        } else {
            if(e.target.innerText === '上一页'){
                getprepage();
            }else{
                getnextpage();
            }
        }
    });

    function pageSet(total, pageNow) {
        let i = 1, dom = '';
        let firstDisabled;
        if (pageNow === 1) {
            firstDisabled = 'none';
        } else {
            firstDisabled = ''
        }
        let endDisabled;
        if (pageNow === total) {
            endDisabled = 'none';
        } else {
            endDisabled = '';
        }
        if (firstDisabled === 'none') {
            dom = '<span id="up" style="display: none" class="text">上一页</span>';
        } else {
            dom = '<span id="up" class="text">上一页</span>';
        }

        if (total < 10) {
            while (i <= total || i === 1) {
                let active = pageNow === i ? 'active' : '';
                dom += '<span class="' + active + '">' + i + '</span>';
                i++;
            }
        } else {
            if (pageNow < 4) {
                while (i < 6) {
                    let active = pageNow === i ? 'active' : '';
                    dom += '<span class="' + active + '">' + i + '</span>';
                    i++;
                }
                dom += '<label title="向后5页">...</label><span>' + total + '</span>';
            } else if (pageNow > 3 && pageNow < total - 3) {
                dom += '<span >1</span>';
                dom += '<label title="向前5页">...</label>';
                dom += '<span >' + (pageNow - 2) + '</span>';
                dom += '<span>' + (pageNow - 1) + '</span>';
                dom += '<span class="active">' + pageNow + '</span>';
                dom += '<span>' + (pageNow + 1) + '</span>';
                dom += '<span>' + (pageNow + 2) + '</span>';
                dom += '<label title="向后5页">...</label><span>' + total + '</span>';
            } else {
                dom += '<span id="1">1</span>';
                dom += '<label title="向前5页">...</label>';
                i = total - 4;
                while (i <= total) {
                    let active = pageNow === i ? 'active' : '';
                    dom += '<span class="' + active + '">' + i + '</span>';
                    i++;
                }
            }
        }
        if (endDisabled === 'none') {

            dom += '<span id="down" class="text" style="display: none">下一页</span>';
        } else {
            dom += '<span id="down" class="text">下一页</span>';
        }
        $page.html(dom);
    }
</script>

<%--排序--%>
<script>
    function sort() {
        let data = {};
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["product_search_condition"] = '<%=(String) request.getAttribute("product_search_condition")%>';
        Post("${pageContext.request.contextPath}/product/sort", data);
    }
</script>

</html>
