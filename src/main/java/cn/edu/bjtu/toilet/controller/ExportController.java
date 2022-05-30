package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.domain.ProductResponse;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ExportController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private ProductService productService;

    @RequestMapping("/products/export")
    @ResponseBody
    public ProductResponse exportProducts(HttpServletRequest request) {
        ProductResponse response = new ProductResponse();
        try {
            List<ToiletProductDTO> productDTOS = productService.queryAllProductList("");
            response.setProductList(productDTOS);
            response.setSuccess(true);
        } catch (Exception e) {
            LOG.error("export product error : {}", e.getMessage());
            return ProductResponse.failed(e.getMessage());
        }
        return response;
    }
}
