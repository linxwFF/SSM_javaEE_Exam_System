package com.modules.article.controller;

import com.alibaba.fastjson.JSON;
import com.common.controller.BaseController;
import com.common.model.ArticleCategory;
import com.common.model.UPermission;
import com.common.utils.LoggerUtils;
import com.modules.article.service.ArticleManagerService;
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
 * Created by LINxwFF on 2017/12/26.
 */
@Controller
@RequestMapping("articleManager")
public class ArticleManagerController extends BaseController {

    @Autowired
    private ArticleManagerService articleManagerService;

    @RequestMapping(value = "add_article")
    public ModelAndView index()
    {
        return new ModelAndView("articleManager/add_article");
    }

    @RequestMapping(value = "add_article_do")
    public ModelAndView add_article()
    {

        return new ModelAndView("articleManager/add_article");
    }

    //文章分类列表
    @RequestMapping(value="article_category_manager_index",method = RequestMethod.GET)
    public ModelAndView articleCategoryManagerIndex(){
        return new ModelAndView("articleManager/article_category_manager_index");
    }

    //文章分类列表 _table
    @RequestMapping(value="article_category_manager_index",method = RequestMethod.POST)
    @ResponseBody
    public String articleCategoryManagerIndexData(ModelMap map){

        List<ArticleCategory> allArticleCategory = articleManagerService.findAllArticleCategory();
        map.put("data",allArticleCategory);
        String jsonString = JSON.toJSONString(map);
        return jsonString;
    }

    //添加文章分类
    @RequestMapping(value="addArticleCategory",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addArticleCategory(ArticleCategory articleCategory){
        try {
            int count = articleManagerService.insertArticleCategorySelective(articleCategory);
            resultMap.put("status", 200);
            resultMap.put("successCount", count);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "添加失败，请刷新后再试！");
            LoggerUtils.fmtError(getClass(), e, "添加文章分类错误。source[%s]", articleCategory.toString());
        }
        return resultMap;
    }

    //删除文章分类
    @RequestMapping(value="deleteArticleCategoryById",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteArticleCategoryById(String ids){

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("status", 200);
        resultMap.put("count", 1);
        resultMap.put("message","删除成功了");
//        return resultMap;

		return articleManagerService.deleteArticleCategoryById(ids);
    }

}
