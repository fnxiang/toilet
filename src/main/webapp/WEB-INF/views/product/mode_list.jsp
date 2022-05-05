<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO" %>
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



</head>
<body>
<jsp:include page="product_banner.jsp"/>
<%
    String sort_condition = "price";
    String sort_way = "false";
    if (request.getAttribute("sort_condition")!=null) {
        sort_condition = request.getAttribute("sort_condition").toString();
    }
    if (request.getAttribute("sort_way")!=null) {
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

<div class="clear"></div>

<div class="clear"></div>

<section id="main" class="home">
    <div class="container_12">
        <div class="clear"></div>

        <div id="content" class="grid_12">



            <div class="c_header">
                <div class="grid_5">
                    <h2 onclick="">模式搜索结果</h2>
                </div>
                <div class="grid_2">
                    <select class="grid_2" name="sortCondition" id="sortCondition">
                        <option value="0">节水节能性</option>
                        <option value="1">技术适用性</option>
                        <option value="2">技术成本</option>
                        <option value="3">资源化利用</option>
                        <option value="4">环境卫生性</option>
                        <option value="5">便利舒适性</option>
                        <option value="6">综合</option>
                    </select>
                </div>
                <div class="grid_2">
                    <select class="grid_2" name="sortWay" id="sortWay">
                        <option value="0">升序</option>
                        <option value="1">降序</option>
                    </select>
                </div>
                <div class="grid_2">
                    <button class="grid_2" onclick="sortByName()">应用</button>
                </div>
                <!-- .grid_10 -->


            </div>





            <%List<ToiletPatternDTO> results = (List<ToiletPatternDTO>) request.getAttribute("patternList");%>
            <div class="listing_product grid_12">
                <%  if (results != null) {
                    for (ToiletPatternDTO patternDTO : results) {%>
                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content" style="border-right-width: 0px; height: 80px;">
                            <a href="javascript:window.location.href='${pageContext.request.contextPath}/toProductPage?url=product_results'">
                                <h3 class="title"><%=patternDTO.getPatternType()%></h3>
                            </a>
                            <a class="more"
                               href="javascript:window.location.href='${pageContext.request.contextPath}/toProductPage?url=product_results&patternId=<%=patternDTO.getId()%>'">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <%}} else {%>
                    <h2>暂无搜索结果</h2>
                <%}%>



                <div class="clear"></div>
            </div>
            <!-- .listing_product -->

            <div class="clear"></div>

            <div class="pagination">
                <ul>
                    <li class="prev"><span>←</span></li>
                    <li class="curent"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><span>...</span></li>
                    <li><a href="#">100</a></li>
                    <li class="next"><a href="#">→</a></li>
                </ul>
            </div>
            <!-- .pagination -->
        </div>

        <div class="clear"></div>

    </div>
    <!-- .container_12 -->
</section>
<!-- #main -->
<!-- #main -->

<div class="clear"></div>

<footer>
    <div class="f_navigation">
        <div class="container_12">
            <div class="grid_4">
                <h3>联系我们</h3>
                <ul class="f_contact">
                    <li>北京市西城区德胜门外大街36号A座中国建设科技集团</li>
                    <li>010-57700800</li>
                    <li>cag@cadg.cn</li>
                </ul>
                <!-- .f_contact -->
            </div>
            <!-- .grid_3 -->

            <div class="grid_4">
                <h3>预留位置</h3>
                <nav class="f_menu">
                    <ul>
                        <li><a href="#">About As</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">如果需要的话，未来放一些必要信息，不需要就删了这部分即可</a></li>
                    </ul>
                </nav>
                <!-- .private -->
            </div>
            <!-- .grid_3 -->


            <div class="grid_4">
                <h3>预留位置</h3>
                <nav class="f_menu">
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Order History</a></li>
                        <li><a href="#">Wish List</a></li>
                        <li><a href="#">Newsletter</a></li>
                    </ul>
                </nav>
                <!-- .private -->
            </div>
            <!-- .grid_3 -->

            <div class="clear"></div>
        </div>
        <!-- .container_12 -->
    </div>
    <!-- .f_navigation -->

    <div class="f_info">
        <div class="container_12">
            <div class="grid_9">
                <p class="copyright">Copyright &copy; 亚太建设科技信息研究院</p>
            </div>
            <!-- .grid_6 -->

            <div class="grid_3">
                <div class="soc">
                    Designed by Amose
                </div>
                <!-- .soc -->
            </div>
            <!-- .grid_6 -->

            <div class="clear"></div>
        </div>
        <!-- .container_12 -->
    </div>
    <!-- .f_info -->
</footer>

</body>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>

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
</script>
<script>
    $(function () {
        $('#list_product').carouFredSel({
            prev: '#prev_c1',
            next: '#next_c1',
            auto: false
        });
        $('#list_product2').carouFredSel({
            prev: '#prev_c2',
            next: '#next_c2',
            auto: false
        });
        $(window).resize();
    });
</script>
<script>
    $(document).ready(function () {
        $("button").click(function () {
            $(this).addClass('click')
        });
    })

    $(document).ready(function () {
        $('#sortCondition').val('<%=sort_condition%>');
        $('#sortWay').val('<%=sort_way%>');
        $("button").click(function () {
            $(this).addClass('click')
        });
    })
</script>
<!-- /Added by HTTrack -->
<script>


    function productSearch() {

        var XHR = new XMLHttpRequest();

        var data = new FormData();

        var myselect = document.getElementById("guige_select"); //规格
        var index = myselect.selectedIndex;
        data.append("standard_select", encodeURI(myselect.options[index].text));

        //myselect.options[index].value;
        myselect = document.getElementById("caizhi_select"); //材质
        index = myselect.selectedIndex;
        data.append("texture_select", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("life_select"); //使用寿命
        index = myselect.selectedIndex;
        data.append("life_select", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("price_select"); //价格（万元）
        index = myselect.selectedIndex;
        data.append("price_select", encodeURI(myselect.options[index].text));

        myselect = document.getElementById("clean_select"); //清理周期
        index = myselect.selectedIndex;
        data.append("clean_select", encodeURI(myselect.options[index].text));
        //
        // // 建立我们的请求
        // XHR.open('POST', '/toilet/search/product');
        //
        // // 最后，发送我们的数据。
        // XHR.send(data);

        $.ajax({
            url: "/toilet/search/product",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result) {

                } else {
                    alert("error");
                }
            }
        });

    }

    function modeSearch() {

        var data = new FormData();

        var myselect = document.getElementById("wendu_select"); //温度条件
        var index = myselect.selectedIndex;
        data.append("wendu_select", myselect.options[index].text);

        myselect = document.getElementById("water_select"); //水资源条件
        index = myselect.selectedIndex;
        data.append("water_select", myselect.options[index].text);

        var mycheckbox = document.getElementsByName("dixing_check"); //地形条件
        var check_val = [];
        for (k in mycheckbox) {
            if (mycheckbox[k].checked)
                check_val.push(mycheckbox[k].value);
        }
        data.append("dixing_check", check_val);

        mycheckbox = document.getElementsByName("diliweizhi_check"); //地理位置条件
        check_val = [];
        for (k in mycheckbox) {
            if (mycheckbox[k].checked)
                check_val.push(mycheckbox[k].value);
        }
        data.append("diliweizhi_check", check_val);

        mycheckbox = document.getElementsByName("shengtai_check"); //生态限制条件
        check_val = [];
        for (k in mycheckbox) {
            if (mycheckbox[k].checked)
                check_val.push(mycheckbox[k].value);
        }
        data.append("shengtai_check", check_val);

        myselect = document.getElementById("renkou_select"); //人口密集程度
        index = myselect.selectedIndex;
        data.append("renkou_select", myselect.options[index].text);

        myselect = document.getElementById("yetaifei_select"); //可形成液态肥
        index = myselect.selectedIndex;
        data.append("yetaifei_select", myselect.options[index].text);

        myselect = document.getElementById("wushuichuli_select"); //需要具有完整城镇污水处理系统
        index = myselect.selectedIndex;
        data.append("wushuichuli_select", myselect.options[index].text);

        myselect = document.getElementById("wushuiguandao_select"); //需要具有污水管道
        index = myselect.selectedIndex;
        data.append("wushuiguandao_select", myselect.options[index].text);

        myselect = document.getElementById("zhaoqi_select"); //需要具有沼气利用工程
        index = myselect.selectedIndex;
        data.append("zhaoqi_select", myselect.options[index].text);

        myselect = document.getElementById("wushuihunhe_select"); //可以与其他生活污水混合处理
        index = myselect.selectedIndex;
        data.append("wushuihunhe_select", myselect.options[index].text);

        myselect = document.getElementById("yibingchuli_select"); //可以与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
        index = myselect.selectedIndex;
        data.append("yibingchuli_select", myselect.options[index].text);


        $.ajax({
            url: "/toilet/search/mode",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result) {
                    location.href = "/toilet/admin/index";
                } else {
                    alert("error");
                }
            }
        });

    }

</script>
</html>
