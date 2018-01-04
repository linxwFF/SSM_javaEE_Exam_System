package com.modules.article.bo;

import com.common.model.Article;

import java.util.Date;

/**
 * Created by LINxwFF on 2018/1/4.
 */
public class ArticleDetailVo {

    private Integer id;

    private String title;

    private String anthor;

    private String loadurl;

    private Integer tag;

    private String decoration;

    private Date updateTime;

    private String content;

    private String categoryName;

    public ArticleDetailVo() {
    }

    public ArticleDetailVo(String anthor, String categoryName, String content, String decoration, Integer id, String loadurl, Integer tag, String title, Date updateTime) {
        this.anthor = anthor;
        this.categoryName = categoryName;
        this.content = content;
        this.decoration = decoration;
        this.id = id;
        this.loadurl = loadurl;
        this.tag = tag;
        this.title = title;
        this.updateTime = updateTime;
    }

    public String getAnthor() {
        return anthor;
    }

    public void setAnthor(String anthor) {
        this.anthor = anthor;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDecoration() {
        return decoration;
    }

    public void setDecoration(String decoration) {
        this.decoration = decoration;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoadurl() {
        return loadurl;
    }

    public void setLoadurl(String loadurl) {
        this.loadurl = loadurl;
    }

    public Integer getTag() {
        return tag;
    }

    public void setTag(Integer tag) {
        this.tag = tag;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
