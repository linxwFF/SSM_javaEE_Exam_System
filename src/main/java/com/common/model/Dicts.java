package com.common.model;

import java.util.Date;

public class Dicts {
    private Integer id;

    private String code;

    private String codeName;

    private Integer value;

    private String text;

    private String remarks;

    private Date deletedAt;

    private Date createdAt;

    private Date updatedAt;

    public Dicts(Integer id, String code, String codeName, Integer value, String text, String remarks, Date deletedAt, Date createdAt, Date updatedAt) {
        this.id = id;
        this.code = code;
        this.codeName = codeName;
        this.value = value;
        this.text = text;
        this.remarks = remarks;
        this.deletedAt = deletedAt;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Dicts() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName == null ? null : codeName.trim();
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {
        this.deletedAt = deletedAt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}