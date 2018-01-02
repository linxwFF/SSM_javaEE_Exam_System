package com.modules.article.bo;

import com.common.model.Article;

import java.util.Date;

/**
 * Created by LINxwFF on 2018/1/2.
 */
public class ArticleListVo extends Article {

    private String articleCategoryName;

    public ArticleListVo() {
    }

    public ArticleListVo(Integer id, Long userId, String title, String anthor, Integer typeId, String loadurl, Integer tag, String decoration, Integer state, Date updateTime, Date createTime, Date deleteTime, String content, String articleCategory) {
        super(id, userId, title, anthor, typeId, loadurl, tag, decoration, state, updateTime, createTime, deleteTime, content);
        this.articleCategoryName = articleCategory;
    }

    public String getArticleCategory() {
        return articleCategoryName;
    }

    public void setArticleCategory(String articleCategory) {
        this.articleCategoryName = articleCategory;
    }
}
