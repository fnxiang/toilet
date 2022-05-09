<%@ page import="org.springframework.util.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/4/27
  Time: 下午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uId = (String) request.getSession().getAttribute("uId");
    String role = (String) request.getSession().getAttribute("role");
%>
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
            <%if (StringUtils.isEmpty(uId)) {%>
            <div class="welcome">
                欢迎来访，你可以 <a
                    href="javascript:window.location.href='${pageContext.request.contextPath}/login/index'">登录</a> 或者
                <a href="javascript:window.location.href='${pageContext.request.contextPath}/register_company'">创建账户</a>.
            </div>
            <%} else {%>
            <div class="welcome">
                欢迎来访，<%=uId%>
            </div>
            <%}%>
            <!-- .welcome -->
        </div>
        <!-- .grid_6 -->


    </div>
    <!-- #top -->

    <div class="clear"></div>

    <header id="branding">
        <div class="grid_3">
            <hgroup>
                <h1 id="site_logo"><a href="javascript:window.location.href='${pageContext.request.contextPath}/'"
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

        <div class="grid_6">


            <nav class="private">
                <ul>
                    <li><a href="javascript:void(0)" onclick="product_search_action()">产品高级搜索</a></li>
                    <li class="separator">|</li>
                    <li><a href="javascript:void(0)" onclick="model_search_action()">模式高级搜索</a></li>
                    <% if (StringUtils.isEmpty(uId)) {%>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/login/index">登录</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/register_company">注册</a></li>
                    <%} else {%>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/<%=role%>/index">我的账户</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
                    <%}%>
                </ul>
            </nav>
            <!-- .private -->
        </div>

        <jsp:include page="advance_search.jsp"/>
    </header>
</div>

<%--js--%>
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

    function Post(url, params) {
        var temp = document.createElement("form");
        temp.action = url;
        temp.method = "post";
        temp.enctype = "multipart/form-data";
        temp.style.display = "none";
        for (var key in params) {
            var opt = document.createElement("textarea");
            opt.name = key;
            opt.value = params[key];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
</script>
