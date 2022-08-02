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
    String productType = "完整下水道水冲式厕所";
    if (request.getAttribute("sort_condition") != null) {
        sort_condition = request.getAttribute("sort_condition").toString();
    }
    if (request.getAttribute("sort_way") != null) {
        sort_way = request.getAttribute("sort_way").toString();
    }
    if (request.getAttribute("productType") != null) {
        productType = request.getAttribute("productType").toString();
    }
%>
<!-- .container_12 -->

<div class="clear"></div>

<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li id="tongjitubiao" class="curent">
                    <a href="#" >统计图表</a>
                    <ul class="sub">
                    <li class="curent" id="l1"><a href="javascript:void(0)" onclick="xianshi1()">产品数量分布统计图</a></li>
                    <li id="l2"><a href="javascript:void(0)" onclick="xianshi2()">产品录入数量地区分布统计图</a></li>
                    <li id="l3"><a href="javascript:void(0)" onclick="xianshi3()">普通用户分布省份统计图</a></li>
                    <li id="l4"><a href="javascript:void(0)" onclick="xianshi4()">企业注册地区分布统计图</a></li>
                    </ul>
                    </li>
                    <li id="l5"><a href="javascript:void(0)" onclick="chanpin()">产品列表</a></li>
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

        <div class="carousel" style="display: none" id="chanpinzhanshi">
            <div class="c_header">
                <div class="grid_6">
                    <h2>产品展示</h2>
                </div>
                <div class="grid_2">

                    <select name="productselect" class="grid_2" id="productselect">
                        <option value="双瓮漏斗式厕所">双瓮漏斗式厕所</option>
                        <option value="化粪池式厕所">化粪池式厕所</option>
                        <option value="完整下水道水冲式厕所">完整下水道水冲式厕所</option>
                        <option value="三联沼气池式厕所">三联沼气池式厕所</option>
                        <option value="复合生物反应微水冲厕所">复合生物反应微水冲厕所</option>
                        <option value="真空负压厕所">真空负压厕所</option>
                        <option value="多级生化组合电催化氧化厕所">多级生化组合电催化氧化厕所</option>
                        <option value="膜生物反应器（MBR）厕所">膜生物反应器（MBR）厕所</option>
                        <option value="生态旱厕">生态旱厕</option>
                        <option value="双坑交替式厕所">双坑交替式厕所</option>
                        <option value="粪尿分集式厕所">粪尿分集式厕所</option>
                        <option value="泡沫封堵液">泡沫封堵液</option>
                    </select>
                </div>
                <div class="grid_1">
                    <select class="grid_1" name="sortCondition" id="sortCondition">
                        <option value="price">价格</option>
                        <option value="service_life">使用寿命</option>
                        <option value="clean_cycle">清理周期</option>
                    </select>
                </div>
                <div class="grid_1">
                    <select class="grid_1" name="sortWay" id="sortWay">
                        <option value="false">升序</option>
                        <option value="true">降序</option>
                    </select>
                </div>
                <div class="grid_1">
                    <button class="grid_1" onclick="sort()">应用</button>
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
        <div class="carousel" id="tubiaozhanshi">

        <div class="list_carousel">
            <div style="width: 100%;height: 100%; margin: auto">
                <div id="map1" style="width: 100vh;height: 100vh;  margin: auto"></div>
                <div id="map2" style="width: 150vh;height: 70vh; margin: auto; display: none; "></div>
                <div id="map3" style="width: 100vh;height: 200vh; margin: auto; display: none; "></div>
                <div id="map4" style="width: 100vh;height: 150vh; margin: auto; display: none; "></div>
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

