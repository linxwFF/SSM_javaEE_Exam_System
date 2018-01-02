package com.modules.article.service;

import com.common.dao.ArticleMapper;
import com.common.dao.QCourseMapper;
import com.common.model.Article;
import com.common.model.ArticleCategory;
import com.modules.article.bo.ArticleListVo;
import com.modules.core.mybatis.page.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2018/1/1.
 */
public interface ArticleManagerService {

    //获取所有的文章
    List<ArticleListVo> findAll_Table();

    //添加文章
    int insert(Article article);

    //批量删除文章
    Map<String, Object> delete(String ids);

    //删除文章
    int deleteByPrimaryKey(int id);

    //改变文章发布状态
    Map<String, Object> updateChangeStateById(Integer id, Integer status);

    //根据类别查询出新闻信息
    List<ArticleListVo> findAllByType(Integer type);

    //消息，分页
    Pagination<ArticleMapper> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize);

}
