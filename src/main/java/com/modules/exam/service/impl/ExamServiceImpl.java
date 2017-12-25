package com.modules.exam.service.impl;

import com.common.dao.*;
import com.common.model.*;
import com.common.utils.Const;
import com.common.utils.EnumUtil;
import com.modules.core.shiro.token.manager.TokenManager;
import com.modules.exam.bo.Answer;
import com.modules.exam.bo.AnswerRecordsDetailVo;
import com.modules.exam.bo.AnswerRecordsListVo;
import com.modules.exam.bo.EPapersCondition;
import com.modules.exam.service.ExamService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;

/**
 * Created by LINxwFF on 2017/12/17.
 */
@Service
public class ExamServiceImpl implements ExamService{

    @Autowired
    private QQuestionMapper qQuestionMapper;

    @Autowired
    private EPaperMapper ePaperMapper;

    @Autowired
    private EAnswerRecordsMapper eAnswerRecordsMapper;

    @Autowired
    private EScoresMapper eScoresMapper;

    @Autowired
    private QCourseMapper qCourseMapper;

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
        return ePaperMapper.insert(ePaper);
    }

    @Override
    public List<EPaper> findAllEPaperState0(EPapersCondition condition) {
        return ePaperMapper.findAllEPaperState0(condition);
    }

    @Override
    public EPaper findEpaperBySrandom(String srandom) {
        return ePaperMapper.findEpaperBySrandom(srandom);
    }


    //生成考卷
    @Override
    public Map<String,List<QQuestion>> CreateExamPaper(Integer srandom,Integer type,Integer courseType,Integer mode,int exam_time)
    {
        //user_id
        long user_id = TokenManager.getUserId();

        //章节
        Integer chapter_id = 0;

        //考题
        Map<String,List<QQuestion>> questions = this.QueryQuestionsByMode1(type,courseType);
        JSONObject jsonQuestions = JSONObject.fromObject(questions);

        //考卷名
        QCourse qCourse = qCourseMapper.findCourseTypeById(0,type);
        QCourse qCourseType = qCourseMapper.findCourseTypeById(type,courseType);
        Class<Const.ExamModelEnum> clasz = Const.ExamModelEnum.class;
        String modeName =(String) EnumUtil.getEnumValueByCode(mode, clasz);

        String examtitle = qCourse.getName()+"-"+qCourseType.getName()+"-"+modeName+"sumsj-"+srandom;

        int state = 0;  //未开始

        EPaper ePaper = new EPaper();
        ePaper.setUserId(user_id);
        ePaper.setTypeId(type);
        ePaper.setCourseId(courseType);
        ePaper.setChapterId(chapter_id);
        ePaper.setMode(mode);
        ePaper.setExamTitle(examtitle);
        ePaper.setState(state);
        ePaper.setSrandom(String.valueOf(srandom));
        ePaper.setQuestions(jsonQuestions.toString());
        ePaper.setExamTime(exam_time);

        this.insert(ePaper);

        return questions;
    }


    //题目序列化集合存入数据库
    @Override
    public Map<String,List<QQuestion>> jsonToMap(String json)
    {
        ObjectMapper mapper = new ObjectMapper();

        Map<String, List<QQuestion>> mapQuestions = new HashMap<String, List<QQuestion>>();
        try {
            mapQuestions = mapper.readValue(json, Map.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return mapQuestions;
    }

    //试卷题目反序列化
    //json to list 试卷转换成对象list
    @Override
    public List<QQuestion> jsontoListQquestion(Integer srandom)
    {
        //获取试卷信息
        EPaper ePaper = this.findEpaperBySrandom(String.valueOf(srandom));

        //题目信息
        String jsonQuestions = ePaper.getQuestions();

        //题目信息转换
        JSONObject jsonobject = JSONObject.fromObject(jsonQuestions);
        List<QQuestion> result = new ArrayList<>();
        //获取一个json数组 type1;
        JSONArray type1 = jsonobject.getJSONArray("type1");
        //将json数组 转换成 List<QQuestion>泛型
        for (int i = 0; i < type1.size(); i++) {
            JSONObject object = (JSONObject)type1.get(i);
            QQuestion question = (QQuestion)JSONObject.toBean(object,QQuestion.class);
            if(question != null){
                result.add(question);
            }
        }

        //获取一个json数组 type2;
        JSONArray type2 = jsonobject.getJSONArray("type2");
        //将json数组 转换成 List<QQuestion>泛型
        for (int i = 0; i < type2.size(); i++) {
            JSONObject object = (JSONObject)type2.get(i);
            QQuestion question = (QQuestion)JSONObject.toBean(object,
                    QQuestion.class);
            if(question != null){
                result.add(question);
            }
        }

        //获取一个json数组 type3;
        JSONArray type3 = jsonobject.getJSONArray("type3");
        //将json数组 转换成 List<QQuestion>泛型
        for (int i = 0; i < type3.size(); i++) {
            JSONObject object = (JSONObject)type3.get(i);
            QQuestion question = (QQuestion)JSONObject.toBean(object,
                    QQuestion.class);
            if(question != null){
                result.add(question);
            }
        }

        return result;
    }

    @Override
    public int insertAnswerRecords(EAnswerRecords eAnswerRecords) {
        return eAnswerRecordsMapper.insert(eAnswerRecords);
    }

    @Override
    public int insertAnswerScore(EScoresWithBLOBs eScoresWithBLOBs) {
        return eScoresMapper.insert(eScoresWithBLOBs);
    }

    @Override
    public List<AnswerRecordsListVo> getAnswerRecords(Integer type,Integer courseType,Integer mode) {

        //user_id
        long user_id = TokenManager.getUserId();

        return eAnswerRecordsMapper.selectAnswerRecordsListVo(type,courseType,mode,user_id);
    }

    @Override
    public AnswerRecordsDetailVo getAnswerRecordsDetailVoBySrandom(Integer id) {

        //user_id
        long user_id = TokenManager.getUserId();

        return eAnswerRecordsMapper.getAnswerRecordsDetailVoBySrandom(id,user_id);
    }

    //错题和正确题目的反序列化
    @Override
    public List<Answer> jsontoListAnswerRecords(String json)
    {
        JSONArray jsonarray = JSONArray.fromObject(json);

        List<Answer> result = (List)JSONArray.toCollection(jsonarray, Answer.class);

        return result;
    }

    @Override
    public int updateEPaperState(Integer srandom,Integer state) {
        return ePaperMapper.updateEPaperState(srandom,state);
    }


}