<script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>
<script src="${pageContext.request.contextPath}/static/product/chart/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/chart/map/js/china.js"></script>


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
        $('#productselect').val('<%=productType%>');
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
<%--产品数量图表--%>
<script>
    function randomData() {
        return Math.round(Math.random()*500);
    }
    var mydata = [
        {name: '北京',value: '100' },{name: '天津',value: randomData() },
        {name: '上海',value: randomData() },{name: '重庆',value: randomData() },
        {name: '河北',value: randomData() },{name: '河南',value: randomData() },
        {name: '云南',value: randomData() },{name: '辽宁',value: randomData() },
        {name: '黑龙江',value: randomData() },{name: '湖南',value: randomData() },
        {name: '安徽',value: randomData() },{name: '山东',value: randomData() },
        {name: '新疆',value: randomData() },{name: '江苏',value: randomData() },
        {name: '浙江',value: randomData() },{name: '江西',value: randomData() },
        {name: '湖北',value: randomData() },{name: '广西',value: randomData() },
        {name: '甘肃',value: randomData() },{name: '山西',value: randomData() },
        {name: '内蒙古',value: randomData() },{name: '陕西',value: randomData() },
        {name: '吉林',value: randomData() },{name: '福建',value: randomData() },
        {name: '贵州',value: randomData() },{name: '广东',value: randomData() },
        {name: '青海',value: randomData() },{name: '西藏',value: randomData() },
        {name: '四川',value: randomData() },{name: '宁夏',value: randomData() },
        {name: '海南',value: randomData() },{name: '台湾',value: randomData() },
        {name: '香港',value: randomData() },{name: '澳门',value: randomData() }
    ];
    var optionMap = {
        title: {
            text: '产品数量分布统计图',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item'
        },

        //左侧小导航图标
        visualMap: {
            show : true,
            x: 'left',
            y: 'center',
            pieces: [
                {min: 500, max:600},{min: 400, max: 500},
                {min: 300, max: 400},{min: 200, max: 300},
                {min: 100, max: 200},{min: 0, max: 100},
            ],
            color: ['#5475f5', '#9feaa5', '#85daef','#74e2ca', '#e6ac53', '#9fb5ea']
        },

        //配置属性
        series: [{
            name: '数据',
            type: 'map',
            mapType: 'china',
            roam: true,
            label: {
                normal: {
                    show: true  //省份名称
                },
                emphasis: {
                    show: false
                }
            },
            data:mydata  //数据
        }]
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('map1'));

    //使用制定的配置项和数据显示图表
    myChart.setOption(optionMap);
</script>

<%--柱状图--%>
<script>
    var myChart2 = echarts.init(document.getElementById('map2'));
    var option2;

    option2 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                // Use axis to trigger tooltip
                type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
            }
        },
        legend: {},
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: ['东北地区',
                '华东地区',
                '华北地区',
                '华中地区',
                '华南地区',
                '西南地区',
                '西北地区']
        },
        series: [
            {
                name: '双瓮漏斗式厕所',
                type: 'bar',
                stack: 'total',
                label: {
                    show: true
                },
                emphasis: {
                    focus: 'series'
                },
                data: [320, 302, 301, 334, 390, 330, 320]
            },
            {
                name: '化粪池式厕所',
                type: 'bar',
                stack: 'total',
                label: {
                    show: true
                },
                emphasis: {
                    focus: 'series'
                },
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '完整下水道水冲式厕所',
                type: 'bar',
                stack: 'total',
                label: {
                    show: true
                },
                emphasis: {
                    focus: 'series'
                },
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '三联沼气池式厕所',
                type: 'bar',
                stack: 'total',
                label: {
                    show: true
                },
                emphasis: {
                    focus: 'series'
                },
                data: [150, 212, 201, 154, 190, 330, 410]
            },
            {
                name: '复合生物反应微水冲厕所',
                type: 'bar',
                stack: 'total',
                label: {
                    show: true
                },
                emphasis: {
                    focus: 'series'
                },
                data: [820, 832, 901, 934, 1290, 1330, 1320]
            }, {
                    name: '真空负压厕所',
                        type: 'bar',
                    stack: 'total',
                    label: {
                    show: true
                },
            emphasis: {
                focus: 'series'
            },
            data: [820, 832, 901, 934, 1290, 1330, 1320]
        },
    {
        name: '多级生化组合电催化氧化厕所',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    },
    {
        name: '膜生物反应器（MBR）厕所',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    },
    {
        name: '生态旱厕',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    },
    {
        name: '双坑交替式厕所',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    },
    {
        name: '粪尿分集式厕所',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    },
    {
        name: '泡沫封堵液',
            type: 'bar',
        stack: 'total',
        label: {
        show: true
    },
        emphasis: {
            focus: 'series'
        },
        data: [820, 832, 901, 934, 1290, 1330, 1320]
    }
        ]
    };

    option2 && myChart2.setOption(option2);
