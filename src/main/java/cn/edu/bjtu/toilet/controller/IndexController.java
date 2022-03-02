package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    @RequestMapping(value = "/index")
    public String index(){
        return "/base/login_final";
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request){
        String content = request.getParameter("content");

        return "/base/login_final";
    }

    @RequestMapping(value = "/register")
    public String register(){
        return "/base/register_final";
    }
}
