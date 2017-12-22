package com.common.dao;

import com.common.model.EAnswerRecords;

public interface EAnswerRecordsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EAnswerRecords record);

    int insertSelective(EAnswerRecords record);

    EAnswerRecords selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EAnswerRecords record);

    int updateByPrimaryKeyWithBLOBs(EAnswerRecords record);

    int updateByPrimaryKey(EAnswerRecords record);
}