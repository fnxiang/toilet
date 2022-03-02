package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

    @RequestMapping("/product/index")
    public String product(){
        return "/product/index_formal";
    }

    @RequestMapping("/toProductPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = "/product/" + url;
        return url;
    }

}
