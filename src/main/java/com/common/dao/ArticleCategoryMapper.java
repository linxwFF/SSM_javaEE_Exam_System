package com.common.dao;

import com.common.model.ArticleCategory;

import java.util.List;
import java.util.Set;

public interface ArticleCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleCategory record);

    int insertSelective(ArticleCategory record);

    ArticleCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ArticleCategory record);

    int updateByPrimaryKey(ArticleCategory record);

    //获取所有的文章分类列表
    List<ArticleCategory> findAllArticleCategory();

}