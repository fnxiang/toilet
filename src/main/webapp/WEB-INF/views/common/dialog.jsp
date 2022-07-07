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
    function confirm_delete(userType, userId){
        $(".dialog").css("display","block");
        $(".content_dialog").css("height","150px");
        var dom = '确定删除？</br></br>';
        if(userType === 'company'){
            dom += '<button class="btn-3" type="button"   onclick="deleteCompany(' + userId + ')">是</button>&nbsp;&nbsp;';
        }else if(userType === 'professor'){
            dom += '<button class="btn-3" type="button"   onclick="deleteProfessor(' + userId + ')">是</button>&nbsp;&nbsp;';
        }else if(userType === 'product'){
            dom += '<button class="btn-3" type="button"  onclick="deleteProduct(' + userId + ')">是</button>&nbsp;&nbsp;';
        }else if(userType === 'pattern'){
            dom += '<button class="btn-3" type="button"  onclick="deletePattern(' + userId + ')">是</button>&nbsp;&nbsp;';
        }
        dom += '&nbsp;&nbsp;<button type="button" class="btn-3" onclick="cancalDelete()">否</button>';
        document.getElementById("dialog_text").innerHTML = dom
    }
        function show(msg){
            $(".content_dialog").css("height","90px");
            document.getElementById("dialog_text").innerHTML = msg;
            $(".dialog").css("display","block");
        }
        function close(){
            $(".content_dialog").css("height","90px");
            $(".dialog").css("display","none");
            document.location.reload();
        }
    </script>
</html>
