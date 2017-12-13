package com.common.model;

import java.util.Date;

public class QCourse {
    private Integer id;

    private String courseName;

    private Integer type;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    public QCourse(Integer id, String courseName, Integer type, Date updateTime, Date createTime, Date deleteTime) {
        this.id = id;
        this.courseName = courseName;
        this.type = type;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
    }

    public QCourse() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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
}