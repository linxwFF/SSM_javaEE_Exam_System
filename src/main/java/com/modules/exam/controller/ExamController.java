package com.modules.exam.controller;

import com.alibaba.fastjson.JSON;
import com.common.controller.BaseController;
import com.common.dao.QCourseMapper;
import com.common.model.*;
import com.common.utils.Const;
import com.common.utils.EnumUtil;
import com.modules.core.mybatis.page.Pagination;
import com.modules.core.shiro.token.manager.TokenManager;
import com.modules.exam.bo.Answer;
import com.modules.exam.bo.AnswerRecordsDetailVo;
import com.modules.exam.bo.AnswerRecordsListVo;
import com.modules.exam.bo.EPapersCondition;
import com.modules.exam.service.CourseService;
import com.modules.exam.service.ExamService;
import com.modules.user.service.UUserService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by LINxwFF on 2017/12/13.
 */
@Controller
@Scope(value="prototype")
@RequestMapping("exam")
public class ExamController extends BaseController {

    @Autowired
    //自动注入的是接口类
    private CourseService courseService;

    @Autowired
    private ExamService examService;

    @Autowired
    UUserService userService;

    /**
     * 考试主页
     * @return
     */
    @RequestMapping(value="index",method= RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("exam/index");
    }

    //1.选择考试专业项目  列表
    @RequestMapping(value="chooseCourse")
    public ModelAndView chooseCourse(ModelMap map, Integer pageNo, String findContent){
        //分页，专业项目列表
        map.put("findContent", findContent);
        Pagination<QCourseMapper> page = courseService.findByPage(map,pageNo,pageSize);
        map.put("page", page);

        return new ModelAndView("exam/choose_course");
    }

    //2.根据考试专业项目的id查询出q_course_category所有的考试科目列表
    @RequestMapping(value="get_course_list")
    public ModelAndView getCourseList(ModelMap map,String findContent, Integer course_id){

        if(course_id == null){
            return new ModelAndView("exam/get_course_list");
        }
        //考试项目type
        QCourse course = courseService.findById(course_id);
        map.put("type",course.getType());

        map.put("findContent", findContent);
        map.put("course_id",course_id);
        Pagination<QCourseMapper> page = courseService.findByPage(map,pageNo,pageSize);
        map.put("page", page);

        return new ModelAndView("exam/get_course_list");
    }

    //3.考试的模式选择     type=${remarks}考试项目  &courseType=${it.value}考试科目
    @RequestMapping(value="get_model_list")
    public ModelAndView getModelList(ModelMap map,Integer type,Integer courseType){

        Map<String,String> modelList = new LinkedHashMap<>();

        modelList.put(String.valueOf(Const.ExamModelEnum.MODEL_1.getCode()),Const.ExamModelEnum.MODEL_1.getValue());
        modelList.put(String.valueOf(Const.ExamModelEnum.MODEL_2.getCode()),Const.ExamModelEnum.MODEL_2.getValue());
        modelList.put(String.valueOf(Const.ExamModelEnum.MODEL_3.getCode()),Const.ExamModelEnum.MODEL_3.getValue());
        modelList.put(String.valueOf(Const.ExamModelEnum.MODEL_4.getCode()),Const.ExamModelEnum.MODEL_4.getValue());
        modelList.put(String.valueOf(Const.ExamModelEnum.MODEL_5.getCode()),Const.ExamModelEnum.MODEL_5.getValue());

        map.put("modelList",modelList);

        map.put("type",type);
        map.put("courseType",courseType);

        return new ModelAndView("exam/get_model_list");
    }

    //开始考试 随机生成新考卷
    @RequestMapping(value="start_exam")
    public ModelAndView StartExam(ModelMap map,Integer type,Integer courseType,Integer mode){

        //考试项目
        QCourse CourseProject = courseService.findById(type);
        String CourseProjectName = CourseProject.getName();
        map.put("CourseProjectName",CourseProjectName);
        map.put("type",type);

        //考试科目
        QCourse Course = courseService.findCourseTypeById(CourseProject.getId(),courseType);
        String CourseName = Course.getName();
        map.put("CourseName",CourseName);
        map.put("courseType",courseType);

        //考试模式
        Class<Const.ExamModelEnum> clasz = Const.ExamModelEnum.class;
        String modeName =(String) EnumUtil.getEnumValueByCode(mode, clasz);
        map.put("modeName",modeName);
        map.put("mode",mode);

        //随机值 = 用来索引这个考卷的id
        Random random = new Random();
        int srandom = random.nextInt(1000000)%(9000000-1000000+1) + 1000000;
        map.put("srandom",srandom);

        //考试时间
        int exam_time = 3600;
        map.put("exam_time",exam_time);

        //创建新的考卷
        Map<String,List<QQuestion>> questions = examService.CreateExamPaper(srandom,type,courseType,mode,exam_time);
        map.put("questions",questions);

        return new ModelAndView("exam/exam");
    }

