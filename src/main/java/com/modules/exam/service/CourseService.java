package com.modules.exam.service;

import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.page.Pagination;

import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
public interface CourseService {

    //查询考试所有的专业项目 分页
    Pagination<QCourseMapper> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize);

    QCourse findById(Integer id);
}
