package com.modules.exam.service.impl;

import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.BaseMybatisDao;
import com.modules.core.mybatis.page.Pagination;
import com.modules.exam.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/15.
 */
//spring的注入是基于接口实现，一定要在这里写serive的注解
@Service
public class ExamServiceImpl extends BaseMybatisDao<QCourseMapper> implements ExamService {

    @Autowired
    private QCourseMapper qCourseMapper;

    @Override
    public List<QCourse> findExamAllProject() {
        return qCourseMapper.findAllQCourse();
    }

    @Override
    public Pagination<QCourse> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }


}
