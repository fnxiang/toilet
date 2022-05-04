package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ManagementController {

    @Resource
    private CompanyService companyService;

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
    public String adminIndex(HttpServletRequest request){

        List<UserDO> users = userService.queryAllUser(UserRole.PROFESSOR);
        List<CompanyDO> companyDOS = companyService.queryAllCompany();

        request.setAttribute("profList", users);
        request.setAttribute("companyList", companyDOS);

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
                CompanyDO companyDO = companyService.queryCompanyByEmail(email);
                companyDO.setPassword("");
                request.setAttribute("user", companyDO);
                break;
            case "company_back3":
                //TODO
                break;
            case "professor_back3":
                UserDO userDO = userService.queryUserByEmail(email);
                userDO.setPassword("");
                request.setAttribute("user", userDO);
                break;
            case "admin_back1":
                // fixme 审核完后刷新无数据
                List<UserDO> users = userService.queryAllUser(UserRole.PROFESSOR);
                List<CompanyDO> companyDOS = companyService.queryAllCompany();

                request.setAttribute("profList", users);
                request.setAttribute("companyList", companyDOS);
            case "admin_back2":
                users = userService.queryAllUser(UserRole.PROFESSOR).stream().filter(user -> user.getStatus().equals(UserStatus.WAIT_APPROVE.getCode())).collect(Collectors.toList());
                companyDOS = companyService.queryAllCompany().stream().filter(user -> user.getStatus().equals(UserStatus.WAIT_APPROVE.getCode())).collect(Collectors.toList());

                request.setAttribute("profList", users);
                request.setAttribute("companyList", companyDOS);
                break;
            case "admin_back3":
                List<ToiletProductDTO> allList = productService.queryAllProductList("");
                request.setAttribute("productList", allList);
                break;
            default:
                break;
        }



        url = MANAGE_BASE + url;
        return url;
    }
}
