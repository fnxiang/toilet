<%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/5/8
  Time: 上午1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div class="top-left">
    <div class="navbar-header">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
        <a class="navbar-brand hidden" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/static/manage/images/logo2.png" alt="Logo"></a>
        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
    </div>
</div>
<div class="top-right">
    <div class="header-menu">


        <div class="user-area dropdown float-right">
            <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="User Avatar" >
            </a>

            <div class="user-menu dropdown-menu">
                <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=admin_back5"><i class="fa fa-cog"></i>设置</a>

                <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fa fa-power-off"></i>注销</a>
            </div>
        </div>
    </div>
</div>
</html>
