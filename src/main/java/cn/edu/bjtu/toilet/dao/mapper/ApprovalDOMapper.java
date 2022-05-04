package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.ApprovalDO;
import cn.edu.bjtu.toilet.dao.domain.ApprovalDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ApprovalDOMapper {
    long countByExample(ApprovalDOSelective example);

    int deleteByExample(ApprovalDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(ApprovalDO record);

    int insertSelective(ApprovalDO record);

    List<ApprovalDO> selectByExampleWithBLOBs(ApprovalDOSelective example);

    List<ApprovalDO> selectByExample(ApprovalDOSelective example);

    ApprovalDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ApprovalDO record, @Param("example") ApprovalDOSelective example);

    int updateByExampleWithBLOBs(@Param("record") ApprovalDO record, @Param("example") ApprovalDOSelective example);

    int updateByExample(@Param("record") ApprovalDO record, @Param("example") ApprovalDOSelective example);

    int updateByPrimaryKeySelective(ApprovalDO record);

    int updateByPrimaryKeyWithBLOBs(ApprovalDO record);

    int updateByPrimaryKey(ApprovalDO record);
}