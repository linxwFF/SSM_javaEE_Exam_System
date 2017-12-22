package com.common.model;

import java.util.Date;

public class EPaper {
    private Integer id;

    private Long userId;

    private Integer typeId;

    private Integer courseId;

    private Integer chapterId;

    private Integer mode;

    private String examTitle;

    private Integer state;

    private Integer examTime;

    private String srandom;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    private String questions;

    public EPaper(Integer id, Long userId, Integer typeId, Integer courseId, Integer chapterId, Integer mode, String examTitle, Integer state, Integer examTime, String srandom, Date updateTime, Date createTime, Date deleteTime, String questions) {
        this.id = id;
        this.userId = userId;
        this.typeId = typeId;
        this.courseId = courseId;
        this.chapterId = chapterId;
        this.mode = mode;
        this.examTitle = examTitle;
        this.state = state;
        this.examTime = examTime;
        this.srandom = srandom;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
        this.questions = questions;
    }

    public EPaper() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    public String getExamTitle() {
        return examTitle;
    }

    public void setExamTitle(String examTitle) {
        this.examTitle = examTitle == null ? null : examTitle.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getExamTime() {
        return examTime;
    }

    public void setExamTime(Integer examTime) {
        this.examTime = examTime;
    }

    public String getSrandom() {
        return srandom;
    }

    public void setSrandom(String srandom) {
        this.srandom = srandom == null ? null : srandom.trim();
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

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions == null ? null : questions.trim();
    }
}