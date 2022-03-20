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
                <h1 id="site_logo"><a
                        href="javascript:window.location.href='${pageContext.request.contextPath}/product/index'"
                        title=""><img
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
                <label class="search_grid_4"> 产品名称: <input type="text" name="search" class="search_btn" value=""
                                                           placeholder=""/></label>
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
            <h1 class="page_title">双瓮漏斗式化粪池</h1>

            <div class="product_page grid_12">
                <div class="grid_4 img_slid" id="products">
                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a href="${pageContext.request.contextPath}/static/product/res/1.jpeg" class="jqzoom"
                               rel='gal1' title="">
                                <img src="${pageContext.request.contextPath}/static/product/res/1.jpeg" height="500px"
                                     width="500px" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <!-- .prev -->

                    <ul class="pagination clearfix" id="thumblist">
                        <li><a class="zoomThumbActive" href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/1.jpeg',largeimage: '${pageContext.request.contextPath}/static/product/res/1.jpeg'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/1.jpeg' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/2.jpeg',largeimage: '${pageContext.request.contextPath}/static/product/res/2.jpeg'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/2.jpeg' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/1.jpeg',largeimage: '${pageContext.request.contextPath}/static/product/res/1.jpeg'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/1.jpeg' alt=""></a></li>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/static/product/res/2.jpeg',largeimage: '${pageContext.request.contextPath}/static/product/res/2.jpeg'}"><img
                                src='${pageContext.request.contextPath}/static/product/res/2.jpeg' alt=""></a></li>
                    </ul>

                </div>
                <!-- .grid_4 -->

                <div class="grid_7">
                    <div class="entry_content">
                        <div class="review">
                            <h5>双瓮漏斗式化粪池</h5>
                        </div>
                        <p>农村旱厕改造化粪池产品。</p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    价格：
                                </div>
                            </div>
                            <!-- .availability_sku -->

                            <div class="price">
                                <div class="price_new">2万元</div>
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
                        <a href="#" class="tab2 tab_link">使用说明</a>
                        <a href="#" class="tab3 tab_link">质保证书</a>

                        <div class="clear"></div>

                        <div class="tab1 tab_body">
                            <h4>山东海辰环保双翁漏斗式化粪池主要特点：</h4>
                            <ul>
                                <li>容积1.0-1.5m3，符合《Q/HHKJ02-2016三格式化粪池》标准。</li>
                                <li>设计理念先进，隔舱板上下错层设计污水环流式流动，污水处理能力比同等容积的传统化粪池至少提高二倍以上。</li>
                                <li>优化结构设计，工艺技术成熟，产品强度高，耐酸碱，防腐蚀。</li>
                                <li>节约用水，每次冲厕所用水量为0.3升左右。</li>
                                <li>无异味，无苍蛆，不渗漏，不污染地下水。</li>
                                <li>产品的密封性和牢固性好，确保厌氧化粪的功能。</li>
                                <li>对粪便进行无害化处理，避免粪便传播各种疾病，可防止对空气、土壤、水的污染，保护环境。</li>
                                <li>轻便，便于运输，安装方便快捷。</li>
                                <li>省工，省时，使用寿命可达50年以上。</li>
                            </ul>

                            <p>双翁式化粪池安装说明：</p>
                            <ol>
                                <li>在厕所外与室内放置便器相对应的位置挖一个长2.3米，宽1米，深1.4米长方体的坑，把坑底加入三基土夯实。</li>
                                <li>在对接处粘上封闭胶带后，先把瓮体对接，再用螺钉加固(且不要把胶带上的塑料布揭掉) </li>
                                <li>将装的好瓮体放入厕室挖好的坑里，瓮体高出地面5-10厘米，以防往瓮内渗水。 </li>
                                <li>调整好过粪管口的位置，瓮与瓮之间用过粪管连接，在过粪管与瓮体连接处用专用的管件连接，起到防渗固定作用。 </li>
                                <li>在厕室放好一瓮，第2瓮放在室外挖好的坑里，同样高出地面5-10cm，在室内用砖修筑一个放置便器的口，将便器放平后粉刷，但便器不要封死，以便清除粪渣时使用，在1.2瓮之间，垒厕所墙时，要防止压坏过粪管。 </li>
                                <li>瓮体周围用土填好夯实，防止瓮体塌陷，倾斜。根据厕所地形情况，1瓮放厕室内，2瓮放厕室外，也可以将两个瓮体全部埋在室内。</li>
                            </ol>

                            <table>
                                <tr>
                                    <th class="bg">规格</th>
                                    <th>55</th>
                                    <th class="bg">适用人数（人）</th>
                                    <th>5</th>
                                </tr>
                                <tr>
                                    <td class="bg">尺寸（长*宽*高 mm）</td>
                                    <td>500*500*500</td>
                                    <td class="bg">材质</td>
                                    <td>玻璃钢</td>
                                </tr>
                                <tr>
                                    <td class="bg">颜色</td>
                                    <td>白色</td>
                                    <td class="bg">使用寿命</td>
                                    <td>50年</td>
                                </tr>
                                <tr>
                                    <td class="bg">用途</td>
                                    <td>公厕</td>
                                    <td class="bg">清理周期</td>
                                    <td>5个月</td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                        <!-- .tab1 .tab_body -->

                        <div class="tab2 tab_body">
                            <h4>使用说明</h4>
                            <ul class="comments">


                            </ul>
                            <!-- .comments -->


                            <div class="clear"></div>
                        </div>
                        <!-- .tab2 .tab_body -->

                        <div class="tab3 tab_body">
                            <h4>质保证书</h4>

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
</script>
<!-- /Added by HTTrack -->
</html>
