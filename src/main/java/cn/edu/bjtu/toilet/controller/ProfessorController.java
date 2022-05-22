package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.CommandResponse;
import cn.edu.bjtu.toilet.domain.response.ProfessorResponse;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private UserService userService;

    @RequestMapping(value = "/product/audit")
    public ProfessorResponse auditProduct(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String auditStatus = params.get("auditStatus");
            String comment = params.get("comment");
            

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return ProfessorResponse.success();
    }

    @RequestMapping(value = "/get")
    @ResponseBody
    public ProfessorResponse response(HttpServletRequest request) {
        ProfessorResponse response = new ProfessorResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);
            List<UserDO> userDOS;
            if (StringUtils.isEmpty(params.get("pEmail"))) {
                userDOS = userService.queryAllUser(UserRole.PROFESSOR);
            } else {
                userDOS = Lists.newArrayList(userService.queryUserByEmail(params.get("pEmail")));
            }

            response.setNameList(userDOS.stream().map(UserDO::getName).collect(Collectors.toList()));
            response.setSuccess(true);

        } catch (Exception e) {
            LOG.error("ProfessorResponse error with : ", e);
            return ProfessorResponse.failed(e.getMessage());
        }
        return response;
    }
}
