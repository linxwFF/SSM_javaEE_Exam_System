package com.common.dao;

import com.common.model.Article;
import com.common.model.ArticleCategory;

import java.util.List;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    //获取所有的文章列表
    List<ArticleCategory> findAll_Table();
}