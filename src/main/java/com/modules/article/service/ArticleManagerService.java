package com.modules.article.service;

import com.common.model.ArticleCategory;
import com.common.model.UPermission;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/26.
 */
public interface ArticleManagerService {

    //获取所有的文章分类
    List<ArticleCategory> findAllArticleCategory();

    //添加文章分类
    int insertArticleCategorySelective(ArticleCategory articleCategory);

    //批量删除文章分类
    Map<String, Object> deleteArticleCategoryById(String ids);

    //删除文章分类
    int deleteArticleCategoryByPrimaryKey(int id);
}
