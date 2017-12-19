package com.modules.exam.controller;

import com.common.controller.BaseController;
import com.common.dao.QCourseMapper;
import com.common.model.EPaper;
import com.common.model.QCourse;
import com.common.model.QQuestion;
import com.common.utils.Const;
import com.common.utils.EnumUtil;
import com.modules.core.mybatis.page.Pagination;
import com.modules.core.shiro.token.manager.TokenManager;
import com.modules.exam.bo.EPapersCondition;
import com.modules.exam.service.CourseService;
import com.modules.exam.service.ExamService;
import com.modules.user.service.UUserService;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
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

    //开始考试
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

        //随机值 = 用来判断这个考卷的id
        Random random = new Random();
        int srandom = random.nextInt(1000000)%(9000000-1000000+1) + 1000000;
        map.put("srandom",String.valueOf(srandom));

        //查询用户是否有未完成的试卷
        EPapersCondition condition = new EPapersCondition();
        condition.setUser_id(TokenManager.getUserId());
        condition.setType(type);
        condition.setCourseType(courseType);
        condition.setChapter_id(0);
        condition.setMode(mode);
        condition.setState(0);  //未完成

        List<EPaper> ePapers = examService.findAllEPaperState0(condition);
        if(ePapers.size() > 0){
            //如果有则把未完成的试卷返回 到考试界面
            String jsonQuestions = ePapers.get(0).getQuestions();
            ObjectMapper mapper = new ObjectMapper();
            Map<String,Object> mapQuestions = new HashMap<>();

            try {
                mapQuestions = mapper.readValue(jsonQuestions, Map.class);
            } catch (IOException e) {
                e.printStackTrace();
            }
            map.put("questions",mapQuestions);
            return new ModelAndView("exam/exam");

        }else{
            Map<String,List<QQuestion>> questions = CreateExamPaper(type,courseType,mode);
            map.put("questions",questions);
            return new ModelAndView("exam/exam");
        }

    }

    //处理考卷
    @RequestMapping(value="handPaper")
    public ModelAndView handPaper(ModelMap map, Integer type, Integer courseType, Integer ys,String daan,String srandom){

        return new ModelAndView("exam/get_model_list");
    }

    //生成考卷
    private Map<String,List<QQuestion>> CreateExamPaper(Integer type,Integer courseType,Integer mode)
    {
        //user_id
        long user_id = TokenManager.getUserId();

        //章节
        Integer chapter_id = 0;

        //考题
        Map<String,List<QQuestion>> questions = examService.QueryQuestionsByMode1(type,courseType);
        JSONObject jsonQuestions = JSONObject.fromObject(questions);


        //随机值 = 用来索引这个考卷的id
        Random random = new Random();
        int srandom = random.nextInt(1000000)%(9000000-1000000+1) + 1000000;

        String examtitle = srandom+"sumj";

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

        examService.insert(ePaper);

        return questions;
    }


}
