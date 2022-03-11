package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserConstants;
import cn.edu.bjtu.toilet.dao.UserDao;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Objects;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class IndexController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());


    @Resource
    private UserService userService;

    @Resource
    private UserDao userDao;

    /**
     * page handle
     * */

    @RequestMapping(value = "/login/index")
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
    public Boolean login(HttpServletRequest request, HttpServletResponse response){

        try {
            String id = request.getParameter("accountId");
            String pwd = request.getParameter("accountPwd");

            Integer roleCode = userService.checkUser(id, pwd);
            UserConstants userConstants = UserConstants.codeOf(roleCode);
            if (Objects.isNull(userConstants)) {
                return false;
            }

            request.getSession().setAttribute("uId", id);
            request.getSession().setAttribute("role", userConstants.getRole());
            return true;
        }catch (Exception exception) {
            LOG.error("IndexController login error! request: {}", request);
        }
        return false;
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
