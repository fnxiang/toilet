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
    <form action="${pageContext.request.contextPath}/search/product/results" enctype="multipart/form-data" method="post"
          accept-charset="UTF-8" class="search">
        <div class="grid_12">
            <label class="search_grid_4"> 产品类型:
                <select name="type_select" id="type_select" class="form-control" onclick="change()">
                    <option value="完整下水道水冲式厕所">完整下水道水冲式厕所</option>
                    <option value="化粪池式厕所">化粪池式厕所</option>
                    <option value="双瓮漏斗式厕所">双瓮漏斗式厕所</option>
                    <option value="三联沼气池式厕所">三联沼气池式厕所</option>
                    <option value="复合生物反应微水冲厕所">复合生物反应微水冲厕所</option>
                    <option value="真空负压厕所">真空负压厕所</option>
                    <option value="多级生化组合电催化氧化厕所">多级生化组合电催化氧化厕所</option>
                    <option value="膜生物反应器（MBR）厕所">膜生物反应器（MBR）厕所</option>
                    <option value="生态旱厕">生态旱厕</option>
                    <option value="双坑交替式厕所">双坑交替式厕所</option>
                    <option value="粪尿分集式厕所">粪尿分集式厕所</option>
                    <option value="泡沫封堵液">泡沫封堵液</option>
                </select>
            </label>
            <label class="search_grid_4" id="guige" style="display: none"> 规格:
                <select name="guige_select" id="guige_select" class="form-control">
                    <option value="≤0.5">≤0.5</option>
                    <option value="0.6~10">0.6~10</option>
                    <option value="11~25">11~25</option>
                    <option value="26~50">26~50</option>
                    <option value="51~100">51~100</option>
                    <option value="100以上">100以上</option>
                </select>
            </label>
            <label class="search_grid_4" id="guanti" style="display: none"> 罐体容积(立方米):
                <select name="guanti_select" id="guanti_select" class="form-control">
                    <option value="≤0.5">≤0.5</option>
                    <option value="0.6~1">0.6~1</option>
                    <option value="1~2">1~2</option>
                    <option value="2以上">2以上</option>
                </select>
            </label>
            <label class="search_grid_4" id="shiyong" style="display: none"> 适用人数(人):
                <select name="shiyong_select" id="shiyong_select" class="form-control">
                    <option value="1-5人">1-5人</option>
                    <option value="5-10人">5-10人</option>
                    <option value="10人以上">10人以上</option>
                </select>
            </label>
            <label class="search_grid_4" id="caizhi1" style="display: none">材质:
                <select name="caizhi1_select" id="caizhi1_select" class="form-control">
                    <option value="玻璃钢">玻璃钢</option>
                    <option value="PP">PP</option>
                    <option value="PE">PE</option>
                    <option value="预制钢筋混凝土">预制钢筋混凝土</option>
                    <option value="其他">其他</option>
                </select></label>
            <label class="search_grid_4" id="caizhi2" style="display: none">材质:
                <select name="caizhi2_select" id="caizhi2_select" class="form-control">
                    <option value="玻璃钢">玻璃钢</option>
                    <option value="PP">PP</option>
                    <option value="PE">PE</option>
                    <option value="预制钢筋混凝土">预制钢筋混凝土</option>
                    <option value="不锈钢">不锈钢</option>
                </select></label>
            <label class="search_grid_4" id="shouming1" style="display: none">使用寿命:
                <select name="life1_select" id="life1_select" class="form-control">
                    <option value="50年以内">50年以内</option>
                    <option value="50年及以上">50年及以上</option>
                </select></label>
            <label class="search_grid_4" id="shouming2" style="display: none">使用寿命:
                <select name="life2_select" id="life2_select" class="form-control">
                    <option value="20年以内">20年以内</option>
                    <option value="20年及以上">20年及以上</option>
                </select></label>

            <label class="search_grid_4" id="jiage1" style="display: none">价格（万元）:
                <select name="price1_select" id="price1_select" class="form-control">
                    <option value="0.5以内">0.5以内</option>
                    <option value="0.5~1">0.5~1</option>
                    <option value="1~1.5">1~1.5</option>
                    <option value="1.5~2">1.5~2</option>
                    <option value="2以上">2以上</option>
                </select>
            </label>
            <label class="search_grid_4" id="jiage2" style="display: none">价格（万元）:
                <select name="price2_select" id="price2_select" class="form-control">
                    <option value="0.5以内">0.5以内</option>
                    <option value="0.5~1">0.5~1</option>
                    <option value="1~1.5">1~1.5</option>
                    <option value="1.5~2">1.5~2</option>
                </select>
            </label>
            <label class="search_grid_4" id="qingli" style="display: none">清理周期:
                <select name="clean_select" id="clean_select" class="form-control">
                    <option value="≤3个月">≤3个月</option>
                    <option value="4~6个月">4~6个月</option>
                    <option value="7~12个月">7~12个月</option>
                    <option value="12个月及以上">12个月及以上</option>
                </select></label>
            <label class="search_grid_4" id="yongtu" style="display: none">用途:
                <select name="clean_select" id="yongtu_select" class="form-control">
                    <option value="户厕">户厕</option>
                    <option value="公厕">公厕</option>
                    <option value="均可">均可</option>
                </select></label>
        </div>
        <div class="grid_12" align="center" style="">
            <button type="submit" style="width: 300px; margin-bottom: 5px" onclick="productSearch()">搜索</button>
        </div>
    </form>
