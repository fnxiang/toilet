package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.converter.CompanyConverter;
import cn.edu.bjtu.toilet.converter.UserConverter;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.UserDTO;
import cn.edu.bjtu.toilet.domain.response.CommandResponse;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.service.request.ApprovalRequest;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.MANAGE_BASE;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private UserService userService;

    @Resource
    private CompanyService companyService;

    @Resource
    private PatternService patternService;

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
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }

    @RequestMapping(value = "/product/delete")
    @ResponseBody
    public CommandResponse deleteProduct(HttpServletRequest request) {
        CommandResponse response = new CommandResponse();
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            String productId =  params.get("productId");
            productService.deleteProduct(productId);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("error happened: {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }

        return response;
    }



    @RequestMapping("/toPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        String email = request.getSession().getAttribute("uId").toString();
        String productId = request.getParameter("productId");
        switch (url){
            case "admin_back1":
                List<UserDO> users = userService.queryAllUser(UserRole.PROFESSOR);
                List<CompanyDO> companyDOS = companyService.queryAllCompany();

                request.setAttribute("profList", users);
                request.setAttribute("companyList", companyDOS);
                break;
            case "admin_back2":
                List<UserDO> check_users = userService.queryAllUser(UserRole.PROFESSOR).stream().filter(user -> user.getStatus().equals(UserStatus.WAIT_APPROVE.getCode())).collect(Collectors.toList());
                List<CompanyDO> checkCompanyDOS = companyService.queryAllCompany().stream().filter(user -> user.getStatus().equals(UserStatus.WAIT_APPROVE.getCode())).collect(Collectors.toList());

                request.setAttribute("profList", check_users);
                request.setAttribute("companyList", checkCompanyDOS);
                break;
            case "admin_back3":
                List<ToiletProductDTO> allList = productService.queryAllProductList("");
                request.setAttribute("productList", allList);
                break;
            case "admin_back4":
                PatternSortRequest sortRequest = buildPatternQueryRequest(email);
                List<ToiletPatternDTO> patternDTOS = patternService.queryPatternWithStatus(sortRequest);
                request.setAttribute("patternList", patternDTOS);
                break;
            case "admin_back7":
                String queryEmail = request.getParameter("email");
                UserDO userDO = userService.queryUserByEmail(queryEmail);
                UserDTO userDTO = UserConverter.toUserDTO(userDO);
                request.setAttribute("user", userDTO);
                break;
            case "admin_back6":
            case "admin_back9":
                ToiletProductDTO productDTO = productService.queryToiletById(productId);
                CompanyDO company = companyService.queryCompanyByEmail(productDTO.getCompanyEmail());
                request.setAttribute("product", productDTO);
                request.setAttribute("company", CompanyConverter.toCompanyDTO(company));
                break;
            default:
                break;
        }

        url = MANAGE_BASE + url;
        return url;
    }

    private PatternSortRequest buildPatternQueryRequest(String email) {
        PatternSortRequest sortRequest = new PatternSortRequest();
        sortRequest.setIsDesc(false);
        sortRequest.setSortBy("id");
        sortRequest.setPageSize(100);
        sortRequest.setAuditStatuses(Lists.newArrayList(AuditStatus.UNKNOWN, AuditStatus.WAITED, AuditStatus.PROCESSING, AuditStatus.APPROVAL, AuditStatus.DENY, AuditStatus.WAITED_AMEND));
        sortRequest.setEmail(email);
        return sortRequest;
    }
}
