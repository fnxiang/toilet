package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.converter.ProductConverter;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.request.PatternQueryRequest;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class PatternServiceImpl implements PatternService {

    private static final List<String> ALLOWED_SORT_FIELDS = Lists.newArrayList("water_save_score", "tech_applicability_score", "tech_cost_score", "resource_utilization_score", "sanitation_score", "convenience_score", "comprehensive_score");

    @Resource
    private ToiletProductDao productDao;

    @Resource
    private ToiletPatternDao patternDao;

    @Override
    public List<ToiletPatternDTO> sortPattern(PatternSortRequest request) {

        if (!ALLOWED_SORT_FIELDS.contains(request.getSortBy())) {
            throw new ToiletBizException("排序字段错误！", -1);
        }

        PatternQueryRequest patternQueryRequest = buildPatternQueryRequest(request);


        return patternDao.queryAllPatternByPage(patternQueryRequest).stream()
                .map(ProductConverter::toDTO)
                .collect(Collectors.toList());
    }

    private PatternQueryRequest buildPatternQueryRequest(PatternSortRequest request) {
        PatternQueryRequest patternQueryRequest = new PatternQueryRequest();
        patternQueryRequest.setIsDesc(request.getIsDesc());
        patternQueryRequest.setPageIndex(request.getPageIndex());
        patternQueryRequest.setPageSize(request.getPageSize());
        patternQueryRequest.setSortBy(request.getSortBy());
        return patternQueryRequest;
    }
}
