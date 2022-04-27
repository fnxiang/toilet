<%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/4/27
  Time: 下午9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<header>
    <div id="product_search" class="grid_12" style="margin-bottom: 20px;  border:1px solid #59b7c2; display: none">
        <form action="${pageContext.request.contextPath}/search/product/results" enctype="multipart/form-data" method="post" accept-charset="UTF-8" class="search">
            <div class="grid_12">
                <label class="search_grid_4"> 规格:
                    <select name="guige_select" class="form-control">
                        <option value="≤0.5">≤0.5</option>
                        <option value="0.6~10">0.6~10</option>
                        <option value="11~25">11~25</option>
                        <option value="26~50">26~50</option>
                        <option value="51~100">51~100</option>
                        <option value="100以上">100以上</option>
                    </select>
                </label>
                <label class="search_grid_4">材质:
                    <select name="caizhi_select" id="caizhi_select" class="form-control">
                        <option value="玻璃钢">玻璃钢</option>
                        <option value="PP">PP</option>
                        <option value="PE">PE</option>
                        <option value="预制钢筋混凝土">预制钢筋混凝土</option>
                        <option value="其他">其他</option>
                    </select></label>
                <label class="search_grid_4">使用寿命:
                    <select name="life_select" id="life_select" class="form-control">
                        <option value="50年以内">50年以内</option>
                        <option value="50年及以上">50年及以上</option>
                    </select></label>
            </div>
            <div class="grid_12" style="margin-top: 10px;">
                <label class="search_grid_4">价格（万元）:
                    <select name="price_select" id="price_select" class="form-control">
                        <option value="0.5以内">0.5以内</option>
                        <option value="0.5~1">0.5~1</option>
                        <option value="1~1.5">1~1.5</option>
                        <option value="1.5~2">1.5~2</option>
                        <option value="2以上">2以上</option>
                    </select>
                </label>
                <label class="search_grid_4">清理周期:
                    <select name="clean_select" id="clean_select" class="form-control">
                        <option value="≤3个月">≤3个月</option>
                        <option value="4~6个月">4~6个月</option>
                        <option value="7~12个月">7~12个月</option>
                        <option value="12个月及以上">12个月及以上</option>
                    </select></label>
            </div>
            <div class="grid_12" align="center" style="margin-top: 10px;">
                <button type="submit" style="width: 300px; margin-bottom: 5px" >搜索</button>
            </div>
        </form>
    </div>

    <div class="grid_12" id="model_search" style="margin-bottom: 20px; border:1px solid #59b7c2; display: none">
        <form action="${pageContext.request.contextPath}/search/mode/results" enctype="multipart/form-data" method="post" accept-charset="UTF-8" class="search">

            <div class="grid_12">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">自然环境条件:</label>
            </div>


            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">温度条件:
                    <select name="natureTemp" id="wendu_select" class="form-control">
                        <option value="高寒">高寒</option>
                        <option value="普通">普通</option>
                        <option value="无限制">无限制</option>
                    </select></label>

                <label class="grid_4">水资源条件:
                    <select name="water" id="water_select" class="form-control">
                        <option value="缺水">缺水</option>
                        <option value="良好">良好</option>
                        <option value="无限制">无限制</option>
                    </select></label>
            </div>


            <div class="grid_12">
                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>地形条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="terrain[]" value="山区"
                                                                  style="margin-bottom:5px;"/>山区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="terrain[]" value="丘陵"
                                                                  style="margin-bottom:5px;"/>丘陵
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="terrain[]" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>

                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>地理位置条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="geolocation[]" value="城市近郊"
                                                                  style="margin-bottom:5px;"/>城市近郊
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="geolocation[]" value="城中村"
                                                                  style="margin-bottom:5px;"/>城中村
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="geolocation[]" value="中心城镇地区"
                                                                  style="margin-bottom:5px;"/>中心城镇地区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="geolocation[]" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>

                <div class="grid_12"
                     style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                    <div style="float:left;padding:0 5px;"><label>生态限制条件:</label></div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="ecotope[]" value="生态保护区"
                                                                  style="margin-bottom:5px;"/>生态保护区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="ecotope[]" value="水源保护区"
                                                                  style="margin-bottom:5px;"/>水源保护区
                    </div>
                    <div style="float:left;padding:0 5px;"><input type="checkbox" name="ecotope[]" value="一般地区"
                                                                  style="margin-bottom:5px;"/>一般地区
                    </div>
                </div>
            </div>


            <div class="grid_12">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">人文因素:</label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">人口密集程度:
                    <select name="density" id="renkou_select" class="form-control">
                        <option value="聚集">聚集</option>
                        <option value="分散">分散</option>
                        <option value="一般">一般</option>
                        <option value="无限制">无限制</option>
                    </select></label>

                <label class="grid_4">可形成液态肥:
                    <select name="usageHabits" id="yetaifei_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="均可">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">管网条件:</label>
            </div>


            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_4">需要具有完整城镇污水处理系统:
                    <select name="sewageTreatment" id="wushuichuli_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="无限制">无限制</option>
                    </select></label>

                <label class="grid_4">需要具有污水管道:
                    <select name="sewerLines" id="wushuiguandao_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="均可">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">资源化利用:</label>
            </div>

            <div class="grid_12" style="margin-top: 10px;">
                <label class="grid_3">需要具有沼气利用工程:
                    <select name="biogasUtilization" id="zhaoqi_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="无限制">无限制</option>
                    </select></label>

                <label class="grid_4">可以与其他生活污水混合处理:
                    <select name="mixedTreatment" id="wushuihunhe_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="均可">均可</option>
                    </select></label>

                <label>可以与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理:
                    <select name="otherTreatment" id="yibingchuli_select" class="form-control">
                        <option value="是">是</option>
                        <option value="否">否</option>
                        <option value="均可">均可</option>
                    </select></label>
            </div>

            <div class="grid_12" align="center" style="margin-top: 10px;">
                <button type="submit" style="width: 300px; margin-bottom: 5px" >搜索</button>
            </div>
        </form>
    </div>
</header>

<%-- js --%>
<script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/selectBox.js"></script>
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
</html>
