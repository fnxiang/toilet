package cn.edu.bjtu.toilet.controller;


import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private CompanyService companyService;
}
