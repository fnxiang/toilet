package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.INDEX;
import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.PRODUCT_BASE;

@Controller
public class ProductController {

    @RequestMapping("/")
    public String index(){
        return INDEX;
    }

    @RequestMapping("/toProductPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = PRODUCT_BASE + url;
        return url;
    }

}
