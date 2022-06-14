package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.AuditStatus;
import cn.edu.bjtu.toilet.domain.dto.ProductSearchConditionsDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.domain.request.ProductSortRequest;
import cn.edu.bjtu.toilet.domain.response.ProductQueryResponse;
import cn.edu.bjtu.toilet.service.AuditService;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.*;

@Controller
public class ProductController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private AuditService auditService;


    @RequestMapping("/")
    public String index(HttpServletRequest request) {
        try {
            ProductSortRequest queryRequest = new ProductSortRequest();
            queryRequest.setEmail("");
            queryRequest.setIsDesc(false);
            queryRequest.setSortBy("id");
            queryRequest.setAuditStatus(AuditStatus.APPROVAL);

            ProductQueryResponse response = productService.queryPageProduct(queryRequest);

            request.setAttribute("pageResponse", response);
            request.setAttribute("productList", response.getProductDTOList());
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save product error with {}", e.getMessage());
            return ERROR_PAGE;
        } catch (Exception e) {
            LOG.error("upload products failed : {}", e.getMessage());
            return ERROR_PAGE;
        }

        return INDEX;
    }

    @RequestMapping(value = "/product/next")
    public String toNextPage(HttpServletRequest request) {
        try {
            ProductSortRequest productSortRequest = buildSortProductRequest(request);
            ProductQueryResponse response = productService.queryPageProduct(productSortRequest);

            request.setAttribute("pageResponse", response);
            request.setAttribute("productList", response.getProductDTOList());
            return INDEX;
        } catch (Exception e) {
            LOG.error("query product page error : {}", e.getMessage());
            return ERROR_PAGE;
        }
    }

    @RequestMapping("/toProductPage")
    public String toPage(HttpServletRequest request) {
        String url = request.getParameter("url");
        try {
            switch (url) {
                case "product_info":
                    String productId = request.getParameter("product_id");
                    ToiletProductDTO toiletProductDTO = productService.queryToiletById(productId);
                    request.setAttribute("product", toiletProductDTO);
                    break;
                case "product_results":
                    String patternId = request.getParameter("patternId");

                    List<ToiletProductDTO> productDTOS = productService.queryProductListByPattern(Integer.valueOf(patternId));
                    request.setAttribute("productList", productDTOS);
                    return INDEX;
                case "next":
                    ProductSortRequest productSortRequest = buildSortProductRequest(request);
                    queryProducts(request, productSortRequest);
                    return INDEX;
                default:
                    break;
            }
        } catch (ToiletBizException | ToiletSystemException e) {
            LOG.error("save product error with {}", e.getMessage());
            return ERROR_PAGE;
        } catch (Exception e) {
            LOG.error("upload products failed : {}", e.getMessage());
            return ERROR_PAGE;
        }

        url = PRODUCT_BASE + url;
        return url;
    }

    @RequestMapping("/product/sort")
    public String sortProduct(HttpServletRequest request) {
        try {
            ProductSortRequest sortRequest = buildSortProductRequest(request);
            queryProducts(request, sortRequest);
        } catch (Exception e) {
            LOG.error("sort products failed :{}", e.getMessage());
            return ERROR_PAGE;
        }
        return INDEX;
    }

    private void queryProducts(HttpServletRequest request, ProductSortRequest sortRequest) {
        ProductQueryResponse response;
        if (sortRequest.getSearchCondition() == null) {
            response = productService.queryPageProduct(sortRequest);
        } else {
            response = productService.queryPageProductWithCondition(sortRequest, sortRequest.getSearchCondition());

        }
        request.setAttribute("product_search_condition", JSON.toJSONString(sortRequest.getSearchCondition()));
        request.setAttribute("sort_condition", sortRequest.getSortBy());
        request.setAttribute("sort_way", sortRequest.getIsDesc().toString());
        request.setAttribute("pageResponse", response);

        request.setAttribute("productList", response.getProductDTOList());
    }

    private ProductSortRequest buildSortProductRequest(HttpServletRequest request) throws Exception {
        Map<String, String> params = ParameterUtil.resolveParams(request);

        ProductSortRequest sortRequest = new ProductSortRequest();

        if (params.size() != 0) {
            sortRequest.setIsDesc(params.get("isDesc").equals("true"));
            sortRequest.setSortBy(params.get("sortBy"));
        } else {
            sortRequest.setIsDesc(false);
            sortRequest.setSortBy("id");
        }

        if (!StringUtils.isEmpty(params.get("product_search_condition"))) {
            ProductSearchConditionsDTO searchCondition = JSON.parseObject(params.get("product_search_condition"), ProductSearchConditionsDTO.class);
            sortRequest.setSearchCondition(searchCondition);
        }

        if (!StringUtils.isEmpty(params.get("pageIndex"))) {
            sortRequest.setPageIndex(Integer.valueOf(params.get("pageIndex")));
        }

        if (!StringUtils.isEmpty(params.get("pageSize"))) {
            sortRequest.setPageSize(Integer.valueOf(params.get("pageSize")));
        }
        sortRequest.setAuditStatus(AuditStatus.APPROVAL);
        return sortRequest;
    }



}
