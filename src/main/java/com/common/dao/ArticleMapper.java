package com.common.dao;

import com.common.model.Article;
import com.common.model.ArticleCategory;
import com.modules.article.bo.ArticleDetailVo;
import com.modules.article.bo.ArticleListVo;

import java.util.List;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    //文章详情
    ArticleDetailVo selectById(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    //获取所有的文章列表
    List<ArticleListVo> findAll_Table();

    //根据类别查询出新闻信息
    List<ArticleListVo> findAllByType(Integer type);
}