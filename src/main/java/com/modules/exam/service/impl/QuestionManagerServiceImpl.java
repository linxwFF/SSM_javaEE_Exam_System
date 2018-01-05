package com.modules.exam.service.impl;

import com.common.dao.QQuestionMapper;
import com.common.model.QQuestion;
import com.modules.exam.bo.QQuestionVo;
import com.modules.exam.service.QuestionManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LINxwFF on 2018/1/5.
 */
@Service
public class QuestionManagerServiceImpl implements QuestionManagerService {

    @Autowired
    private QQuestionMapper questionMapper;

    //查找所有的题目
    @Override
    public List<QQuestionVo> findAll_Table() {
        return questionMapper.findAll_Table();
    }

    //根据ID查找题目
    @Override
    public QQuestion select(Integer questionId) {
        return questionMapper.selectByPrimaryKey(questionId);
    }

    //删除题目
    @Override
    public int delete(Integer questionIds){
        return questionMapper.deleteByPrimaryKey(questionIds);
    }

    //修改题目
    @Override
    public int update(QQuestion qQuestion){
        return questionMapper.updateByPrimaryKeySelective(qQuestion);
    }

    //添加题目
    @Override
    public int insert(QQuestion record) {
        return questionMapper.insertSelective(record);
    }

}
