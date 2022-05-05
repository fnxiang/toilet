<%--
  Created by IntelliJ IDEA.
  User: fring
  Date: 2022/4/27
  Time: 下午9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

        <div class="grid_12" style="margin-top: 5px;">
            <style>
                h1 {font-size:20px;}
            </style>
            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label><b><h1>厕所用途:</h1></b></label></div>
                <div style="float:left;padding:0 100px;"><b><h1><input type="radio" name="wc_type[]" value="公厕"
                                                                      style="margin-bottom:5px;"/>公厕</h1></b>
                </div>
                <div style="float:left;padding:0 50px;"><b><h1><input type="radio" name="wc_type[]" value="户厕"
                                                                      style="margin-bottom:5px;"/>户厕</h1></b>
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

        </div>

        <div class="grid_12">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">自然环境条件:</label>
        </div>


        <div class="grid_12" style="margin-top: 10px;">

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>温度条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="natureTemp[]" value="高寒"
                                                              style="margin-bottom:5px;"/>高寒
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="natureTemp[]" value="普通"
                                                              style="margin-bottom:5px;"/>普通
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="natureTemp[]" value="无限制"
                                                              style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>水资源条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="water[]" value="缺水"
                                                              style="margin-bottom:5px;"/>缺水
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="water[]" value="良好"
                                                              style="margin-bottom:5px;"/>良好
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="water[]" value="无限制"
                                                              style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>
        </div>


        <div class="grid_12">
            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>地形条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="terrain[]" value="山区"
                                                              style="margin-bottom:5px;"/>山区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="terrain[]" value="丘陵"
                                                              style="margin-bottom:5px;"/>丘陵
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="terrain[]" value="一般地区"
                                                              style="margin-bottom:5px;"/>一般地区
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>地理位置条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="geolocation[]" value="城市近郊"
                                                              style="margin-bottom:5px;"/>城市近郊
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="geolocation[]" value="城中村"
                                                              style="margin-bottom:5px;"/>城中村
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="geolocation[]" value="中心城镇地区"
                                                              style="margin-bottom:5px;"/>中心城镇地区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="geolocation[]" value="一般地区"
                                                              style="margin-bottom:5px;"/>一般地区
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>生态限制条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="ecotope[]" value="生态保护区"
                                                              style="margin-bottom:5px;"/>生态保护区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="ecotope[]" value="水源保护区"
                                                              style="margin-bottom:5px;"/>水源保护区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="ecotope[]" value="一般地区"
                                                              style="margin-bottom:5px;"/>一般地区
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

        </div>


        <div class="grid_12">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">人文因素:</label>
        </div>

        <div class="grid_12" style="margin-top: 10px;">
            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>人口密集程度:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="density[]" value="聚集"
                                                              style="margin-bottom:5px;"/>聚集
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="density[]" value="分散"
                                                              style="margin-bottom:5px;"/>分散
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="density[]" value="一般"
                                                              style="margin-bottom:5px;"/>一般
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="density[]" value="无限制"
                                                              style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>可形成液态肥:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="usageHabits[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="usageHabits[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="usageHabits[]" value="均可"
                                                              style="margin-bottom:5px;"/>均可
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

        </div>

        <div class="grid_12" style="margin-top: 10px;">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">管网条件:</label>
        </div>


        <div class="grid_12" style="margin-top: 10px;">
            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>需要具有完整城镇污水处理系统:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="sewageTreatment[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="sewageTreatment[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="sewageTreatment[]" value="无限制"
                                                              style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>需要具有污水管道:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="sewerLines[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="sewerLines[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="sewerLines[]" value="均可"
                                                              style="margin-bottom:5px;"/>均可
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

        </div>

        <div class="grid_12" style="margin-top: 10px;">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">资源化利用:</label>
        </div>

        <div class="grid_12" style="margin-top: 10px;">
            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>需要具有沼气利用工程:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="biogasUtilization[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="biogasUtilization[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="biogasUtilization[]" value="无限制"
                                                              style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>可以与其他生活污水混合处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="mixedTreatment[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="mixedTreatment[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="mixedTreatment[]" value="均可"
                                                              style="margin-bottom:5px;"/>均可
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 10px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><label>可以与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="checkbox" name="otherTreatment[]" value="是"
                                                              style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="otherTreatment[]" value="否"
                                                              style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="checkbox" name="otherTreatment[]" value="均可"
                                                              style="margin-bottom:5px;"/>均可
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;margin-top: 5px;border-bottom-width: 10px;margin-bottom: 10px;">
                <div style="float:left;padding:0 5px;"><p>介绍*************************</p></div>
            </div>

        </div>

        <div class="grid_12" align="center" style="margin-top: 10px;">
            <button type="submit" style="width: 300px; margin-bottom: 5px" >搜索</button>
        </div>
    </form>
</div>

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