</div>

<div class="grid_12" id="model_search" style="margin-bottom: 10px; border:1px solid #59b7c2; display: none">
    <form action="${pageContext.request.contextPath}/search/mode/results" enctype="multipart/form-data" method="post"
          accept-charset="UTF-8" class="search">

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

        <div class="grid_12">

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>温度条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="natureTemp[]" value="寒冷地区"
                                                                           style="margin-bottom:5px;"/>寒冷地区
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="natureTemp[]" value="普通地区"
                                                                          style="margin-bottom:5px;" checked/>普通地区
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;">
                    <div style="color: #99abb4;font-size: 4px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;寒冷地区主要指东北、内蒙古和新疆北部、西藏北部、青海等地区，累年最冷月平均温度≤10℃或日平均≤5℃的天数，一般在145天以上地区，以及我国北京、天津、河北、山<br/>东、山西、宁夏、山西大部、辽宁南部、甘肃中东部、新疆南部、河南、安徽、江苏北部以及西藏南部等地区。其主要指标为：最冷月平均温度0~10℃，辅助指标为：日平均温度<br/>≤5℃的天数为90~145d。
                    </div>
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>水资源条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="water[]" value="缺水"
                                                                           style="margin-bottom:5px;"/>缺水
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="water[]" value="良好"
                                                                          style="margin-bottom:5px;" checked/>良好
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;">
                    <div style="color: #99abb4;font-size: 4px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;缺水地区指年降水量＜200mm的干旱区域及人均水资源量＜600m3的缺水地区，如北京、天津、河北、山西、山东、新疆等地区。除缺水地区外，其他地区统称良好地区。
                    </div>
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>地形条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="terrain[]" value="平原"
                                                                           style="margin-bottom:5px;" checked/>平原
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="丘陵"
                                                                          style="margin-bottom:5px;"/>丘陵
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="山地"
                                                                          style="margin-bottom:5px;"/>山地
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="高原"
                                                                          style="margin-bottom:5px;"/>高原
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="terrain[]" value="盆地"
                                                                          style="margin-bottom:5px;"/>盆地
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;">
                    <div style="color: #99abb4;font-size: 4px;">&nbsp;&nbsp;&nbsp;&nbsp;平原地形是指海拔200米以下，平坦开阔的区域，一般分布在河流沿岸和沿海地区。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;丘陵指绝对高度在500米以内，相对高度不超过200米，起伏不大，坡度较缓，地面崎岖不平，由连绵不断的低矮山丘组成的地形。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;山地地形是指海拔在500米以上的高地，起伏很大，坡度陡峻，沟谷幽深，一般多呈脉状分布。分为高山、中山和低山。海拔在3500米以上为高山，海拔在1000-3500米为中山，<br/>海拔低于1000米为低山。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;高原地形通常是指海拔高度在1000米以上，面积广大，地形开阔，周边以明显的陡坡为界，比较完整的大面积隆起地区。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;盆地地形是指主要特征是四周高，中部低，因盆状得名的地区。<br/>
                    </div>
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>村庄条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="geolocation[]" value="中心镇"
                                                                           style="margin-bottom:5px;"/>中心镇
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="一般镇"
                                                                          style="margin-bottom:5px;"/>一般镇
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="中心村"
                                                                          style="margin-bottom:5px;"/>中心村
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="geolocation[]" value="基层村"
                                                                          checked
                                                                          style="margin-bottom:5px;"/>基层村
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;color: #99abb4;font-size: 4px;"><p>
                    &nbsp;&nbsp;&nbsp;&nbsp;中心镇至县域城镇体系规划中的各分区内，在经济、社会和空间发展中发挥中心作用的镇。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;一般镇指在县域城镇体系规划中，中心镇以外的镇。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;中心村指镇域镇村体系规划中，设有兼为周围村服务的公共设施的村。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;基层村指镇域镇村体系规划中，中心村以外的村。<br/>
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
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="ecotope[]" value="普通地区"
                                                                          checked
                                                                          style="margin-bottom:5px;"/>普通地区
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
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="density[]" value="密集"
                                                                           style="margin-bottom:5px;"/>密集
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="density[]" value="分散"
                                                                          style="margin-bottom:5px;"/>分散
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="density[]" value="普通"
                                                                          style="margin-bottom:5px;" checked/>普通
                </div>
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;color: #99abb4;font-size: 4px;">
                &nbsp;&nbsp;&nbsp;&nbsp;聚集地区指村庄布局紧凑，人口密集，居民点集中的较集中区域。
                &nbsp;&nbsp;&nbsp;&nbsp;分散地区指村庄布局分散，且单村人口密度较小的地区。
                &nbsp;&nbsp;&nbsp;&nbsp;其他地区统称为普通地区。
            </div>

            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>需要形成液态肥:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="usageHabits[]" value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="usageHabits[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="usageHabits[]" value="均可"
                                                                          checked
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
                <div style="float:left;padding:0 5px;"><label>计划修建或已具有管网条件:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="sewerLines[]"
                                                                           value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="sewerLines[]"
                                                                          value="否"
                                                                          style="margin-bottom:5px;" checked/>否
                </div>
            </div>


        </div>

        <div class="grid_12" style="">
            <label class="grid_11" style="border-bottom-style:solid; border-width:1px;">资源化利用条件:</label>
        </div>

        <div class="grid_12" style="">
            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>计划建设或已有沼气利用工程:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="biogasUtilization[]"
                                                                           value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="biogasUtilization[]"
                                                                          value="否"
                                                                          style="margin-bottom:5px;" checked/>否
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>计划与其他生活污水混合处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="mixedTreatment[]"
                                                                           value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="mixedTreatment[]" value="否"
                                                                          style="margin-bottom:5px;"/>否
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="mixedTreatment[]"
                                                                          value="均可"
                                                                          checked
                                                                          style="margin-bottom:5px;"/>均可
                </div>
            </div>


            <div class="grid_12"
                 style="float:left;height:100%;border-bottom-width: 10px;margin-bottom: 5px;">
                <div style="float:left;padding:0 5px;"><label>计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理:</label></div>
                <div style="float:left;padding:0px 50px 0px 100px;"><input type="radio" name="otherTreatment[]"
                                                                           value="是"
                                                                           style="margin-bottom:5px;"/>是
                </div>
                <div style="float:left;padding:0px 50px 0px 50px;"><input type="radio" name="otherTreatment[]" value="否"
                                                                          style="margin-bottom:5px;" checked/>否
                </div>
            </div>


        </div>

        <div class="grid_12" align="center" style="">
            <button type="submit" style="width: 300px; margin-bottom: 5px" onclick="search()">搜索</button>
        </div>
    </form>
