package cn.edu.bjtu.toilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ManagementController {

    @RequestMapping("/company/index")
    public String companyIndex(){
        return COMPANY_INDEX;
    }

    @RequestMapping("/admin/index")
    public String adminIndex(){
        return ADMIN_INDEX;
    }

    @RequestMapping("/professor/index")
    public String professorIndex(){
        return PROF_INDEX;
    }

    @RequestMapping("/toPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = MANAGE_BASE + url;
        return url;
    }
}
