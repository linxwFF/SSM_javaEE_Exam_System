package com.modules.exam.service.impl;

import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.BaseMybatisDao;
import com.modules.core.mybatis.page.Pagination;
import com.modules.exam.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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

    @Override
    public QCourse findCourseTypeById(Integer parent_id, Integer type) {
        return qCourseMapper.findCourseTypeById(parent_id,type);
    }

    @Override
    public List<QCourse> findAll_Course() {
        return qCourseMapper.findAll_Course();
    }

    @Override
    public List<QCourse> findAll_CourseTypeId(Integer parent_id) {
        return qCourseMapper.findAll_CourseTypeId(parent_id);
    }
}
