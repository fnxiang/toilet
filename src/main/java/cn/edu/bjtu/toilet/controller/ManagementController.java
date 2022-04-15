package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ManagementController {

    @Resource
    private UserService userService;

    @Resource
    private ProductService productService;

    @RequestMapping("/company/index")
    public String companyIndex(HttpServletRequest request){
        String email = request.getSession().getAttribute("uId").toString();
        List<ToiletProductDTO> productDTOList = productService.queryAllProductList(email);
        request.setAttribute("productList", productDTOList);
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
        String email = request.getSession().getAttribute("uId").toString();
        switch (url){
            case "company_back1":
                List<ToiletProductDTO> productDTOList = productService.queryAllProductList(email);
                request.setAttribute("productList", productDTOList);
                break;
            case "company_back2":
                UserDO userDO = userService.queryUserByEmail(email);
                userDO.setPassword("");
                request.setAttribute("user", userDO);
                break;
            case "company_back3":
                //TODO
                break;
            default:
                break;
        }



        url = MANAGE_BASE + url;
        return url;
    }
}
