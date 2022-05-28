package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.UserRole;
import cn.edu.bjtu.toilet.constant.UserStatus;
import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.domain.CommandResponse;
import cn.edu.bjtu.toilet.domain.CompanyRegisterRequest;
import cn.edu.bjtu.toilet.domain.dto.EnterpriseAddressDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.CompanyService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.service.UserService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ManagementController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

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

    @RequestMapping("/company/info/update")
    @ResponseBody
    public CommandResponse updateCompanyInfo(HttpServletRequest request){
        try {
            Map<String, String> params = ParameterUtil.resolveParams(request);

            CompanyDO companyDO = resolveCompanyParams(params);
            companyService.updateCompany(companyDO);
        } catch (Exception e) {
            LOG.error("update company info error with : {}", e.getMessage());
            return CommandResponse.failed(e.getMessage());
        }
        return CommandResponse.success();
    }

    @RequestMapping("/admin/index")
    public String adminIndex(HttpServletRequest request){

        List<UserDO> users = userService.queryAllUser(UserRole.PROFESSOR);
        List<CompanyDO> companyDOS = companyService.queryAllCompany();

        request.setAttribute("profList", users);
        request.setAttribute("companyList", companyDOS);

        return ADMIN_INDEX;
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
            case "company_back6":
                String productId = request.getParameter("productId");
                ToiletProductDTO productDTO = productService.queryToiletById(productId);
                request.setAttribute("product", productDTO);
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
            default:
                break;
        }



        url = MANAGE_BASE + url;
        return url;
    }

    private CompanyDO resolveCompanyParams(Map<String, String> params) {

        CompanyDO companyDO = new CompanyDO();
        companyDO.setCompanyName(params.get("companyName"));
        companyDO.setCreditCode(params.get("creditCode"));
        companyDO.setEmail(params.get("email"));
        companyDO.setOfficialSite(params.get("webAddress"));
        companyDO.setContactName(params.get("contactName"));
        companyDO.setContactPhone(params.get("phoneNum"));
        companyDO.setBusinessLicenseFilePath(params.get("filePath"));

        EnterpriseAddressDTO enterpriseAddress = new EnterpriseAddressDTO();
        String companyAddress = params.get("companyAddress");
        String detailAddress = params.get("detailAddress");

        List<String> address = Lists.newArrayList(companyAddress.split(","));

        if (CollectionUtils.isEmpty(address) || address.size()<3) {
            return null;
        }

        enterpriseAddress.setProvince(address.get(0));
        enterpriseAddress.setCity(address.get(1));
        enterpriseAddress.setCountry(address.get(2));

        enterpriseAddress.setDetailAddress(detailAddress);

        companyDO.setEnterpriseAddress(JSON.toJSONString(enterpriseAddress));

        return companyDO;
    }
}
