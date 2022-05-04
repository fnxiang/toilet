<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.alibaba.fastjson.JSON" %><%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/5/4
  Time: 下午9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<ul id="list_product" class="list_product">
    <% List<ToiletProductDTO> productList = (List<ToiletProductDTO>) request.getAttribute("productList");%>
    <c:set var="list" value="<%=JSON.toJSONString(productList)%>" scope="application"/>
    <% String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";%>
    <% for (ToiletProductDTO productDTO : productList) {
        String firstPicPath = productDTO.getPicsPath().split(";")[0];
    %>
    <li value="">
        <div class="grid_3 product">
            <div class="prev">
                <a href="${pageContext.request.contextPath}/toProductPage?url=product_info&product_id=<%=productDTO.getId()%>"><img
                        src="<%=basePath+firstPicPath%>"
                        alt="" title=""/></a>
            </div>
            <!-- .prev -->
            <h3 class="title"><%=productDTO.getProductName()%>
            </h3>

            <div class="cart">
                <div class="price">
                    <div class="vert">
                        <div class="price_new">价格：<%=productDTO.getProductParameters().getPrice()%>万元
                        </div>
                    </div>
                </div>
            </div>
            <!-- .cart -->
        </div>
        <!-- .grid_3 -->
    </li>
    <%}%>
</ul>
</html>
