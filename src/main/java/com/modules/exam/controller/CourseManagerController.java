package com.modules.exam.controller;

import com.alibaba.fastjson.JSON;
import com.common.controller.BaseController;
import com.common.model.ArticleCategory;
import com.common.model.QCourse;
import com.common.utils.LoggerUtils;
import com.modules.exam.service.CourseManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/29.
 */
@Controller
@RequestMapping("courseManager")
public class CourseManagerController extends BaseController {

    @Autowired
    private CourseManagerService courseManagerService;

    //列表
    @RequestMapping(value="courseManager_index",method = RequestMethod.GET)
    public ModelAndView courseManagerIndex(){
        return new ModelAndView("exam/course_manager");
    }

    //列表 _table
    @RequestMapping(value="courseManager_index",method = RequestMethod.POST)
    @ResponseBody
    public String courseManagerIndex(ModelMap map){

        List<QCourse> allArticleCategory = courseManagerService.findAll_Table();
        map.put("data",allArticleCategory);
        String jsonString = JSON.toJSONString(map);
        return jsonString;
    }

    //添加
    @RequestMapping(value="addCourseManager",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addCourseManager(QCourse model){
        try {
            int count = courseManagerService.insert(model);
            resultMap.put("status", 200);
            resultMap.put("successCount", count);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "添加失败，请刷新后再试！");
            LoggerUtils.fmtError(getClass(), e, "添加文章分类错误。source[%s]", model.toString());
        }
        return resultMap;
    }

    //删除
    @RequestMapping(value="deleteCourseManagerById",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteCourseManagerById(String ids){

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("status", 200);
        resultMap.put("count", 1);
        resultMap.put("message","假装删除成功了");
        return resultMap;

//        return courseManagerService.delete(ids);
    }
}