    //考卷列表
    @RequestMapping(value="get_paper_list",method = RequestMethod.GET)
    public ModelAndView getPaperList(ModelMap map,Integer type,Integer courseType,Integer mode){

        //考试项目
        QCourse CourseProject = courseService.findById(type);
        String CourseProjectName = CourseProject.getName();
        map.put("CourseProjectName",CourseProjectName);
        map.put("type",type);

        //考试科目
        QCourse Course = courseService.findCourseTypeById(CourseProject.getId(),courseType);
        String CourseName = Course.getName();
        map.put("CourseName",CourseName);
        map.put("courseType",courseType);

        //考试模式
        Class<Const.ExamModelEnum> clasz = Const.ExamModelEnum.class;
        String modeName =(String) EnumUtil.getEnumValueByCode(mode, clasz);
        map.put("modeName",modeName);
        map.put("mode",mode);

        return new ModelAndView("exam/get_paper_list");
    }

    //考卷列表 data
    @RequestMapping(value="get_paper_list",method = RequestMethod.POST)
    @ResponseBody
    public String getPaperListData(ModelMap map,Integer type,Integer courseType,Integer mode){

        EPapersCondition condition = new EPapersCondition();
        condition.setUser_id(TokenManager.getUserId());
        condition.setType(type);
        condition.setCourseType(courseType);
        condition.setMode(mode);

        List<EPaper> ePapers = examService.findAllEPaperState0(condition);

        map.put("data", ePapers);

        String jsonString = JSON.toJSONString(map);

        return jsonString;
    }

    //开始考试
    @RequestMapping(value="start_exam_by_srandom")
    public ModelAndView StartExamBySrandom(ModelMap map,Integer srandom){

        EPaper ePapers = examService.findEpaperBySrandom(String.valueOf(srandom));

        //考试项目
        QCourse CourseProject = courseService.findById(ePapers.getTypeId());
        String CourseProjectName = CourseProject.getName();
        map.put("CourseProjectName",CourseProjectName);
        map.put("type",ePapers.getTypeId());

        //考试科目
        QCourse Course = courseService.findCourseTypeById(CourseProject.getId(),ePapers.getCourseId());
        String CourseName = Course.getName();
        map.put("CourseName",CourseName);
        map.put("courseType",ePapers.getCourseId());

        //考试模式
        Class<Const.ExamModelEnum> clasz = Const.ExamModelEnum.class;
        String modeName =(String) EnumUtil.getEnumValueByCode(ePapers.getMode(), clasz);
        map.put("modeName",modeName);
        map.put("mode",ePapers.getMode());

        String jsonQuestions = ePapers.getQuestions();
        Map<String, List<QQuestion>> mapQuestions = examService.jsonToMap(jsonQuestions);
        //考试时间
        map.put("exam_time",ePapers.getExamTime());
        //考试题目
        map.put("questions",mapQuestions);
        //随机值 = 用来判断这个考卷的id
        map.put("srandom",String.valueOf(ePapers.getSrandom()));

        return new ModelAndView("exam/exam");
    }



