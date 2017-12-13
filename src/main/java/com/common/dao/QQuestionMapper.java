package com.common.dao;

import com.common.model.QQuestion;

public interface QQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QQuestion record);

    int insertSelective(QQuestion record);

    QQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QQuestion record);

    int updateByPrimaryKey(QQuestion record);
}