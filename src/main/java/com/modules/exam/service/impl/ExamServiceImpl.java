package com.modules.exam.service.impl;

import com.common.dao.EPaperMapper;
import com.common.dao.QQuestionMapper;
import com.common.model.EPaper;
import com.common.model.QQuestion;
import com.modules.exam.bo.EPapersCondition;
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
public class ExamServiceImpl implements ExamService{

    @Autowired
    private QQuestionMapper qQuestionMapper;

    @Autowired
    private EPaperMapper ePaperMapper;

    @Override
    public Map<String,List<QQuestion>> QueryQuestionsByMode1(Integer courseType, Integer courseTypeId) {

        Map<String,List<QQuestion>> result = new LinkedHashMap<>();

        //10题随机的选择题
        List<QQuestion> listType1 = qQuestionMapper.queryQuestionByTypeRand(1,courseType,courseTypeId,10);
        result.put("type1",listType1);

        //10题随机的多选题
        List<QQuestion> listType2 = qQuestionMapper.queryQuestionByTypeRand(2,courseType,courseTypeId,10);
        result.put("type2",listType2);

        //10题随机的判断题
        List<QQuestion> listType3 = qQuestionMapper.queryQuestionByTypeRand(3,courseType,courseTypeId,10);
        result.put("type3",listType3);

        return result;
    }

    @Override
    public int insert(EPaper ePaper) {

        return ePaperMapper.insertSelective(ePaper);
    }

    @Override
    public List<EPaper> findAllEPaperState0(EPapersCondition condition) {
        return ePaperMapper.findAllEPaperState0(condition);
    }

    @Override
    public EPaper findEpaperBySrandom(String srandom) {
        return ePaperMapper.findEpaperBySrandom(srandom);
    }

}
