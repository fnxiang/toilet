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
    </script>

</head>
<body>
<div class="container_12">
    <div id="top">
        <div class="grid_5">
            <div class="phone_top">
                联系我们 +86 188 1234 5678
            </div>
            <!-- .phone_top -->
        </div>
        <!-- .grid_3 -->

        <div class="grid_7">
            <div class="welcome">
                欢迎来访，你可以 <a href="javascript:window.location.href='${pageContext.request.contextPath}/login'">登录</a> 或者
                <a href="javascript:window.location.href='${pageContext.request.contextPath}/register_company'">创建账户</a>.
            </div>
            <!-- .welcome -->
        </div>
        <!-- .grid_6 -->


    </div>
    <!-- #top -->

    <div class="clear"></div>

    <header id="branding">
        <div class="grid_3">
            <hgroup>
                <h1 id="site_logo"><a href="#" title=""><img
                        src="${pageContext.request.contextPath}/static/product/res/logo.png" width="75%"
                        alt="Online Store Theme Logo"/></a></h1>

                <h2 id="site_description">这是放标语的地方</h2>
            </hgroup>
        </div>
        <!-- .grid_3 -->

        <div class="grid_3">
            <form class="search">
                <input type="text" name="search" class="entry_form" value="" placeholder="Search entire store here..."/>
            </form>
        </div>
        <!-- .grid_3 -->

        <div class="grid_6">


            <nav class="private">
                <ul>
                    <li><a href="javascript:void(0)" onclick="product_search_action()">产品高级搜索</a></li>
                    <li class="separator">|</li>
                    <li><a href="javascript:void(0)" onclick="model_search_action()">模式高级搜索</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/company/index">我的账户</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/register_company">注册</a></li>
                </ul>
            </nav>
            <!-- .private -->
        </div>
        <!-- .grid_6 -->
    </header>
    <!-- #branding -->
    <div id="product_search" class="grid_12" style="margin-bottom: 20px;  border:1px solid #59b7c2; display: none">
        <form class="search">
            <div class="grid_12">
                <label class="search_grid_4"> 规格:
                    <select name="guige_select" id="guige_select" class="form-control">
                        <option value="0">A.≤0.5</option>
                        <option value="1">B.0.6~10</option>
                        <option value="2">C.11~25</option>
                        <option value="3">D.26~50</option>
                        <option value="4">E.51~100</option>
                        <option value="5">F.100以上</option>
                    </select>
                </label>
                <label class="search_grid_4">材质:
                    <select name="caizhi_select" id="caizhi_select" class="form-control">
                        <option value="0">A.玻璃钢</option>
                        <option value="1">B.PP</option>
                        <option value="2">C.PE</option>
                        <option value="3">D.预制钢筋混凝土</option>
                        <option value="4">E.其他</option>
                    </select></label>
                <label class="search_grid_4">使用寿命:
                    <select name="life_select" id="life_select" class="form-control">
                        <option value="0">A.50年以内</option>
                        <option value="1">B.50年及以上</option>
                    </select></label>
            </div>
            <div class="grid_12" style="margin-top: 10px;">
                <label class="search_grid_4">价格（万元）:
                    <select name="price_select" id="price_select" class="form-control">
                        <option value="0">A.0.5以内</option>
                        <option value="1">B.0.5~1</option>
                        <option value="2">C.1~1.5</option>
                        <option value="3">D.1.5~2</option>
                        <option value="4">E.2以上</option>
                    </select>
                </label>
                <label class="search_grid_4">清理周期:
                    <select name="clean_select" id="clean_select" class="form-control">
                        <option value="0">A.≤3个月</option>
                        <option value="1">B.4~6个月</option>
                        <option value="2">C.7~12个月</option>
                        <option value="3">D.12个月及以上</option>
                    </select></label>
            </div>
            <div class="grid_12" align="center" style="margin-top: 10px;">
                <button type="button" style="width: 300px; margin-bottom: 5px" onclick="productSearch()">搜索</button>
            </div>
        </form>
    </div>

    <div class="grid_12" id="model_search" style="margin-bottom: 20px; border:1px solid #59b7c2; display: none">
        <form class="search">

            <div class="grid_12">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">自然环境条件:</label>
            </div>


            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">温度条件:
                    <select name="wendu_select" id="wendu_select" class="form-control">
                        <option value="0">高寒</option>
                        <option value="1">普通</option>
                        <option value="2">无限制</option>
                    </select></label>

                <label class="grid_4">水资源条件:
                    <select name="water_select" id="water_select" class="form-control">
                        <option value="0">缺水</option>
                        <option value="1">良好</option>
                        <option value="2">无限制</option>
                    </select></label>
            </div>


            <div class="grid_12">
                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>地形条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="dixing_check" value="山区"
                                                                  style="margin-bottom:5px;"/>山区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="dixing_check" value="丘陵"
                                                                  style="margin-bottom:5px;"/>丘陵
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="dixing_check" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>

                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>地理位置条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="diliweizhi_check" value="城市近郊"
                                                                  style="margin-bottom:5px;"/>城市近郊
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="diliweizhi_check" value="城中村"
                                                                  style="margin-bottom:5px;"/>城中村
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="diliweizhi_check" value="中心城镇地区"
                                                                  style="margin-bottom:5px;"/>中心城镇地区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="diliweizhi_check" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>

                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>生态限制条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="shengtai_check" value="生态保护区"
                                                                  style="margin-bottom:5px;"/>生态保护区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="shengtai_check" value="水源保护区"
                                                                  style="margin-bottom:5px;"/>水源保护区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="shengtai_check" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>
            </div>


            <div class="grid_12">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">人文因素:</label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">人口密集程度:
                    <select name="renkou_select" id="renkou_select" class="form-control">
                        <option value="0">聚集</option>
                        <option value="1">分散</option>
                        <option value="2">一般</option>
                        <option value="3">无限制</option>
                    </select></label>

                <label class="grid_4">可形成液态肥:
                    <select name="yetaifei_select" id="yetaifei_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">管网条件:</label>
            </div>


            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">需要具有完整城镇污水处理系统:
                    <select name="wushuichuli_select" id="wushuichuli_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">无限制</option>
                    </select></label>

                <label class="grid_4">需要具有污水管道:
                    <select name="wushuiguandao_select" id="wushuiguandao_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">资源化利用:</label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_3">需要具有沼气利用工程:
                    <select name="zhaoqi_select" id="zhaoqi_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">无限制</option>
                    </select></label>

                <label class="grid_4">可以与其他生活污水混合处理:
                    <select name="wushuihunhe_select" id="wushuihunhe_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">均可</option>
                    </select></label>

                <label>可以与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理:
                    <select name="yibingchuli_select" id="yibingchuli_select" class="form-control">
                        <option value="0">是</option>
                        <option value="1">否</option>
                        <option value="2">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" align="center" style="margin-top: 10px;">
                <button type="button" style="width: 300px; margin-bottom: 5px" onclick="modeSearch()">搜索</button>
            </div>
        </form>
    </div>
