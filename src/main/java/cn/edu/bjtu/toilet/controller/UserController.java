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

    @RequestMapping(value = "/admin/approve")
    @ResponseBody
    public CommandResponse approveUser(HttpServletRequest request) {
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            if (params.size() == 0) {
                return CommandResponse.failed("请求参数错误");
            }

            String userEmail = params.get("userEmail");
            Integer roleCode = Integer.valueOf(params.get("roleCode"));

            UserRole role = UserRole.codeOf(roleCode);


            if (role.equals(UserRole.PROFESSOR)) {
                UserDO userDO = userService.queryUserByEmail(userEmail);
                userDO.setStatus(UserStatus.ALLOWED.getCode());
                userService.saveProfessorUser(userDO);
            } else {
                CompanyDO companyDO = companyService.queryCompanyByEmail(userEmail);
                companyDO.setStatus(UserStatus.ALLOWED.getCode());
                companyService.saveCompany(companyDO);
            }

        } catch (ToiletBizException | ToiletSystemException e) {
            return CommandResponse.failed(e.getMessage());
        } catch (Exception e) {
            return CommandResponse.failed("Error happened :(");
        }

        return CommandResponse.success();
    }
}
