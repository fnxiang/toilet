package cn.edu.bjtu.toilet.dao;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;

public interface ToiletProductDao {

    ToiletProductDO saveProductWithPattern(ToiletProductDO productDO, ToiletPatternDO patternDO);

    ToiletPatternDO queryPatternById(Integer Id);
}
