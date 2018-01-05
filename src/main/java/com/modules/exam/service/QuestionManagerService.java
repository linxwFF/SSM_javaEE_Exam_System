package com.modules.exam.service;

import com.common.model.QQuestion;
import com.modules.exam.bo.QQuestionVo;

import java.util.List;

/**
 * Created by LINxwFF on 2018/1/5.
 */
public interface QuestionManagerService {

    //查询所有题目数据
    List<QQuestionVo> findAll_Table();
    //删除题目
    int delete( Integer questionIds);
    //根据ID 查找题目
    QQuestion select(Integer id);
    //修改题库
    int update(QQuestion qQuestion);
    //增加题库
    int insert(QQuestion record);
}
