package com.common.dao;

import com.common.model.QCourse;
import org.apache.ibatis.annotations.Param;

public interface QCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCourse record);

    int insertSelective(QCourse record);

    QCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCourse record);

    int updateByPrimaryKey(QCourse record);

    //考试科目信息
    QCourse findCourseTypeById(@Param("parent_id") Integer parent_id,@Param("type") Integer type);
}