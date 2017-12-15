package com.modules.exam.service;

import com.common.model.QCourse;
import com.modules.core.mybatis.page.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/15.
 */
public interface ExamService {

    //查询考试所有的专业项目
    public List<QCourse> findExamAllProject();

    //查询考试所有的专业项目 分页
    Pagination<QCourse> findByPage(Map<String, Object> resultMap, Integer pageNo,Integer pageSize);
}
