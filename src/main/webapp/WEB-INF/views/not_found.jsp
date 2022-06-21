<%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/5/4
  Time: 下午8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0, user-scalable=no">
  <title>访问失败</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/error.css">
</head>
<body>
<div class="center">
  <div class="img">
    <img src="${pageContext.request.contextPath}/static/base/img/notfound.jpg">
  </div>
</div>
<div class="center">
  <p>点此<a href="javascript:void(0);" onclick="location.replace(document.referrer);">返回</a></p>
</div>
<div class="footer">
  如需帮助或反馈，请联系邮箱：cag@cadg.cn</br>
  Copyright © 亚太建设科技信息研究院
</div>
</body>
</html>