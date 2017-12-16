package com.modules.exam.controller;

import com.common.controller.BaseController;
import com.common.dao.QCourseMapper;
import com.common.model.QCourse;
import com.modules.core.mybatis.page.Pagination;
import com.modules.exam.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedHashMap;
import java.util.Map;

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

        modelList.put("1","随机组卷模式");
        modelList.put("2","往年真题模式");
        modelList.put("3","章节练习");
        modelList.put("4","大题练习");
        modelList.put("5","错题练习");

        map.put("modelList",modelList);

        map.put("type",type);
        map.put("courseType",courseType);

        return new ModelAndView("exam/get_model_list");
    }

    //开始考试
    @RequestMapping(value="start_exam")
    public ModelAndView StartExam(ModelMap map,Integer type,Integer courseType,Integer mode){

        //考试项目

        //考试科目

        //考试模式

        return new ModelAndView("exam/exam");
    }

}
