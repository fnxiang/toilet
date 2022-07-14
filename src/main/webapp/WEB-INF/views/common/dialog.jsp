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

    var myAlert = {
        alertbox : function(alertContent){
            // var windowWidth = window.innerWidth;
            //     windowHeight = window.innerHeight;
            var alertContainer = document.createElement("div")
            alertContainer.innerHTML =
                `
                <div id='myAlertBox' style='position: absolute; left: 0px; top: 0px; width: 100%; z-index: 9999; height: 568px;'>
                    <div style="position: absolute; left: 0px; top: 0px; width: 100%; background: rgba(0, 0, 0,1); opacity: 0.5; z-index: 9999; height: 900px;"></div>
                    <div style="position: absolute; width: 400px; height: 500px;background: #fff; border-radius: 20px;overflow: hidden;z-index: 10000; left: 50%; top: 50%; transform: translate(-50%, -50%);padding:25px">
                        <div style='width:100%;height: 20px;font-size: 20px;color: #282828;text-align:center;'>服务协议与隐私政策</div>
                        <div style='width:100%;height: 370px;font-size: 13px;color: #282828;text-align:left;margin-top:18px; overflow-y: auto;'>&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用厕所选型系统,收集您的信息是为了向您提供服务及提升服务质量，为了实现这一目的，我们会把您的信息用于下列用途：</br>
&nbsp;&nbsp;&nbsp;&nbsp;1、向您提供您使用的漫画人极速版产品或服务，并维护、改进、优化这些服务及服务体验；</br>
&nbsp;&nbsp;&nbsp;&nbsp;2、为预防、发现、调查欺诈、侵权、危害安全、非法或违反与我们的协议、政策或规则的行为，保护您、其他用户或公众，我们或我们关联公司的合法权益，我们可能使用或整合您的用户信息、服务使用信息、设备信息、日志信息以及我们关联公司、合作伙伴取得您授权或依据法律共享的信息，来综合判断您账户及交易风险、进行身份验证、检测及防范安全事件，并依法采取必要的记录、审计、分析、处置措施；</br>
&nbsp;&nbsp;&nbsp;&nbsp;为确保网站正常运转，我们会在您的计算机或移动设备上存储名为 Cookie 的小数据文件。Cookie 通常包含标识符、站点名称以及一些号码和字符。Cookie主要的功能是便于您使用网站产品和服务，以及帮助网站统计独立访客数量等。</br>
&nbsp;&nbsp;&nbsp;&nbsp;在您使用我们的服务时，我们可能会使用Cookie或同类技术收集您的一些个人信息，例如：您访问网站的习惯、您的登录信息等，Cookie和同类技术收集该类信息是为了您使用我们的服务的必要、简化您重复操作的步骤（如注册、登录）、便于您查看使用历史（如浏览历史）、保护您的信息和账号安全性、改善我们的产品和服务等。我们承诺仅在本隐私政策所述目的范围内使用Cookie和同类技术。
如果您的浏览器允许，您可以通过您的浏览器的设置以管理、（部分/全部）拒绝Cookie或同类技术；或删除已经储存在您的计算机、移动设备或其他装置内的Cookie或同类技术文件，从而实现我们无法全部或部分追踪您的个人信息。您如需详细了解如何更改浏览器设置，请具体查看您使用的浏览器的相关设置页面。</div>
                        <button style='width: 197px;height: 28px;line-height: 28px;font-size: 13px;text-align:center;margin-top:12px;color: #ffffff;background-color: #0983f8;border-radius: 14px;margin-left:79px;margin-top:20px;border:none;' onclick="closeAgree()">我知道了</button>
                    </div>
                </div>
            `
            document.body.appendChild(alertContainer)
        }
    }
    function agree(){
        myAlert.alertbox();
    }
    function closeAgree(){
        $("#myAlertBox").css("display","none");
    }
    </script>
</html>
