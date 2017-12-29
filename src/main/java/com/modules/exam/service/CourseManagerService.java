package com.modules.exam.service;

import com.common.model.ArticleCategory;
import com.common.model.QCourse;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/29.
 */
public interface CourseManagerService {

    //获取所有
    List<QCourse> findAll_Table();

    //添加
    int insert(QCourse model);

    //批量删除
    Map<String, Object> delete(String ids);

    //删除
    int deleteByPrimaryKey(int id);
}
