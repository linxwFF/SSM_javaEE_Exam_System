package com.modules.exam.service;

import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.page.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
public interface CourseService {

    //查询考试所有的专业项目 分页
    Pagination<QCourseMapper> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize);

    //考试项目信息
    QCourse findById(Integer id);

    //考试科目信息
    QCourse findCourseTypeById(Integer parent_id,Integer type);

    //获取所有的考试项目
    List<QCourse> findAll_Course();

    //考试所有的考试科目
    List<QCourse> findAll_CourseTypeId(Integer parent_id);
}
