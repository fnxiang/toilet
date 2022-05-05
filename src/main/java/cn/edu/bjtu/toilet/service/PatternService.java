package cn.edu.bjtu.toilet.service;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;

import java.util.List;

public interface PatternService {

    List<ToiletPatternDTO> sortPattern(PatternSortRequest request);
}
