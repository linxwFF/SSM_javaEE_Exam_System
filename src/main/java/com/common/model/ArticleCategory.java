package com.common.model;

public class ArticleCategory {
    private Integer id;

    private Integer parentId;

    private String name;

    private Integer state;

    private Integer sortOrder;

    public ArticleCategory(Integer id, Integer parentId, String name, Integer state, Integer sortOrder) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.state = state;
        this.sortOrder = sortOrder;
    }

    public ArticleCategory() {
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
}