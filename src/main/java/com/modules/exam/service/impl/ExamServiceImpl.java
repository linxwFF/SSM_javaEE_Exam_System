package com.modules.exam.service.impl;

import com.common.dao.QQuestionMapper;
import com.common.model.QQuestion;
import com.modules.exam.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    private QQuestionMapper qQuestionMapper;

    @Override
    public Map<Integer,List<QQuestion>> QueryQuestionsByMode1(Integer courseType, Integer courseTypeId) {

        Map<Integer,List<QQuestion>> result = new LinkedHashMap<>();

        //10题随机的选择题
        List<QQuestion> listType1 = qQuestionMapper.queryQuestionByTypeRand(1,courseType,courseTypeId,10);
        result.put(1,listType1);

        //10题随机的多选题
        List<QQuestion> listType2 = qQuestionMapper.queryQuestionByTypeRand(2,courseType,courseTypeId,10);
        result.put(2,listType2);

        //10题随机的判断题
        List<QQuestion> listType3 = qQuestionMapper.queryQuestionByTypeRand(3,courseType,courseTypeId,10);
        result.put(3,listType3);

        return result;
    }
}
