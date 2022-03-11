package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class IndexController {

    @Resource
    private UserService userService;

    @Resource
    private UserDao userDao;

    /**
     * page handle
     * */

    @RequestMapping(value = "/login_final")
    public String index(){
        return LOGIN_INDEX;
    }

    @RequestMapping(value = "/register_company")
    public String register_company(){
        return REGISTER_INDEX;
    }


    @RequestMapping(value = "/register_professor")
    public String register_professor(){
        return PROF_REGISTER_INDEX;
    }

    @RequestMapping(value = "/toBasePage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = BASE + url;
        return url;
    }

    /**
     * request handle
     * */

    @RequestMapping(value = "/login")
    @ResponseBody
    public Boolean login(HttpServletRequest request){
        String id = request.getParameter("accountId");
        String pwd = request.getParameter("accountPwd");
        return userService.checkUser(id, pwd);
    }

    @RequestMapping(value = "/registerUser")
    @ResponseBody
    public String registerUser(){
        UserDO userDO = new UserDO();
        userDO.setEmail("1243@gmail.com");
        userDO.setPassword("1234");
        return userDao.insertUserDO(userDO);
    }

}
