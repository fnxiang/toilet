package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ToiletProductDOMapper {
    long countByExample(ToiletProductDOSelective example);

    int deleteByExample(ToiletProductDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(ToiletProductDO record);

    int insertSelective(ToiletProductDO record);

    List<ToiletProductDO> selectByExampleWithBLOBs(ToiletProductDOSelective example);

    List<ToiletProductDO> selectByExample(ToiletProductDOSelective example);

    ToiletProductDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ToiletProductDO record, @Param("example") ToiletProductDOSelective example);

    int updateByExampleWithBLOBs(@Param("record") ToiletProductDO record, @Param("example") ToiletProductDOSelective example);

    int updateByExample(@Param("record") ToiletProductDO record, @Param("example") ToiletProductDOSelective example);

    int updateByPrimaryKeySelective(ToiletProductDO record);

    int updateByPrimaryKeyWithBLOBs(ToiletProductDO record);

    int updateByPrimaryKey(ToiletProductDO record);
}