</script>

<%--柱状图--%>
<script>
        //初始化图标
        var myChart3 = echarts.init(document.getElementById('map3'));
        //Y轴的数据，和数据值位置一一对应
        var cate = [
           '北京','天津','上海','重庆',
            '河北','河南','云南','辽宁',
            '黑龙江','湖南','安徽','山东',
            '新疆','江苏','浙江','江西',
            '湖北','广西','甘肃','山西',
            '内蒙古','陕西','吉林','福建',
            '贵州','广东','青海','西藏',
            '四川','宁夏','海南','台湾',
            '香港','澳门',
        ];
        //数据值，顺序和Y轴的名字一一对应
        var barData = [
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),randomData(),randomData(),
            randomData(),randomData(),

        ];
        var option3 = {

            title: {
                text: '普通用户分布省份统计图',
                subtext: '',
                x:'center'
            },
            tooltip: {

                trigger: "axis",
                axisPointer: {

                    type: "shadow",
                },
            },
            //图表位置
            grid: {

                left: "3%",
                right: "4%",
                bottom: "3%",
                containLabel: true,
            },
            //X轴
            xAxis: {

                type: "value",
                axisLine: {

                    show: false,
                },
                axisTick: {

                    show: false,
                },
                //不显示X轴刻度线和数字
                splitLine: {
                    show: false },
                axisLabel: {
                    show: false },
            },
            yAxis: {

                type: "category",
                data: cate,
                //升序
                inverse: true,
                splitLine: {
                    show: false },
                axisLine: {

                    show: false,
                },
                axisTick: {

                    show: false,
                },
                //key和图间距
                offset: 10,
                //动画部分
                animationDuration: 300,
                animationDurationUpdate: 300,
                //key文字大小
                nameTextStyle: {

                    fontSize: 5,
                },
            },
            series: [
                {

                    //柱状图自动排序，排序自动让Y轴名字跟着数据动
                    realtimeSort: true,
                    name: "数量",
                    type: "bar",
                    data: barData,
                    barWidth: 14,
                    barGap: 10,
                    smooth: true,
                    valueAnimation: true,
                    //Y轴数字显示部分
                    label: {

                        normal: {

                            show: true,
                            position: "right",
                            valueAnimation: true,
                            offset: [5, -2],
                            textStyle: {

                                color: "#333",
                                fontSize: 13,
                            },
                        },
                    },
                    itemStyle: {

                        emphasis: {

                            barBorderRadius: 7,
                        },
                        //颜色样式部分
                        normal: {

                            barBorderRadius: 7,
                            color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                                {
                                    offset: 0, color: "#3977E6" },
                                {
                                    offset: 1, color: "#37BBF8" },
                            ]),
                        },
                    },
                },
            ],
            //动画部分

            animationDuration: 0,
            animationDurationUpdate: 3000,
            animationEasing: "linear",
            animationEasingUpdate: "linear",
        };
        myChart3.setOption(option3);
        //图表大小变动从新渲染，动态自适应
        window.addEventListener("resize", function () {

            myChart3.resize();
        });
