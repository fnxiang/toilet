<%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/5/30
  Time: 下午11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/professor/index" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品信息审核列表</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>模式审核列表</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>基本信息</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/professor/toProfessorPage?url=professor_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->
</html>
