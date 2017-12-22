package com.common.dao;

import com.common.model.EAnswerRecords;
import com.modules.exam.bo.AnswerRecordsListVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EAnswerRecordsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EAnswerRecords record);

    int insertSelective(EAnswerRecords record);

    EAnswerRecords selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EAnswerRecords record);

    int updateByPrimaryKeyWithBLOBs(EAnswerRecords record);

    int updateByPrimaryKey(EAnswerRecords record);

    //关联查询根据条件查询所有的答题记录
    List<AnswerRecordsListVo> selectAnswerRecordsListVo(@Param("type")Integer type,@Param("courseType") Integer courseType,@Param("mode") Integer mode);
}