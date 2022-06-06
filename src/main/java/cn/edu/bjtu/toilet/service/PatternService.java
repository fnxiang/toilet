package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.response.PatternQueryResponse;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;

import java.util.List;

public interface PatternService {

    List<ToiletPatternDTO> queryPatternWithStatus(PatternSortRequest request);

    ToiletPatternDTO queryPatternById(String Id);

    PatternQueryResponse sortPattern(PatternSortRequest request);

    PatternQueryResponse sortPatternWithCondition(PatternSortRequest request, ToiletPatternDTO condition);
}
