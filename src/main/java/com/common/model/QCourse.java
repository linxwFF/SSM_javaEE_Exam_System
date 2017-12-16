package com.common.model;

import java.util.Date;

public class QCourse {
    private Integer id;

    private Integer parentId;

    private String name;

    private Integer type;

    private Boolean status;

    private Integer sortOrder;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    public QCourse(Integer id, Integer parentId, String name, Integer type, Boolean status, Integer sortOrder, Date updateTime, Date createTime, Date deleteTime) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.type = type;
        this.status = status;
        this.sortOrder = sortOrder;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
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