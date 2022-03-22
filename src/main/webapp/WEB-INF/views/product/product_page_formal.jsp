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

    <title>产品详情</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/product/res/logo.ico">
    <link href="${pageContext.request.contextPath}/static/product/css/style.css" media="screen" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/static/product/css/grid.css" media="screen" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/product/css/jquery.jqzoom.css"
          type="text/css">

    <script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/checkbox.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/radio.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/selectBox.js"></script>
    <script src="${pageContext.request.contextPath}/static/product/js/jquery.jqzoom-core.js"></script>

    <script>
        $(document).ready(function () {
            $('.jqzoom').jqzoom({
                zoomType: 'standard',
                lens: true,
                preloadImages: true,
                alwaysOn: false
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#wrapper_tab a').click(function () {
                if ($(this).attr('class') != $('#wrapper_tab').attr('class')) {
                    $('#wrapper_tab').attr('class', $(this).attr('class'));
                }
                return false;
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
            $('#list_banners').carouFredSel({
                prev: '#ban_prev',
                next: '#ban_next',
                scroll: 1,
                auto: false
            });
            $('#thumblist').carouFredSel({
                prev: '#img_prev',
                next: '#img_next',
                scroll: 1,
                auto: false,
                circular: false,
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
                欢迎来访，你可以 <a href="javascript:window.location.href='${pageContext.request.contextPath}/login'">登录</a> 或者 <a href="javascript:window.location.href='${pageContext.request.contextPath}/register_company'">创建账户</a>.
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
                <h1 id="site_logo"><a href="javascript:window.location.href='${pageContext.request.contextPath}/'" title=""><img
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
                <label class="search_grid_4"> 产品名称: <input type="text" name="search" class="search_btn" value="" placeholder=""/></label>
                <label class="search_grid_4"> 产品类型:
                    <select name="product_select" id="product_select" class="form-control">
                        <option value="0">完整下水道式厕所</option>
                        <option value="1">三格化粪池式厕所</option>
                        <option value="2">双瓮漏斗式厕所</option>
                        <option value="3">三联沼气池式厕所</option>
                        <option value="4">复合生物反应微水冲厕所</option>
                        <option value="5">真空负压厕所</option>
                        <option value="6">多级生化组合电催化氧化厕所</option>
                        <option value="7">膜生物反应器（MBR）厕所</option>
                        <option value="8">堆肥式生态厕所</option>
                        <option value="9">双坑交替式厕所</option>
                        <option value="10">粪尿分集式生态旱厕</option>
                        <option value="11">粪污生态菌发酵</option>
                        <option value="12">可生物降解泡沫冲洗厕所</option>
                        <option value="13">其他类型</option>
                    </select> </label>
                <label class="search_grid_4"> 模式类型: <select name="model_select" id="model_select" class="form-control">
                    <option value="1">收集：集中收集</option>
                    <option value="2">转运：抽排设备</option>
                    <option value="3">处理：无害化处理</option>
                    <option value="4">资源化利用：发酵池</option>
                </select></label>
            </div>
            <div class="grid_12">
                <label class="search_grid_4"> 适用省份:
                    <input type="text" name="search" class="search_btn" value="" placeholder=""/></label>
                <label class="search_grid_4"> 温度范围:
                    <input type="text" name="search" class="search_btn" value="" placeholder=""/></label>
            </div>
            <div class="grid_12" align="center">
                <button type="submit" style="width: 300px; margin-bottom: 5px">搜索</button>
            </div>
        </form>
    </div>

    <div class="grid_12" id="model_search" style="margin-bottom: 20px; border:1px solid #59b7c2; display: none">
        <form class="search">
            <label class="grid_12"> 适用省份:
                <input type="text" name="search" class="search_btn" value="" placeholder=""/></label>
            <div class="grid_12">
                <label class="search_grid_4"> 温度条件:
                    <select name="select" id="temp_select" style="width: 160px" class="form-control">
                        <option value="0">高寒</option>
                        <option value="1">无特殊</option>
                    </select></label>
                <label class="search_grid_4"> 水资源条件:
                    <select name="select" id="water_select" style="width: 160px" class="form-control">
                        <option value="0">缺水</option>
                        <option value="1">良好</option>
                    </select></label>
                <label class="search_grid_4"> 地形条件:
                    <select name="select" id="shape_select" style="width: 160px" class="form-control">
                        <option value="0">平坦</option>
                        <option value="1">山区</option>
                        <option value="2">丘陵</option>
                        <option value="3">无特殊</option>
                    </select></label>
            </div>
            <div class="grid_12">
                <label class="search_grid_4"> 地理位置条件:
                    <select name="select" style="width: 160px" id="locate_select" class="form-control">
                        <option value="0">城市近郊</option>
                        <option value="1">城中村</option>
                        <option value="2">中心城镇地区</option>
                        <option value="3">其他</option>
                    </select></label>
                <label class="search_grid_4"> 生态限制条件:
                    <select name="select" id="eco_select" style="width: 160px" class="form-control">
                        <option value="0">生态保护区</option>
                        <option value="1">水源保护区</option>
                        <option value="2">一般地区</option>
                    </select></label>
            </div>
            <div class="grid_12" align="center">
                <button type="submit" style="width: 300px; margin-bottom: 5px">搜索</button>
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


<section id="main">
    <div class="container_12">


        <div id="content" class="grid_12">
            <h1 class="page_title">三格化粪池</h1>

            <div class="product_page grid_12">
                <div class="grid_4 img_slid" id="products">
                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a href="${pageContext.request.contextPath}/static/product/res/1.png" class="jqzoom"
                               rel='gal1' title="">
                                <img src="${pageContext.request.contextPath}/static/product/res/1.png" height="500px"
                                     width="500px" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <!-- .prev -->

                    <ul class="pagination clearfix" id="thumblist">
                        <li><a class="zoomThumbActive" href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/1.png',largeimage: '${pageContext.request.contextPath}/static/product/res/1.png'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/1.png' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/2.png',largeimage: '${pageContext.request.contextPath}/static/product/res/2.png'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/2.png' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/3.png',largeimage: '${pageContext.request.contextPath}/static/product/res/3.png'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/3.png' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/2.png',largeimage: '${pageContext.request.contextPath}/static/product/res/2.png'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/2.png' alt=""></a></li>
                    </ul>

                </div>
                <!-- .grid_4 -->

                <div class="grid_7">
                    <div class="entry_content">
                        <div class="review">
                            <h5>三格化粪池</h5>
                        </div>
                        <p>三格式化粪池是由三个相互连通的密封粪池组成，粪便由进粪管进入第一池依次顺流到第三池。</p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    价格：
                                </div>
                            </div>
                            <!-- .availability_sku -->

                            <div class="price">
                                <div class="price_new">1.8万元</div>
                            </div>
                            <!-- .price -->
                        </div>
                        <!-- .ava_price -->

                        <div class="block_cart">

                        </div>
                        <!-- .block_cart -->

                    </div>
                    <!-- .entry_content -->

                </div>
                <!-- .grid_5 -->

                <div class="clear"></div>

                <div class="grid_12">
                    <div id="wrapper_tab" class="tab1">
                        <a href="#" class="tab1 tab_link">产品描述</a>
                        <a href="#" class="tab2 tab_link">Reviews</a>
                        <a href="#" class="tab3 tab_link">Custom Tab</a>

                        <div class="clear"></div>

                        <div class="tab1 tab_body">
                            <h4>这个部分未来要填充对产品的描述</h4>

                            <p>Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet. Maecenas
                                tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum adipiscing, eros quis
                                lobortis dictum. Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat
                                volutpat. Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis
                                rhoncus lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate
                                pulvinar adipiscing.</p>
                            <ul>
                                <li>She was walking to the mall.</li>
                                <li>Ted might eat the cake.</li>
                                <li>You must go right now.</li>
                                <li>Words were spoken.</li>
                                <li>The teacher is writing a report.</li>
                            </ul>

                            <p>Here are some verb phrase examples where the verb phrase is the predicate of a sentence.
                                In this case, the verb phrase consists of the main verb plus any auxiliary, or helping,
                                verbs. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta
                                nec, tempus vitae, iaculis semper, pede.</p>
                            <ol>
                                <li>Shipping & Delivery.</li>
                                <li>Privacy & Security.</li>
                                <li>Returns & Replacements.</li>
                                <li>Payment, Pricing & Promotions.</li>
                                <li>Viewing Orders.</li>
                            </ol>

                            <p>Next are some verb phrase examples of verb phrases where the phrase has a single function
                                which means it can act like an adverb or an adjective. The phrase would include the verb
                                and any modifiers, complements, or objects. Lorem ipsum dolor sit amet, consectetuer
                                adipiscing elit. Morbi luctus. Duis lobortis. Lorem ipsum dolor sit amet, consectetur
                                adipiscing elit. Curabitur nec posuere odio. Proin vel ultrices erat. </p>

                            <table>
                                <tr>
                                    <th class="bg">First Column</th>
                                    <th>Second Column</th>
                                    <th class="bg">Third Column</th>
                                    <th>Fourth Column</th>
                                </tr>
                                <tr>
                                    <td class="bg">One</td>
                                    <td>no</td>
                                    <td class="bg">yes</td>
                                    <td>yes, all</td>
                                </tr>
                                <tr>
                                    <td class="bg">Two</td>
                                    <td>0</td>
                                    <td class="bg">1</td>
                                    <td>all</td>
                                </tr>
                                <tr>
                                    <td class="bg">Three</td>
                                    <td>$399</td>
                                    <td class="bg">$599</td>
                                    <td>$799</td>
                                </tr>
                                <tr>
                                    <td class="bg">Four</td>
                                    <td><a href="#">Call action</a></td>
                                    <td class="bg"><a href="#">Call action</a></td>
                                    <td><a href="#">Call action</a></td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                        <!-- .tab1 .tab_body -->

                        <div class="tab2 tab_body">
                            <h4>Customer reviews</h4>
                            <ul class="comments">


                            </ul>
                            <!-- .comments -->


                            <div class="clear"></div>
                        </div>
                        <!-- .tab2 .tab_body -->

                        <div class="tab3 tab_body">
                            <h4>Custom Tab</h4>

                            <div class="clear"></div>
                        </div>
                        <!-- .tab3 .tab_body -->
                        <div class="clear"></div>
                    </div>
                    ​<!-- #wrapper_tab -->
                    <div class="clear"></div>
                </div>
                <!-- .grid_9 -->

                <div class="clear"></div>
            </div>
            <!-- .product_page -->
            <div class="clear"></div>

        </div>
        <!-- #content -->

        <div class="clear"></div>

    </div>
    <!-- .container_12 -->
</section>
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
<script>
    function product_search_action() {
        console.log("show product search");
        document.getElementById('model_search').style.display = "none";
        if (document.getElementById('product_search').style.display == "none"){
            document.getElementById('product_search').style.display = "";
        } else {
            document.getElementById('product_search').style.display = "none";
        }


    }

    function model_search_action() {
        document.getElementById('product_search').style.display = "none";
        if (document.getElementById('model_search').style.display == "none"){
            document.getElementById('model_search').style.display = "";
        } else {
            document.getElementById('model_search').style.display = "none";
        }
    }
</script>
<!-- /Added by HTTrack -->
</html>
