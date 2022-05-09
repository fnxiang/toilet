package cn.edu.bjtu.toilet.controller;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.response.PatternQueryResponse;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import cn.edu.bjtu.toilet.utils.ParameterUtil;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.ERROR_PAGE;
import static cn.edu.bjtu.toilet.constant.PageIndexPathConstants.INDEX;

@Controller
public class PatternController {

    private final Logger LOG = LoggerFactory.getLogger(getClass());

    @Resource
    private PatternService patternService;

    @RequestMapping("/pattern/sort")
    public String sortPattern(HttpServletRequest request) {
        try {
            PatternQueryResponse response;
            Map<String, String> params = ParameterUtil.resolveParams(request);
            if (params.size()==0) {
                return ERROR_PAGE;
            }
            PatternSortRequest sortRequest = buildSortPatternRequest(params);
            ToiletPatternDTO searchCondition = JSON.parseObject(params.get("search_condition"), ToiletPatternDTO.class);

            if (searchCondition == null) {
                response = patternService.sortPattern(sortRequest);
            } else {
                response = patternService.sortPatternWithCondition(sortRequest, searchCondition);

            }
            request.setAttribute("search_condition", params.get("search_condition"));
            request.setAttribute("sort_condition", params.get("sortBy"));
            request.setAttribute("sort_way", params.get("desc"));

            request.setAttribute("patternList", response.getPatternDTOList());
        } catch (Exception e) {
            LOG.error("PatternController -> sortPattern ,sort pattern failed : {}", e.getMessage());
        }

        return "/product/mode_list";
    }

    private PatternSortRequest buildSortPatternRequest(Map<String, String> params) {
        PatternSortRequest request = new PatternSortRequest();
        request.setIsDesc(params.get("isDesc").equals("true"));
        request.setSortBy(params.get("sortBy"));

        if (!StringUtils.isEmpty(params.get("index"))) {
            request.setPageIndex(Integer.valueOf(params.get("index")));
        }

        if (!StringUtils.isEmpty(params.get("size"))) {
            request.setPageSize(Integer.valueOf(params.get("size")));
        }


        if (params.get("patternIds") != null) {
            List<Integer> patternIds = JSON.parseArray(params.get("patternIds"), ToiletPatternDO.class).stream()
                    .map(ToiletPatternDO::getId)
                    .collect(Collectors.toList());
            request.setPatternIds(patternIds);

        }

        return request;
    }
}
