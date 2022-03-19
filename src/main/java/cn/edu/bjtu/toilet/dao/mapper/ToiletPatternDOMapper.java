package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ToiletPatternDOMapper {
    long countByExample(ToiletPatternDOSelective example);

    int deleteByExample(ToiletPatternDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(ToiletPatternDO record);

    int insertSelective(ToiletPatternDO record);

    List<ToiletPatternDO> selectByExampleWithBLOBs(ToiletPatternDOSelective example);

    List<ToiletPatternDO> selectByExample(ToiletPatternDOSelective example);

    ToiletPatternDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ToiletPatternDO record, @Param("example") ToiletPatternDOSelective example);

    int updateByExampleWithBLOBs(@Param("record") ToiletPatternDO record, @Param("example") ToiletPatternDOSelective example);

    int updateByExample(@Param("record") ToiletPatternDO record, @Param("example") ToiletPatternDOSelective example);

    int updateByPrimaryKeySelective(ToiletPatternDO record);

    int updateByPrimaryKeyWithBLOBs(ToiletPatternDO record);

    int updateByPrimaryKey(ToiletPatternDO record);
}