</div>
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

<!--  <div class="container_12">-->
<!--    <div class="grid_12">-->
<!--        <div class="slidprev"><span>Prev</span></div>-->
<!--        <div class="slidnext"><span>Next</span></div>-->
<!--        <div id="slider">-->
<!--          <div id="slide1">-->
<!--            <img src="${pageContext.request.contextPath}/static/product/res/placeholder.jpg" alt="" title="" />-->
<!--            <div class="slid_text">-->
<!--              <h3 class="slid_title"><span>首页图片需要单独制作</span></h3>-->
<!--              <p><span>首页轮播图片需要单独制作</span></p>-->
<!--              <p><span>这里放几张占位图</span></p>-->
<!--              <p><span>图片尺寸为984×480像素</span></p>-->
<!--            </div>-->
<!--          </div>-->

<!--          <div id="slide2">-->
<!--            <img src="${pageContext.request.contextPath}/static/product/res/placeholder.jpg" alt="" title="" />-->
<!--            <div class="slid_text">-->
<!--              <h3 class="slid_title"><span>首页图片需要单独制作</span></h3>-->
<!--              <p><span>首页轮播图片需要单独制作</span></p>-->
<!--              <p><span>这里放几张占位图</span></p>-->
<!--              <p><span>图片尺寸为984×480像素</span></p>-->
<!--            </div>-->
<!--          </div>-->

