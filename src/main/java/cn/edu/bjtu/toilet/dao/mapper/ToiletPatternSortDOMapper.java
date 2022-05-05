package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ToiletPatternSortDOMapper {
    long countByExample(ToiletPatternSortDOSelective example);

    int deleteByExample(ToiletPatternSortDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(ToiletPatternSortDO record);

    int insertSelective(ToiletPatternSortDO record);

    List<ToiletPatternSortDO> selectByExample(ToiletPatternSortDOSelective example);

    ToiletPatternSortDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ToiletPatternSortDO record, @Param("example") ToiletPatternSortDOSelective example);

    int updateByExample(@Param("record") ToiletPatternSortDO record, @Param("example") ToiletPatternSortDOSelective example);

    int updateByPrimaryKeySelective(ToiletPatternSortDO record);

    int updateByPrimaryKey(ToiletPatternSortDO record);
}