package cn.edu.bjtu.toilet.dao.mapper;

import cn.edu.bjtu.toilet.dao.domain.UserDO;
import cn.edu.bjtu.toilet.dao.domain.UserDOSelective;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserDOMapper {
    long countByExample(UserDOSelective example);

    int deleteByExample(UserDOSelective example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserDO record);

    int insertSelective(UserDO record);

    List<UserDO> selectByExample(UserDOSelective example);

    UserDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserDO record, @Param("example") UserDOSelective example);

    int updateByExample(@Param("record") UserDO record, @Param("example") UserDOSelective example);

    int updateByPrimaryKeySelective(UserDO record);

    int updateByPrimaryKey(UserDO record);
}