package com.common.dao;

import com.common.model.EScores;
import com.common.model.EScoresWithBLOBs;

public interface EScoresMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EScoresWithBLOBs record);

    int insertSelective(EScoresWithBLOBs record);

    EScoresWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EScoresWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(EScoresWithBLOBs record);

    int updateByPrimaryKey(EScores record);
}