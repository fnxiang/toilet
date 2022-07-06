<%--
  Created by IntelliJ IDEA.
  User: 18356
  Date: 2022/5/30
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/dialog.css">
<html>
    <%--                            弹窗--%>
    <div>
        <div class="dialog">
            <!-- 弹窗遮罩层 -->
            <div>
                <!-- 弹窗内容 -->
                <div style="height: 200px;"></div>
                <div class="content_dialog">
                    <div class="aclose">
                        <a class="close" href="javascript:close();">&times;</a>
                    </div>
                    <div class="contain" id="dialog_text" style="font-size: 20px; color: #fcfdfd">
                    </div>
                </div>

            </div>

        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/manage/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script>
    function show(msg){
        document.getElementById("dialog_text").innerHTML = msg;
        $(".dialog").css("display","block");
    }
    function close(){
        $(".dialog").css("display","none");
        document.location.reload();
    }
</script>
</html>
