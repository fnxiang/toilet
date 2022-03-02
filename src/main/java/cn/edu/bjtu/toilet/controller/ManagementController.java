package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManagementController {

    @RequestMapping("/company/index")
    public String companyIndex(){
        return "/manage/company_back1";
    }

    @RequestMapping("/admin/index")
    public String adminIndex(){
        return "/manage/admin_back1";
    }

    @RequestMapping("/professor/index")
    public String professorIndex(){
        return "/manage/professor_back1";
    }

    @RequestMapping("/toPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = "/manage/" + url;
        return url;
    }
}
