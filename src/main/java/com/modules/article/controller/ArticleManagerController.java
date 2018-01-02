package com.modules.article.controller;

import com.common.controller.BaseController;
import com.common.dao.ArticleMapper;
import com.common.dao.QCourseMapper;
import com.common.model.Article;
import com.common.model.ArticleCategory;
import com.common.utils.LoggerUtils;
import com.modules.article.bo.ArticleListVo;
import com.modules.article.service.ArticleCategoryManagerService;
import com.modules.article.service.ArticleManagerService;
import com.modules.core.mybatis.page.Pagination;
import com.modules.core.shiro.token.manager.TokenManager;
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
    private ArticleCategoryManagerService articleCategoryManagerService;

    @Autowired
    private ArticleManagerService articleManagerService;

    @RequestMapping(value = "add_article")
    public ModelAndView index(ModelMap map)
    {
        //文章分类
        List<ArticleCategory> allArticleCategory = articleCategoryManagerService.findAll_Table();
        map.put("article_category",allArticleCategory);

        return new ModelAndView("articleManager/add_article");
    }

    @RequestMapping(value = "add_article_do")
    @ResponseBody
    public Map<String,Object> add_article(Article article)
    {
        Map<String,Object> map = new HashMap<>();
        article.setUserId(TokenManager.getUserId());
        article.setAnthor(TokenManager.getNickname());
        try {
            articleManagerService.insert(article);
            map.put("status", 200);
        } catch (Exception e) {
            map.put("status", 500);
            map.put("message", "添加失败，请刷新后再试！");
            LoggerUtils.fmtError(getClass(), e, "添加文章错误。source[%s]", articleManagerService.toString());
        }
        return map;
    }

    //文章前端列表 根据分类
    @RequestMapping(value="beforeEndArticleList",method = RequestMethod.GET)
    public ModelAndView beforeEndArticleList(ModelMap map, Integer pageNo, String findContent,Integer type){

//        //通知消息
//        List<ArticleListVo> info_type1 = articleManagerService.findAllByType(1);
//        //考试动态
//        List<ArticleListVo> info_type2 = articleManagerService.findAllByType(2);
//        //备考文库
//        List<ArticleListVo> info_type3 = articleManagerService.findAllByType(3);
//
//        map.put("type1",info_type1);
//        map.put("type2",info_type2);
//        map.put("type3",info_type3);

        //分页，列表
        map.put("findContent", findContent);
        map.put("type",1);
        Pagination<ArticleMapper> page_type1 = articleManagerService.findByPage(map,pageNo,pageSize);
        map.put("page_type1", page_type1);


        map.put("findContent", findContent);
        map.put("type",2);
        Pagination<ArticleMapper> page_type2 = articleManagerService.findByPage(map,pageNo,pageSize);
        map.put("page_type2", page_type2);


        map.put("findContent", findContent);
        map.put("type",3);
        Pagination<ArticleMapper> page_type3 = articleManagerService.findByPage(map,pageNo,pageSize);
        map.put("page_type3", page_type3);

        return new ModelAndView("articleManager/beforeEnd/beforeEndArticleList");
    }



    //文章前端详情


    //文章列表
    @RequestMapping(value="article_manager_index",method = RequestMethod.GET)
    public ModelAndView articleManagerIndex(){
        return new ModelAndView("articleManager/article_manager_index");
    }

    //文章列表 datatable json返回数据
    @RequestMapping(value="article_manager_index",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> articleManagerIndexData(){
        List<ArticleListVo> articleList = articleManagerService.findAll_Table();
        resultMap.put("data",articleList);
        return resultMap;
    }

    //删除文章
    @RequestMapping(value="deleteArticleById",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteArticleById(String ids){

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("status", 200);
        resultMap.put("count", 1);
        resultMap.put("message","删除成功了");
//        return resultMap;

        return articleManagerService.delete(ids);
    }

    //改变文章发布状态
    @RequestMapping(value="ChangeStateById",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> ChangeStateById(Integer id,Integer status){
        return articleManagerService.updateChangeStateById(id,status);
    }

    //文章分类管理
    //文章分类列表
    @RequestMapping(value="article_category_manager_index",method = RequestMethod.GET)
    public ModelAndView articleCategoryManagerIndex(){
        return new ModelAndView("articleManager/article_category_manager_index");
    }

    //文章分类列表 datatable json返回数据
    @RequestMapping(value="article_category_manager_index",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> articleCategoryManagerIndexData(){
        List<ArticleCategory> allArticleCategory = articleCategoryManagerService.findAll_Table();
        resultMap.put("data",allArticleCategory);
        return resultMap;
    }

    //添加文章分类
    @RequestMapping(value="addArticleCategory",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addArticleCategory(ArticleCategory articleCategory){
        try {
            int count = articleCategoryManagerService.insert(articleCategory);
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
        return resultMap;

//		return articleCategoryManagerService.delete(ids);
    }

}
