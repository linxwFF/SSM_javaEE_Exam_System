package com.common.dao;

import com.common.model.QCourse;

import java.util.List;

public interface QCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCourse record);

    int insertSelective(QCourse record);

    QCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCourse record);

    int updateByPrimaryKey(QCourse record);

    //查询出所有的专业项目
    List<QCourse> findAllQCourse();
}