package com.common.dao;

import com.common.model.QChapter;

public interface QChapterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QChapter record);

    int insertSelective(QChapter record);

    QChapter selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QChapter record);

    int updateByPrimaryKey(QChapter record);
}