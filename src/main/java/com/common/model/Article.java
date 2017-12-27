package com.common.model;

import java.util.Date;

public class Article {
    private Integer id;

    private Integer userId;

    private String title;

    private String anthor;

    private Integer typeId;

    private String loadurl;

    private Integer tag;

    private String decoration;

    private Integer state;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    private String content;

    public Article(Integer id, Integer userId, String title, String anthor, Integer typeId, String loadurl, Integer tag, String decoration, Integer state, Date updateTime, Date createTime, Date deleteTime, String content) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.anthor = anthor;
        this.typeId = typeId;
        this.loadurl = loadurl;
        this.tag = tag;
        this.decoration = decoration;
        this.state = state;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
        this.content = content;
    }

    public Article() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAnthor() {
        return anthor;
    }

    public void setAnthor(String anthor) {
        this.anthor = anthor == null ? null : anthor.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getLoadurl() {
        return loadurl;
    }

    public void setLoadurl(String loadurl) {
        this.loadurl = loadurl == null ? null : loadurl.trim();
    }

    public Integer getTag() {
        return tag;
    }

    public void setTag(Integer tag) {
        this.tag = tag;
    }

    public String getDecoration() {
        return decoration;
    }

    public void setDecoration(String decoration) {
        this.decoration = decoration == null ? null : decoration.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}