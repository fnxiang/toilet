package cn.edu.bjtu.toilet.utils;

import com.google.common.collect.Sets;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ParameterUtil {

    private static final String UPLOAD_DIRECTORY = "/upload/register/";
    private static Set<String> allowTypes = Sets.newHashSet("doc", "docx", "pdf", "jpg", "jpeg", "png", "PNG");

    public static Map<String, String> resolveParams(HttpServletRequest request, String outputPath) throws Exception {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Map<String, String> params = new HashMap<>();

        List<FileItem> items = upload.parseRequest(request);
        String uploadPath = buildUploadPath(request);

        File uploadDir = new File(uploadPath);
        System.out.println(uploadPath);
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdirs()) {
                return null;
            }
        }

        for (FileItem item : items) {
            if(item.isFormField()) {
                String fieldName = item.getFieldName();
                if (!StringUtils.isEmpty(params.get(fieldName))) {
                    params.put(fieldName, buildMulti(params.get(fieldName), decodeJsString(item.getString())));
                }else {
                    params.put(fieldName, decodeJsString(item.getString()));
                }
            } else {
                if (item.getName() != null) {
                    String name = item.getName();
                    String type = name.substring(name.lastIndexOf('.') + 1);

                    if (!allowTypes.contains(type)) {
                        throw new FileUploadException();
                    } else {
                        int start = name.lastIndexOf("\\");
                        String filename = name.substring(start + 1);
                        String filePath = uploadPath + "/" + filename;
                        String relativePath = filePath.replace(request.getServletContext().getRealPath("."), "");
                        File file = new File(filePath);
                        item.write(file);
                        params.put(item.getFieldName(), relativePath);
                    }
                }
            }
        }
        return params;
    }

    private static String buildMulti(String origin, String append) {
        return origin + "," + append;
    }

    private static String decodeJsString(String value) throws UnsupportedEncodingException {
        return URLDecoder.decode(new String(value.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8), "UTF-8");
    }

    private static String buildUploadPath(HttpServletRequest request) {
        if (request.getSession().getAttribute("uId") != null) {
            return request.getServletContext().getRealPath(".")+ File.separator +"upload/"+request.getSession().getAttribute("uId").toString()+File.separator;
        } else {
            return request.getServletContext().getRealPath(".") + File.separator + UPLOAD_DIRECTORY;
        }
    }
}
