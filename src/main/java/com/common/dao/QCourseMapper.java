package com.common.dao;

import com.common.model.QCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCourse record);

    int insertSelective(QCourse record);

    QCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCourse record);

    int updateByPrimaryKey(QCourse record);

    //考试科目信息
    QCourse findCourseTypeById(@Param("parent_id") Integer parent_id, @Param("type") Integer type);

    //获取所有的 _table
    List<QCourse> findAll_Table();

    //获取所有的考试项目
    List<QCourse> findAll_Course();

    //考试所有的考试科目
    List<QCourse> findAll_CourseTypeId(Integer parent_id);
}