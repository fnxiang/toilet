package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.constant.ProductType;
import cn.edu.bjtu.toilet.domain.ProductResponse;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.INDEX;
import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.PRODUCT_BASE;

@Controller
public class ProductController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    public static final String UPLOAD_DIRECTORY = "/upload/product/";


    @RequestMapping("/")
    public String index(){
        return INDEX;
    }

    @RequestMapping("/toProductPage")
    public String toPage(HttpServletRequest request){
        String url = request.getParameter("url");
        url = PRODUCT_BASE + url;
        return url;
    }

    @RequestMapping(value = "/product/entry", method = RequestMethod.POST)
    public ProductResponse productEntry(HttpServletRequest request) {
        try {
            Map<String, String> params = resolveParams(request);
            if (Objects.isNull(params)) {
                return ProductResponse.failed("resolve params error");
            }

            ToiletProductDTO toiletProductDTO = buildProductDTO(params);

        } catch (Exception e) {
            LOG.error("upload products failed");
        }
        return ProductResponse.success();
    }

    private ToiletProductDTO buildProductDTO(Map<String, String> params) {
        ToiletProductDTO productDTO = new ToiletProductDTO();
        productDTO.setProductName(params.get("productName"));
        productDTO.setManufacturerName(params.get("factoryName"));
        productDTO.setManufacturerCell(params.get("factoryNum"));
        productDTO.setProductType(ProductType.valueOf(params.get("productType")).getCode());
        productDTO.setPatternType(params.get("patternType"));
        productDTO.setPatternName(params.get("patternName"));
        productDTO.setApplicableProvince(params.get("provinces"));
        productDTO.setApplicableTemperature(params.get("temperature"));

        return productDTO;
    }


    private Map<String, String> resolveParams(HttpServletRequest request) throws Exception {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<String> fileNames = Lists.newArrayList("qualityMaterial", "introductions", "pics");
        Set<String> allowTypes = Sets.newHashSet("doc", "docx", "pdf", "jpg", "jpeg", "png");

        List<FileItem> items = upload.parseRequest(request);
        Map<String, String> params = new HashMap<>();
        String uploadPath = request.getServletContext().getRealPath(".")+File.separator+UPLOAD_DIRECTORY+request.getSession().getAttribute("Id")+File.separator;

        File uploadDir = new File(uploadPath);
        System.out.println(uploadPath);
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdirs()) {
                return null;
            }
        }
        for (FileItem item : items) {
            if(item.isFormField()) {
                params.put(item.getFieldName(), decodeJsString(item.getString()));
            } else {
                if (item.getName() != null && fileNames.contains(item.getFieldName())) {
                    String name = item.getName();
                    String type = name.substring(name.lastIndexOf('.') + 1);

                    if (!allowTypes.contains(type)) {
                        LOG.error("文件格式不支持");
                    } else {
                        int start = name.lastIndexOf("\\");
                        String filename = name.substring(start + 1);
                        String filePath = uploadPath + "/" + filename;
                        File file = new File(filePath);
                        item.write(file);
                        params.put("filePath", filePath);
                    }
                }
            }
        }
        return params;
    }

    private String decodeJsString(String value) throws UnsupportedEncodingException {
        return URLDecoder.decode(value, "UTF-8");
    }

}
