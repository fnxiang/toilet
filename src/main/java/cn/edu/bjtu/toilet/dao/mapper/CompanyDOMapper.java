package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.CompanyDO;
import cn.edu.bjtu.toilet.dao.domain.CompanyDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CompanyDOMapper {
    long countByExample(CompanyDOSelective example);

    int deleteByExample(CompanyDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(CompanyDO record);

    int insertSelective(CompanyDO record);

    List<CompanyDO> selectByExampleWithBLOBs(CompanyDOSelective example);

    List<CompanyDO> selectByExample(CompanyDOSelective example);

    CompanyDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CompanyDO record, @Param("example") CompanyDOSelective example);

    int updateByExampleWithBLOBs(@Param("record") CompanyDO record, @Param("example") CompanyDOSelective example);

    int updateByExample(@Param("record") CompanyDO record, @Param("example") CompanyDOSelective example);

    int updateByPrimaryKeySelective(CompanyDO record);

    int updateByPrimaryKeyWithBLOBs(CompanyDO record);

    int updateByPrimaryKey(CompanyDO record);
}