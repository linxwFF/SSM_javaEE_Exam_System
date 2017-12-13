package com.common.dao;

import com.common.model.Dicts;

public interface DictsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dicts record);

    int insertSelective(Dicts record);

    Dicts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dicts record);

    int updateByPrimaryKey(Dicts record);
}