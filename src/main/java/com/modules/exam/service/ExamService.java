package com.modules.exam.service;

import com.common.model.EAnswerRecords;
import com.common.model.EPaper;
import com.common.model.QQuestion;
import com.modules.exam.bo.EPapersCondition;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
public interface ExamService {

    //随机考题
    Map<String,List<QQuestion>> QueryQuestionsByMode1(Integer type, Integer courseType);

    //插入考卷表中一份考题
    int insert(EPaper ePaper);

    //查询用户未完成的考卷  类型
    List<EPaper> findAllEPaperState0(EPapersCondition condition);

    //根据试卷的随机码获取试卷
    EPaper findEpaperBySrandom(String srandom);

    //生成考卷
    Map<String,List<QQuestion>> CreateExamPaper(Integer srandom,Integer type,Integer courseType,Integer mode,int exam_time);

    //题目序列化集合存入数据库
    Map<String,List<QQuestion>> jsonToMap(String json);

    //试卷题目反序列化
    List<QQuestion> jsontoListQquestion(Integer srandom);

    //插入答题记录表一条记录
    int insertAnswerRecords(EAnswerRecords eAnswerRecords);

}