</script>
<%--饼图--%>
<script>
    var chartDom = document.getElementById('map4');
    var myChart4 = echarts.init(chartDom);
    var option4;

    setTimeout(function () {
        option4 = {
            legend: {},
            tooltip: {
                trigger: 'axis',
                showContent: false
            },
            dataset: {
                source: [
                    [
                        'terrian',
                        '东北地区',
                        '华东地区',
                        '华北地区',
                        '华中地区',
                        '华南地区',
                        '西南地区',
                        '西北地区'
                    ],
                    [
                        '化粪池式厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '完整下水道水冲式厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '三联沼气池式厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '复合生物反应微水冲厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '真空负压厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '多级生化组合电催化氧化厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '膜生物反应器（MBR）厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '生态旱厕',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '双坑交替式厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '粪尿分集式厕所',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ],
                    [
                        '泡沫封堵液',
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData(),
                        randomData()
                    ]
                ]
            },
            xAxis: { type: 'category' },
            yAxis: { gridIndex: 0 },
            grid: { top: '55%' },
            series: [
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'line',
                    smooth: true,
                    seriesLayoutBy: 'row',
                    emphasis: { focus: 'series' }
                },
                {
                    type: 'pie',
                    id: 'pie',
                    radius: '30%',
                    center: ['50%', '25%'],
                    emphasis: {
                        focus: 'self'
                    },
                    label: {
                        formatter: '{b}: {@东北地区} ({d}%)'
                    },
                    encode: {
                        itemName: 'terrian',
                        value: '东北地区',
                        tooltip: '东北地区'
                    }
                }
            ]
        };
        myChart4.on('updateAxisPointer', function (event) {
            const xAxisInfo = event.axesInfo[0];
            if (xAxisInfo) {
                const dimension = xAxisInfo.value + 1;
                myChart4.setOption({
                    series: {
                        id: 'pie',
                        label: {
                            formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                        },
                        encode: {
                            value: dimension,
                            tooltip: dimension
                        }
                    }
                });
            }
        });
        myChart4.setOption(option4);
    });

    option4 && myChart4.setOption(option4);

</script>
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
        data["productSelect"] = $('#productselect').val();
        Post("${pageContext.request.contextPath}/toProductPage?url=next", data);
    }
    function findpage(pageindex) {
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["pageIndex"] = pageindex;
        data["productSelect"] = $('#productselect').val();
        Post("${pageContext.request.contextPath}/toProductPage?url=next", data);
    }
    function getnextpage() {
        data["sortBy"] = $('#sortCondition').val();
        data["isDesc"] = $('#sortWay').val();
        data["pageIndex"] = pageNow + 1;
        data["productSelect"] = $('#productselect').val();
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
        data["productSelect"] = $('#productselect').val();
        Post("${pageContext.request.contextPath}/product/sort", data);
    }
</script>

<%--切换显示图表--%>
<script>
    function xianshi1(){
        document.getElementById('tongjitubiao').className = 'curent';
        document.getElementById('l5').className = '';
        $('#chanpinzhanshi').css("display","none");
        $('#tubiaozhanshi').css("display","block");
        $('#map1').css("display","block");
        $('#map2').css("display","none");
        $('#map3').css("display","none");
        $('#map4').css("display","none");
    }
    function xianshi2(){
        document.getElementById('tongjitubiao').className = 'curent';
        document.getElementById('l5').className = '';
        $('#chanpinzhanshi').css("display","none");
        $('#tubiaozhanshi').css("display","block");
        $('#map1').css("display","none");
        $('#map2').css("display","block");
        $('#map3').css("display","none");
        $('#map4').css("display","none");
    }
    function xianshi3(){
        document.getElementById('tongjitubiao').className = 'curent';
        document.getElementById('l5').className = '';
        $('#chanpinzhanshi').css("display","none");
        $('#tubiaozhanshi').css("display","block");
        $('#map1').css("display","none");
        $('#map2').css("display","none");
        $('#map3').css("display","block");
        $('#map4').css("display","none");
    }
    function xianshi4(){
        document.getElementById('tongjitubiao').className = 'curent';
        document.getElementById('l5').className = '';
        $('#chanpinzhanshi').css("display","none");
        $('#tubiaozhanshi').css("display","block");
        $('#map1').css("display","none");
        $('#map2').css("display","none");
        $('#map3').css("display","none");
        $('#map4').css("display","block");
    }
    function chanpin(){
        document.getElementById('tongjitubiao').className = '';
        document.getElementById('l5').className = 'curent';
        $('#chanpinzhanshi').css("display","block");
        $('#tubiaozhanshi').css("display","none");
    }

</script>
</html>