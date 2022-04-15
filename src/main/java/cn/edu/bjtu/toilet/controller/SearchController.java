package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.SEARCH_INDEX;

@Controller
public class SearchController {


    @RequestMapping("/search/product")
    public String productSearch(HttpServletRequest request) {



        return SEARCH_INDEX;
    }
}
