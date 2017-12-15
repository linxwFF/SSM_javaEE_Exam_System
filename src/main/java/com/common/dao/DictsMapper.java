package com.common.dao;

import com.common.model.Dicts;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DictsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dicts record);

    int insertSelective(Dicts record);

    Dicts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dicts record);

    int updateByPrimaryKey(Dicts record);

    List<Dicts> findAllByCourse(@Param(value = "findContent") String findContent, @Param(value = "remarks") Integer remarks);
}