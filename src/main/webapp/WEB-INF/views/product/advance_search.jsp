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
        <div class="grid_12" style="">
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
        <div class="grid_12" align="center" style="">
            <button type="submit" style="width: 300px; margin-bottom: 5px" >搜索</button>
        </div>
    </form>
</div>

<div class="grid_12" id="model_search" style="margin-bottom: 10px; border:1px solid #59b7c2; display: none">
    <form action="${pageContext.request.contextPath}/search/mode/results" enctype="multipart/form-data" method="post" accept-charset="UTF-8" class="search">

        <div class="grid_12" style="">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 5px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label><b><h2>厕所用途:</h2></b></label></div>
                <div style="float:left;padding:0 100px;"><b><h2><input type="radio" name="wc_type[]" value="公厕"
                />公厕</h2></b>
                </div>
                <div style="float:left;padding:0 50px;"><b><h2><input type="radio" name="wc_type[]" value="户厕" checked
                />户厕</h2></b>
                </div>
            </div>


        </div>

        <div class="grid_12">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">自然环境条件:</label>
        </div>


        <div class="grid_12" style="">

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>温度条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="natureTemp[]" value="高寒"
                                                                           style="margin-bottom:5px;"/>高寒
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="natureTemp[]" value="普通"
                                                                          style="margin-bottom:5px;"/>普通
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="natureTemp[]" value="无限制" checked
                                                                          style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><div style="color: #99abb4;font-size: 4px;">高寒地区包括高海拔地区与寒冷地区。高海拔地区指海拔＞1000m的地区，分布在我国西藏、云南、贵州、青海、宁夏、甘肃、山西、内蒙古、新疆等地区。
                    寒冷地区指最</div><div style="color: #99abb4;font-size: 4px;">冷月平均温度＜0℃或日平均温度≤5℃天数在90d以上的地区，分布在我国辽宁、吉林、黑龙江、青海、宁夏、山西、甘肃、内蒙古、新疆、西藏等地区。
                    除此外其他地区称></div><div style="color: #99abb4;font-size: 4px;">为普通地区。</div>
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>水资源条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="water[]" value="缺水"
                                                                           style="margin-bottom:5px;"/>缺水
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="water[]" value="良好"
                                                                          style="margin-bottom:5px;"/>良好
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="water[]" value="无限制" checked
                                                                          style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><p><div style="color: #99abb4;font-size: 4px;">缺水地区指年降水量＜200mm的干旱区域及人均水资源量＜600m3的缺水地区，如北京、天津、河北、山西、山东、新疆等地区。
                    除缺水地区外，其他地区统称良好地区。</div>
                    </p></div>
            </div>
        </div>


        <div class="grid_12">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>地形条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="terrain[]" value="山区"
                                                                           style="margin-bottom:5px;"/>山区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="丘陵"
                                                                          style="margin-bottom:5px;"/>丘陵
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="一般地区" checked
                                                                          style="margin-bottom:5px;"/>一般地区
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><p><div style="color: #99abb4;font-size: 4px;">山区分为高山、中山和低山。海拔在3500米以上为高山，海拔在1000-3500米为中山，海拔低于1000米为低山。
                    丘陵指绝对高度在500米以内，相对高度不超过200米，起伏</div><div style="color: #99abb4;font-size: 4px;">不大，坡度较缓，地面崎岖不平，由连绵不断的低矮山丘组成的地形。
                    除山区与丘陵地区外，其他地区统称为一般地区。</div>
                    </p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>地理位置条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="geolocation[]" value="城市近郊"
                                                                           style="margin-bottom:5px;"/>城市近郊
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="城中村"
                                                                          style="margin-bottom:5px;"/>城中村
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="中心城镇地区"
                                                                          style="margin-bottom:5px;"/>中心城镇地区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="一般地区" checked
                                                                          style="margin-bottom:5px;"/>一般地区
                </div>
            </div>



            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>生态限制条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="ecotope[]" value="生态保护区"
                                                                           style="margin-bottom:5px;"/>生态保护区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="ecotope[]" value="水源保护区"
                                                                          style="margin-bottom:5px;"/>水源保护区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="ecotope[]" value="一般地区" checked
                                                                          style="margin-bottom:5px;"/>一般地区
                </div>
            </div>


        </div>


        <div class="grid_12">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">人文因素:</label>
        </div>

        <div class="grid_12" style="">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>人口密集程度:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="density[]" value="聚集"
                                                                           style="margin-bottom:5px;"/>聚集
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="density[]" value="分散"
                                                                          style="margin-bottom:5px;"/>分散
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="density[]" value="一般"
                                                                          style="margin-bottom:5px;"/>一般
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="density[]" value="无限制" checked
                                                                          style="margin-bottom:5px;"/>无限制
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><p><div style="color: #99abb4;font-size: 5px;">聚集地区指村庄布局紧凑，人口密集，居民点集中的较集中区域。
                    分散地区指村庄布局分散，且单村人口密度较小的地区。其他地区统称为一般地区。</div>
                    </p></div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>可形成液态肥:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="usageHabits[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="usageHabits[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="usageHabits[]" value="均可" checked
                                                                          style="margin-bottom:5px;"/>均可
                </div>
            </div>


        </div>

        <div class="grid_12" style="">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">管网条件:</label>
        </div>


        <div class="grid_12" style="">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>需要具有完整城镇污水处理系统:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="sewageTreatment[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="sewageTreatment[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="sewageTreatment[]" value="无限制" checked
                                                                          style="margin-bottom:5px;"/>无限制
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>需要具有污水管道:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="sewerLines[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="sewerLines[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="sewerLines[]" value="均可" checked
                                                                          style="margin-bottom:5px;"/>均可
                </div>
            </div>


        </div>

        <div class="grid_12" style="">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">资源化利用:</label>
        </div>

        <div class="grid_12" style="">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>需要具有沼气利用工程:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="biogasUtilization[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="biogasUtilization[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="biogasUtilization[]" value="无限制" checked
                                                                          style="margin-bottom:5px;"/>无限制
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>可以与其他生活污水混合处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="mixedTreatment[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="mixedTreatment[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="mixedTreatment[]" value="均可" checked
                                                                          style="margin-bottom:5px;"/>均可
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>可以与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="otherTreatment[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="otherTreatment[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="otherTreatment[]" value="均可" checked
                                                                          style="margin-bottom:5px;"/>均可
                </div>
            </div>


        </div>

        <div class="grid_12" align="center" style="">
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
