package cn.edu.bjtu.toilet.domain.response;

import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import lombok.Data;

import java.util.List;

@Data
public class PatternQueryResponse {
    private Integer maxPage;

    private Integer currentPage;

    private List<ToiletPatternDTO> patternDTOList;
}
