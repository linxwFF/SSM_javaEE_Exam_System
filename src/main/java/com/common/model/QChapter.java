package com.common.model;

import java.util.Date;

public class QChapter {
    private Integer id;

    private Integer pid;

    private Integer courseTypeId;

    private String chapterName;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    public QChapter(Integer id, Integer pid, Integer courseTypeId, String chapterName, Date updateTime, Date createTime, Date deleteTime) {
        this.id = id;
        this.pid = pid;
        this.courseTypeId = courseTypeId;
        this.chapterName = chapterName;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
    }

    public QChapter() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName == null ? null : chapterName.trim();
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