package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/assign")
    @ResponseBody
    public CommandResponse assign(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId =  params.get("productId");
            String professorEmail = params.get("professorEmail");

            ToiletProductDTO productDTO = productService.queryToiletById(productId);

            UserDO userDO = userService.queryUserByEmail(professorEmail);

            productDTO.setProfessorId(userDO.getId());
            productDTO.setProfessorEmail(professorEmail);

            productService.updateProduct(productDTO);

            response.setSuccess(true);

        } catch (Exception e) {
            LOG.error("error happened: {}", e);
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }
}
