<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.common.collect.Lists" %>
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
</head>
<body>
<%ToiletProductDTO productDTO = (ToiletProductDTO) request.getAttribute("product");%>
<%--获取路径用于显示图片和文件--%>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";%>
<!-- #top -->
<jsp:include page="product_banner.jsp"/>
<!-- .grid_6 -->

<!-- .container_12 -->

<div class="clear"></div>

<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li class="curent"><a href="${pageContext.request.contextPath}/">首页</a></li>
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

        <%String firstPicPath = productDTO.getPicsPath().split(";")[0];%>
        <div id="content" class="grid_12">
            <h1 class="page_title"><%=productDTO.getProductName()%>
            </h1>

            <div class="product_page grid_12">
                <div class="grid_4 img_slid" id="products">
                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a href="<%=basePath+firstPicPath%>" class="jqzoom"
                               rel='gal1' title="">
                                <img src="<%=basePath+firstPicPath%>" height="500px"
                                     width="500px" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <!-- .prev -->
                    <%List<String> pathList = Lists.newArrayList(productDTO.getPicsPath().split(";"));%>
                    <ul class="pagination clearfix" id="thumblist">
                        <li><a class="zoomThumbActive" href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '<%=basePath+pathList.get(0).replaceAll("\\\\", "/")%>',largeimage: '<%=basePath+pathList.get(0).replaceAll("\\\\", "/")%>'}"><img
                                src='<%=basePath+pathList.get(0)%>' alt="" style="opacity: 1;"></a></li>
                        <%for (int i = 1; i < pathList.size(); i++) {%>
                        <li><a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: '<%=basePath+pathList.get(i).replaceAll("\\\\", "/")%>',largeimage: '<%=basePath+pathList.get(i).replaceAll("\\\\", "/")%>'}"><img
                                src='<%=basePath+pathList.get(i)%>' alt=""></a></li>
                        <%}%>
                    </ul>

                </div>
                <!-- .grid_4 -->

                <div class="grid_7">
                    <div class="entry_content">
                        <div class="review">
                            <h5><%=productDTO.getProductName()%>
                            </h5>
                        </div>
                        <p><%=productDTO.getManufacturerName()%>
                        </p>
                        <p><%=productDTO.getManufacturerCell()%>
                        </p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    价格：
                                </div>
                            </div>
                            <!-- .availability_sku -->

                            <div class="price">
                                <div class="price_new"><%=productDTO.getProductParameters().getPrice()%>元</div>
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
                            <h4><%=productDTO.getProductName()%>
                            </h4>

                            <p><%=productDTO.getManufacturerName()%>
                            </p>
                            <ul>
                                <li>联系方式：<%=productDTO.getManufacturerCell()%>
                                </li>
                                <li>适用省份：<%=productDTO.getApplicableProvince()%>
                                </li>
                                <li>用途：<%=productDTO.getPurpose()%>
                                </li>
                            </ul>

                            <table>
                                <tr>
                                    <th class="bg" width="15%">规格</th>
                                    <th width="35%"><%=productDTO.getProductParameters().getStandard()%>立方米
                                    </th>
                                    <th class="bg" width="15%">适用人数（人）</th>
                                    <th width="35%"><%=productDTO.getProductParameters().getApplicableNum()%>人
                                    </th>
                                </tr>
                                <tr>
                                    <td class="bg">尺寸（长*宽*高 mm）</td>
                                    <td><%=productDTO.getProductParameters().getLength()%>mm
                                        *<%=productDTO.getProductParameters().getWide()%>mm
                                        *<%=productDTO.getProductParameters().getHigh()%>mm
                                    </td>
                                    <td class="bg">材质</td>
                                    <td><%=productDTO.getProductParameters().getTexture()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg">颜色</td>
                                    <td><%=productDTO.getProductParameters().getColor()%>
                                    </td>
                                    <td class="bg">使用寿命</td>
                                    <td><%=productDTO.getProductParameters().getServiceLife()%>年
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg">产品特点</td>
                                    <td><%=productDTO.getProductFeatures()%>
                                    </td>
                                    <td class="bg">清理周期</td>
                                    <td><%=productDTO.getProductParameters().getCleanupCycle()%>月
                                    </td>
                                </tr>
                                <%if (productDTO.getProductType().equals("双瓮漏斗式厕所")) {%>
                                <tr>
                                    <td class="bg">重量</td>
                                    <td><%=productDTO.getProductParameters().getWeight()%>kg
                                    </td>
                                    <td class="bg">壁厚</td>
                                    <td><%=productDTO.getProductParameters().getWallThickness()%>mm
                                    </td>
                                </tr>
                                <%
                                    } else {
                                    }
                                %>
                                <%if (productDTO.getProductType().equals("三联沼气池式厕所") || productDTO.getProductType().equals("复合生物反应微水冲厕所") || productDTO.getProductType().equals("多级生化组合电催化氧化厕所") || productDTO.getProductType().equals("膜生物反应器（MBR）厕所") || productDTO.getProductType().equals("生态旱厕") || productDTO.getProductType().equals("粪尿分集式厕所")) {%>
                                <tr>
                                    <td class="bg">其他参数</td>
                                    <td><%=productDTO.getProductParameters().getOtherParams()%>
                                    </td>
                                    <td class="bg"></td>
                                    <td></td>
                                    <%
                                        } else {
                                        }
                                    %>
                                </tr>
                                <tr>
                                    <td class="bg">厕所用途</td>
                                    <td><%=productDTO.getPurpose()%>
                                    </td>
                                    <td class="bg">具体用途</td>
                                    <td><%=productDTO.getProductParameters().getParamPurpose()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg">应用案例</td>
                                    <td><%=productDTO.getProductParameters().getApplyCase()%>
                                    </td>
                                    <%if (productDTO.getProductType().equals("三联沼气池式厕所") || productDTO.getProductType().equals("复合生物反应微水冲厕所") || productDTO.getProductType().equals("多级生化组合电催化氧化厕所") || productDTO.getProductType().equals("膜生物反应器（MBR）厕所") || productDTO.getProductType().equals("生态旱厕") || productDTO.getProductType().equals("粪尿分集式厕所")) {%>
                                    <td class="bg">产品原理及组成</td>
                                    <td>
                                        <%=productDTO.getProductTheory()%>
                                    </td>
                                    <%} else {%>
                                    <td class="bg"></td>
                                    <td>
                                    </td>
                                    <%}%>
                                </tr>

                                <%if (productDTO.getProductType().equals("泡沫封堵液")) {%>
                                <tr>
                                    <td class="bg">适用条件</td>
                                    <td><%=productDTO.getApplicableCondition()%>
                                    </td>
                                    <td class="bg">产品参数</td>
                                    <td><%=productDTO.getSpecialParam()%>
                                    </td>
                                </tr>
                                <%
                                    } else {
                                    }
                                %>

                            </table>
                            <div class="clear"></div>
                        </div>
                        <!-- .tab1 .tab_body -->
                        <div class="tab2 tab_body">
                            <h4>使用说明</h4>
                            <div class="preview slides_container">
                                <div class="prev_bg">
                                    <%String instructionFilePath = productDTO.getInstructionFilePath();%>
                                            <iframe src="<%=basePath + instructionFilePath%>"
                                                    width="100%" height="100%" style="height: 500px;"></iframe>
                                </div>
                            </div><!-- .prev -->


                            <div class="clear"></div>
                        </div>
                        <!-- .tab2 .tab_body -->
                        <div class="tab3 tab_body">
                            <h4>质保证书</h4>
                            <div class="custom-tab">
                                <%String filePath = productDTO.getQualityAssuranceMaterialsFilePath();%>
                                        <iframe src="<%=basePath + filePath%>"
                                                width="100%" height="100%" style="height: 500px;"></iframe>
                            </div>
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
            document.getElementById('block_nav_primary').style.display = "none";
            document.getElementById('main').style.display = "none";
        } else {
            document.getElementById('product_search').style.display = "none";
            document.getElementById('block_nav_primary').style.display = "";
            document.getElementById('main').style.display = "";
        }
    }

    function model_search_action() {
        document.getElementById('product_search').style.display = "none";
        if (document.getElementById('model_search').style.display == "none") {
            document.getElementById('model_search').style.display = "";
            document.getElementById('block_nav_primary').style.display = "none";
            document.getElementById('main').style.display = "none";
        } else {
            document.getElementById('model_search').style.display = "none";
            document.getElementById('block_nav_primary').style.display = "";
            document.getElementById('main').style.display = "";
        }
    }
</script>


<script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jflow.plus.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/jquery.carouFredSel-5.2.2-packed.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/checkbox.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/radio.js"></script>
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

<!-- /Added by HTTrack -->
</html>