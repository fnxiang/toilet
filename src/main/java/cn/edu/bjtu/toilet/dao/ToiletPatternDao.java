package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDO;
import cn.edu.bjtu.toilet.dao.request.PatternQueryRequest;

import java.util.List;

public interface ToiletPatternDao {

    ToiletPatternSortDO queryPatternSortId(Integer patternId, String usage);

    ToiletPatternSortDO queryPatternSortById(Integer id);

    ToiletPatternDO savePattern(ToiletPatternDO patternDO);

    ToiletPatternDO insertPattern(ToiletPatternDO patternDO);

    ToiletPatternDO queryPatternBySource(String source);

    ToiletPatternDO updatePatternBySource(ToiletPatternDO patternDO, String source);

    ToiletPatternDO queryPatternById(Integer Id);

    List<ToiletPatternDO> queryAllPattern(String email);

    List<ToiletPatternDO> queryAllPatternByPage(PatternQueryRequest request);

    List<ToiletPatternDO> queryPatternByPageWithStatus(PatternQueryRequest request);

}
