package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    @RequestMapping(value = "/login")
    public String index(){
        return "/base/login_final";
    }

    @RequestMapping(value = "/login_final")
    public String login(HttpServletRequest request){
        String content = request.getParameter("content");

        return "/base/login_final";
    }

    @RequestMapping(value = "/register_company")
    public String register_company(){
        return "/base/register_final";
    }

    @RequestMapping(value = "/register_professor")
    public String register_professor(){
        return "base/register_professor";
    }

    @RequestMapping(value = "/toBasePage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = "/base/" + url;
        return url;
    }
}
