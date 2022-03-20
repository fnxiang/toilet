package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;

public interface ToiletProductDao {

    ToiletProductDO saveProductWithPattern(ToiletProductDO productDO, ToiletPatternDO patternDO);

    ToiletPatternDO queryPatternBySource(String source);

    ToiletPatternDO queryPatternById(Integer Id);
}
