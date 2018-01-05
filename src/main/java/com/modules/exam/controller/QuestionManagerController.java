package com.modules.exam.controller;

import com.common.controller.BaseController;
import com.common.model.QQuestion;
import com.common.utils.LoggerUtils;
import com.modules.exam.bo.QQuestionVo;
import com.modules.exam.service.QuestionManagerService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2018/1/5.
 */
@Controller
@RequestMapping(value = "QuestionManager")
public class QuestionManagerController extends BaseController{

    @Autowired
    QuestionManagerService questionManagerService;

    @RequestMapping(value="list",method= RequestMethod.GET)
    public ModelAndView list(){
        return new ModelAndView("question/list");
    }

    //查找到所有的题库数据 Datatable json返回数据
    @RequestMapping(value="list",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> list_Table(){
        List<QQuestionVo> examManageList = questionManagerService.findAll_Table();
        Map<String,Object> map = new HashMap<>();
        map.put("data", examManageList);
        return map;
    }

    //显示增加题库的页面
    @RequestMapping(value="insert",method= RequestMethod.GET)
    public ModelAndView show_insert(){
        return new ModelAndView("question/insert");
    }

    //增加考题操作
    @RequestMapping(value="insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insert(QQuestion question){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            questionManagerService.insert(question);
            resultMap.put("status", 200);
            resultMap.put("message", "增加成功!");
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "添加失败，请刷新后再试！");
            LoggerUtils.fmtError(getClass(), e, "添加权限报错。source[%s]", question.toString());
        }
        return resultMap;
    }

    //根据ID查找题目
    @RequestMapping(value="update",method= RequestMethod.GET)
    public ModelAndView show_update(Integer id){
        QQuestion qQuestion = questionManagerService.select(id);
        return new ModelAndView("question/update","qQuestion",qQuestion);
    }

    //修改考题操作
    @RequestMapping(value="update",method= RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(QQuestion qQuestion){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            questionManagerService.update(qQuestion);
            resultMap.put("status", 200);
            resultMap.put("message", "修改成功!");
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "修改失败!");
            LoggerUtils.fmtError(getClass(), e, "修改题目出错。[%s]", JSONObject.fromObject(qQuestion).toString());
        }
        return resultMap;
    }

    //删除题库中的一个题目
    @RequestMapping(value="delete")
    @ResponseBody
    public Map<String, Object> delete(Integer id) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            resultMap.put("status", 200);
            resultMap.put("message", "操作成功");
            questionManagerService.delete(id);
        } catch (Exception e) {
            resultMap.put("status", 300);
            resultMap.put("message", "操作失败，请重试！");
        }
        return resultMap;
    }
}