    //处理考卷
    @RequestMapping(value="handPaper")
    public ModelAndView handPaper(ModelMap map,String daan,Integer type,Integer courseType,Integer mode,Integer take_time,Integer srandom){

        map.put("type",type);
        map.put("courseType",courseType);
        map.put("mode",mode);

        List<QQuestion> qQuestionList = examService.jsontoListQquestion(srandom);

        List<Answer> answerList = new ArrayList<>();
        List<Answer> rightAnswerList = new ArrayList<>();
        List<Answer> errorAnswerList = new ArrayList<>();

        //答题信息 匹配答案
        String[] daanList = daan.split(",");

        //总题目
        int total_num = daanList.length;
        int right_num = 0;
        int error_num = 0;
        int score = 0;

        for (String item : daanList) {

            String[] temp = item.split("/");

            //题目
            int subject_id = Integer.parseInt(temp[0])-1;
            //题型
            int subjectType = Integer.parseInt(temp[1]);

            //答题
            String answer;
            if(temp.length == 2){
                answer = "";
            }else{
                answer = temp[2];
            }

            Answer answerObj = new Answer();

            QQuestion qQuestion = qQuestionList.get(subject_id);
            if(subjectType == 1){
                answerObj.setSubject(qQuestion.getSubject());
                answerObj.setChooseA(qQuestion.getChooseA());
                answerObj.setChooseB(qQuestion.getChooseB());
                answerObj.setChooseC(qQuestion.getChooseC());
                answerObj.setChooseD(qQuestion.getChooseD());
                answerObj.setChooseRight(qQuestion.getChooseRight());
                answerObj.setAnalysis(qQuestion.getAnalysis());
                answerObj.setType(1);
                answerObj.setChoose(answer);

                if(answer.equals(qQuestion.getChooseRight())){
                    answerObj.setScore(2);
                    right_num++;
                    score += 2;
                    rightAnswerList.add(answerObj);
                }else{
                    answerObj.setScore(0);
                    error_num++;
                    errorAnswerList.add(answerObj);
                }
            }else if(subjectType == 2){
                answerObj.setSubject(qQuestion.getSubject());
                answerObj.setChooseA(qQuestion.getChooseA());
                answerObj.setChooseB(qQuestion.getChooseB());
                answerObj.setChooseC(qQuestion.getChooseC());
                answerObj.setChooseD(qQuestion.getChooseD());
                answerObj.setChooseE(qQuestion.getChooseE());
                answerObj.setChooseF(qQuestion.getChooseF());
                answerObj.setChooseG(qQuestion.getChooseG());
                answerObj.setChooseRight(qQuestion.getChooseRight());
                answerObj.setAnalysis(qQuestion.getAnalysis());
                answerObj.setType(2);
                answerObj.setChoose(answer);

                if(answer.equals(qQuestion.getChooseRight())){
                    answerObj.setScore(2);
                    right_num++;
                    score += 2;
                    rightAnswerList.add(answerObj);
                }else{
                    answerObj.setScore(0);
                    error_num++;
                    errorAnswerList.add(answerObj);
                }
            }else if(subjectType == 3){
                answerObj.setSubject(qQuestion.getSubject());
                answerObj.setChooseA(qQuestion.getChooseA());
                answerObj.setChooseB(qQuestion.getChooseB());
                answerObj.setChooseRight(qQuestion.getChooseRight());
                answerObj.setAnalysis(qQuestion.getAnalysis());
                answerObj.setType(3);
                answerObj.setChoose(answer);

                if(answer.equals(qQuestion.getChooseRight())){
                    answerObj.setScore(2);
                    right_num++;
                    score += 2;
                    rightAnswerList.add(answerObj);
                }else{
                    answerObj.setScore(0);
                    error_num++;
                    errorAnswerList.add(answerObj);
                }
            }

            answerList.add(answerObj);
        }

        map.put("answerList",answerList);

        //成绩表
        EScoresWithBLOBs eScores = new EScoresWithBLOBs();
        eScores.setUserId(TokenManager.getUserId());
        eScores.setExamSrandomId(srandom);
        eScores.setTotalNum(total_num);
        eScores.setRightNum(right_num);
        eScores.setErrorNum(error_num);
        eScores.setScore(new Double(score));
        JSONArray rightAnswerListJson = JSONArray.fromObject(rightAnswerList);
        eScores.setAnswerSucRecords(rightAnswerListJson.toString());
        JSONArray errorAnswerListJson = JSONArray.fromObject(errorAnswerList);
        eScores.setAnswerErrRecords(errorAnswerListJson.toString());
        eScores.setTakeTime(take_time);
        examService.insertAnswerScore(eScores);

        //生成答题记录
        //答题序列化集合存入数据库
        EAnswerRecords eAnswerRecords = new EAnswerRecords();
        eAnswerRecords.setUserId(TokenManager.getUserId());
        eAnswerRecords.setExamSrandomId(srandom);
        eAnswerRecords.setScoresId(eScores.getId());
        JSONArray answerListJson = JSONArray.fromObject(answerList);
        eAnswerRecords.setAnswer(answerListJson.toString());
        examService.insertAnswerRecords(eAnswerRecords);


        //修正考卷状态 0未考试过  1考试过
        examService.updateEPaperState(srandom,1);

        return new ModelAndView("exam/handPaper");
    }


    //查询考试记录
    @RequestMapping(value = "get_answer_records",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getAnswerRecords(ModelMap map,Integer type,Integer courseType,Integer mode)
    {

        map.put("type",type);
        map.put("courseType",courseType);
        map.put("mode",mode);

        return new ModelAndView("exam/get_answer_records");
    }

    //查询考试记录data
    @RequestMapping(value = "get_answer_records",method = RequestMethod.POST)
    @ResponseBody
    public String getAnswerRecordsData(ModelMap map,Integer type,Integer courseType,Integer mode)
    {
        List<AnswerRecordsListVo> answerRecordsListVoList = examService.getAnswerRecords(type,courseType,mode);

        map.put("data", answerRecordsListVoList);
        String jsonString = JSON.toJSONString(map);

        return jsonString;
    }


    //答题记录的详情信息
    @RequestMapping(value = "get_answer_records_detail")
    public ModelAndView getAnswerRecordsDetail(ModelMap map,Integer id)
    {
        AnswerRecordsDetailVo item = examService.getAnswerRecordsDetailVoBySrandom(id);

        List<Answer> err_records = examService.jsontoListAnswerRecords(item.getAnswer_err_records());
        List<Answer> suc_records = examService.jsontoListAnswerRecords(item.getAnswer_suc_records());

        map.put("item",item);
        map.put("err_records",err_records);
        map.put("suc_records",suc_records);

        return new ModelAndView("exam/answer_records_detail");
    }


    //生成答题分析报表
    @RequestMapping(value = "analysisReport")
    public ModelAndView analysisReport(ModelMap map,Integer type,Integer courseType,Integer mode)
    {
        List<AnswerRecordsListVo> answerRecordsListVoList = examService.getAnswerRecords(type,courseType,mode);

        //成绩

        //正确题数目

        //错误题数目

        map.put("data",answerRecordsListVoList);

        return new ModelAndView("exam/analysisReport");
    }
}