<!--          <div id="slide3">-->
<!--            <img src="${pageContext.request.contextPath}/static/product/res/placeholder.jpg" alt="" title="" />-->
<!--            <div class="slid_text">-->
<!--              <h3 class="slid_title"><span>首页图片需要单独制作</span></h3>-->
<!--              <p><span>首页轮播图片需要单独制作</span></p>-->
<!--              <p><span>这里放几张占位图</span></p>-->
<!--              <p><span>图片尺寸为984×480像素</span></p>-->
<!--            </div>-->
<!--          </div>-->
<!--        </div>&lt;!&ndash; .slider &ndash;&gt;-->
<!--        <div id="myController">-->
<!--          <div class="control"><span>1</span></div>-->
<!--          <div class="control"><span>2</span></div>-->
<!--          <div class="control"><span>3</span></div>-->
<!--        </div>-->


<!--    </div>&lt;!&ndash; .grid_12 &ndash;&gt;-->
<!--  </div>&lt;!&ndash; .container_12 &ndash;&gt;-->
<div class="clear"></div>

<section id="main" class="home">
    <div class="container_12">
        <div class="clear"></div>

        <div id="content" class="grid_12">
            <h1 class="page_title">模式搜索结果</h1>


            <div class="listing_product grid_12">
                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>
                            <a class="more" href="product_page.html">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>
                            <a class="more" href="product_page.html">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>
                            <a class="more" href="product_page.html">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>
                            <a class="more" href="product_page.html">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">

                    <div class="grid_10">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>
                            <a class="more" href="product_page.html">查看产品列表</a>
                        </div>
                        <!-- .my_entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->


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
<!-- /Added by HTTrack -->
<script>
    function product_search_action() {
        console.log("show product search");
        document.getElementById('model_search').style.display = "none";
        if (document.getElementById('product_search').style.display == "none") {
            document.getElementById('product_search').style.display = "";
        } else {
            document.getElementById('product_search').style.display = "none";
        }


    }

    function model_search_action() {
        document.getElementById('product_search').style.display = "none";
        if (document.getElementById('model_search').style.display == "none") {
            document.getElementById('model_search').style.display = "";
        } else {
            document.getElementById('model_search').style.display = "none";
        }
    }


    function productSearch() {

        var data = new FormData();

        var myselect = document.getElementById("guige_select"); //规格
        var index = myselect.selectedIndex;
        data.append("guige_select", myselect.options[index].text);

        //myselect.options[index].value;
        myselect = document.getElementById("caizhi_select"); //材质
        index = myselect.selectedIndex;
        data.append("caizhi_select", myselect.options[index].text);

        myselect = document.getElementById("life_select"); //使用寿命
        index = myselect.selectedIndex;
        data.append("life_select", myselect.options[index].text);

        myselect = document.getElementById("price_select"); //价格（万元）
        index = myselect.selectedIndex;
        data.append("price_select", myselect.options[index].text);

        myselect = document.getElementById("clean_select"); //清理周期
        index = myselect.selectedIndex;
        data.append("clean_select", myselect.options[index].text);

        $.ajax({
            url: "",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result) {
                    location.href = "";
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
            url: "/toilet/login",
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