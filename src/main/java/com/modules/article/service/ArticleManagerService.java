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
    List<ArticleCategory> findAll_Table();

    //添加文章分类
    int insert(ArticleCategory articleCategory);

    //批量删除文章分类
    Map<String, Object> delete(String ids);

    //删除文章分类
    int deleteByPrimaryKey(int id);
}
