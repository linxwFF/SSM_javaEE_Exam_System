package com.modules.exam.bo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by LINxwFF on 2017/12/16.
 */
public class QKCourse implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;

    private Integer parent_id;

    private String name;            //科目名称

    private Integer type;          //考试类型type

    private Integer status;        //考试状态

    private Integer sortOrder;     //排序

    private List<QKCourse> subCourse; //子课程

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    public QKCourse(Date createTime, Date deleteTime, Integer id, String name, Integer parent_id, Integer sortOrder, Integer status, List<QKCourse> subCourse, Integer type, Date updateTime) {
        this.createTime = createTime;
        this.deleteTime = deleteTime;
        this.id = id;
        this.name = name;
        this.parent_id = parent_id;
        this.sortOrder = sortOrder;
        this.status = status;
        this.subCourse = subCourse;
        this.type = type;
        this.updateTime = updateTime;
    }

    public QKCourse() {
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<QKCourse> getSubCourse() {
        return subCourse;
    }

    public void setSubCourse(List<QKCourse> subCourse) {
        this.subCourse = subCourse;
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
}

