package com.modules.exam.controller;

import com.common.controller.BaseController;
import com.common.model.QCourse;
import com.modules.core.mybatis.page.Pagination;
import com.modules.exam.bo.QKCourse;
import com.modules.exam.service.DictsService;
import com.modules.exam.service.ExamService;
import com.modules.exam.service.impl.ExamServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
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
    private ExamService examService;
    @Autowired
    private DictsService dictsService;

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
        Pagination<QCourse> page = examService.findByPage(map,pageNo,pageSize);
        map.put("page", page);

        return new ModelAndView("exam/choose_course");
    }

    //2.根据考试专业项目的type查询出所有的考试科目列表
    //q_course -> dicts course_type 会计科目 remarks的值
    @RequestMapping(value="get_course_list")
    public ModelAndView getCourseList(ModelMap map,String findContent, Integer remarks){

        List<QKCourse> qkCourseList = dictsService.findAllByCourse(findContent,remarks);

        map.put("list", qkCourseList);
        map.put("remarks",remarks);     //考试项目

        return new ModelAndView("exam/get_course_list");
    }

    //3.考试的模式选择     type=${remarks}考试项目  &courseType=${it.value}考试科目
    @RequestMapping(value="get_model_list")
    public ModelAndView getModelList(ModelMap map,Integer type,Integer courseType){

        Map<String,String> modelList = new LinkedHashMap<>();

        modelList.put("model1","随机组卷模式");
        modelList.put("model2","往年真题模式");
        modelList.put("model3","章节练习");
        modelList.put("model4","大题练习");
        modelList.put("model5","错题练习");

        map.put("modelList",modelList);

        map.put("type",type);
        map.put("courseType",courseType);

        return new ModelAndView("exam/get_model_list");
    }


    //2.通用的考试模式方法
    @RequestMapping(value="{page}",method=RequestMethod.GET)
    public ModelAndView toPage(@PathVariable("page")String page){
        return new ModelAndView(String.format("exam/%s", page));
    }

    //3.
    // 1.随机组卷模式
    @RequestMapping(value="mode1",method=RequestMethod.GET)
    public ModelAndView mode1(String page){
        return new ModelAndView(String.format("exam/model1", page));
    }
    // 2.往年真题模式
    @RequestMapping(value="mode2",method=RequestMethod.GET)
    public ModelAndView mode2(String page){
        return new ModelAndView(String.format("exam/model2", page));
    }

    //章节列表选择  一个可以多选章节的页面
    @RequestMapping(value="chapterList",method=RequestMethod.GET)
    public ModelAndView chapterList(String page){
        return new ModelAndView(String.format("exam/chapterList", page));
    }

    // 3.章节练习
    @RequestMapping(value="mode3",method=RequestMethod.GET)
    public ModelAndView mode3(String page){
        return new ModelAndView(String.format("exam/model3", page));
    }
    // 4.大题练习
    @RequestMapping(value="mode4",method=RequestMethod.GET)
    public ModelAndView mode4(String page){
        return new ModelAndView(String.format("exam/model4", page));
    }
    // 5.错题练习
    @RequestMapping(value="mode5",method=RequestMethod.GET)
    public ModelAndView mode5(String page){
        return new ModelAndView(String.format("exam/model5", page));
    }
}
