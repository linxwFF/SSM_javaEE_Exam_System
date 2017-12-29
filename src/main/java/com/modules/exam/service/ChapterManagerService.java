package com.modules.exam.service;

import com.common.model.QChapter;
import com.common.model.QCourse;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/29.
 */
public interface ChapterManagerService {

    //获取所有 根据类型
    List<QChapter> findAll_TableByType(Integer course_type_id);

    //添加
    int insert(QChapter model);

    //批量删除
    Map<String, Object> delete(String ids);

    //删除
    int deleteByPrimaryKey(int id);

}
