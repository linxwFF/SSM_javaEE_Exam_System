package com.modules.exam.service.impl;

import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.BaseMybatisDao;
import com.modules.core.mybatis.page.Pagination;
import com.modules.exam.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
@Service
public class CourseServiceImpl extends BaseMybatisDao<QCourseMapper> implements CourseService {

    @Autowired
    private QCourseMapper qCourseMapper;

    @Override
    public Pagination<QCourseMapper> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }

    @Override
    public QCourse findById(Integer id) {
        return qCourseMapper.selectByPrimaryKey(id);
    }
}
