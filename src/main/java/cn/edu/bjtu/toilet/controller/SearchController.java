package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.domain.SearchResponse;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import java.util.Map;

@Controller
public class SearchController {


    /**
     * 产品高级搜索：规格、材质、使用寿命、价格（万元）、清理周期
     *
     * */
    @RequestMapping("/search/product")
    public SearchResponse productSearch(HttpServletRequest request) {

        try {
            Map<String, String> params = ParameterUtil.resolveParams(request, "");
        } catch (Exception e) {
            return SearchResponse.failed("error");
        }

        return SearchResponse.success();
    }
}