</div>

<%-- js --%>
<script src="${pageContext.request.contextPath}/static/product/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/product/js/selectBox.js"></script>
<script>
    function product_search_action() {
        document.getElementById('model_search').style.display = "none";
        if (document.getElementById('product_search').style.display == "none") {
            document.getElementById('product_search').style.display = "";
            document.getElementById('block_nav_primary').style.display = "none";
            document.getElementById('main').style.display = "none";
        } else {
            document.getElementById('product_search').style.display = "none";
            document.getElementById('block_nav_primary').style.display = "";
            document.getElementById('main').style.display = "";
        }


    }

    function change(){
        //化粪池式厕所 双瓮漏斗式厕所
        var product_select = document.getElementById("type_select");
        if(product_select.value === '化粪池式厕所' || product_select.value === '双瓮漏斗式厕所'){
            $("#guige").css("display","block");
            $("#guanti").css("display","none");
            $("#caizhi1").css("display","block");
            $("#caizhi2").css("display","none");
            $("#shouming1").css("display","block");
            $("#shouming2").css("display","none");
            $("#jiage1").css("display","block");
            $("#jiage2").css("display","none");
            $("#qingli").css("display","block");
            $("#yongtu").css("display","block");
            $("#shiyong").css("display","none");
        }

        //双坑交替式厕所
        else if(product_select.value === '双坑交替式厕所'){
            $("#guige").css("display","none");
            $("#guanti").css("display","block");
            $("#caizhi1").css("display","none");
            $("#caizhi2").css("display","block");
            $("#shouming1").css("display","none");
            $("#shouming2").css("display","block");
            $("#jiage1").css("display","none");
            $("#jiage2").css("display","block");
            $("#qingli").css("display","block");
            $("#yongtu").css("display","block");
            $("#shiyong").css("display","block");
        }else{
            $("#guige").css("display","none");
            $("#guanti").css("display","none");
            $("#caizhi1").css("display","none");
            $("#caizhi2").css("display","none");
            $("#shouming1").css("display","none");
            $("#shouming2").css("display","none");
            $("#jiage1").css("display","none");
            $("#jiage2").css("display","none");
            $("#qingli").css("display","none");
            $("#yongtu").css("display","none");
            $("#shiyong").css("display","none");
        }
    }

    function model_search_action() {
        document.getElementById('product_search').style.display = "none";
        if (document.getElementById('model_search').style.display == "none") {
            document.getElementById('model_search').style.display = "";
            document.getElementById('block_nav_primary').style.display = "none";
            document.getElementById('main').style.display = "none";
        } else {
            document.getElementById('model_search').style.display = "none";
            document.getElementById('block_nav_primary').style.display = "";
            document.getElementById('main').style.display = "";
        }
    }
    // fixme 模式搜索接口
    function search(){
        var data = new FormData();

        var radio = document.getElementsByName("wc_type[]"); //厕所用途
        const cesuoyongtu = getRadioValue(radio);
        data.append("toiletPurpose", encodeURI(cesuoyongtu));

        radio = document.getElementsByName("natureTemp[]"); //温度条件
        const wendu = getRadioValue(radio);
        data.append("natureTemp", encodeURI(wendu));

        radio = document.getElementsByName("water[]"); //水资源条件
        const shui = getRadioValue(radio);
        data.append("water", encodeURI(shui));

        radio = document.getElementsByName("terrain[]"); //地形条件
        const dixing = getRadioValue(radio);
        data.append("terrain", encodeURI(dixing));

        radio = document.getElementsByName("geolocation[]"); //村庄条件
        const cunzhuang = getRadioValue(radio);
        data.append("geolocation", encodeURI(cunzhuang));

        radio = document.getElementsByName("ecotope[]"); //生态限制条件
        const shengtai = getRadioValue(radio);
        data.append("ecotope", encodeURI(shengtai));

        radio = document.getElementsByName("density[]"); //人口密集程度
        const renkou = getRadioValue(radio);
        data.append("density", encodeURI(renkou));

        radio = document.getElementsByName("usageHabits[]"); //需要形成液态肥
        const yetaifei = getRadioValue(radio);
        data.append("usageHabits", encodeURI(yetaifei));

        radio = document.getElementsByName("sewageTreatment[]"); //计划修建或已具有管网条件
        const guanwang = getRadioValue(radio);
        data.append("sewerLines", encodeURI(guanwang));

        radio = document.getElementsByName("biogasUtilization[]"); //计划建设或已有沼气利用工程
        const zhaoqi = getRadioValue(radio);
        data.append("biogasUtilization", encodeURI(zhaoqi));

        radio = document.getElementsByName("mixedTreatment[]"); //计划与其他生活污水混合处理
        const wushui = getRadioValue(radio);
        data.append("mixedTreatment", encodeURI(wushui));

        radio = document.getElementsByName("otherTreatment[]"); //计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理
        const qita = getRadioValue(radio);
        data.append("otherTreatment", encodeURI(qita));

        $.ajax({
            url: "/toilet/pattern/search",
            type: "POST",
            dataType: "json",
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.success) {
                    location.reload();
                } else {
                }
            }
        });
    }
</script>
</html>
