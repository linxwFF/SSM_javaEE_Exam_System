package com.common.dao;

import com.common.model.ArticleCategory;
import com.common.model.QChapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QChapterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QChapter record);

    int insertSelective(QChapter record);

    QChapter selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QChapter record);

    int updateByPrimaryKey(QChapter record);

    //列表_table
    List<QChapter> findAll_Table(@Param(value = "course_type_id")Integer course_type_id);
}