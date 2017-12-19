package com.modules.exam.bo;

/**
 * Created by LINxwFF on 2017/12/19.
 */
public class EPapersCondition {

    private long user_id;
    private Integer type;
    private Integer courseType;
    private Integer chapter_id;
    private Integer mode;
    private Integer state;

    public EPapersCondition() {
    }

    public EPapersCondition(Integer chapter_id, Integer courseType, Integer mode, Integer state, Integer type, long user_id) {
        this.chapter_id = chapter_id;
        this.courseType = courseType;
        this.mode = mode;
        this.state = state;
        this.type = type;
        this.user_id = user_id;
    }

    public Integer getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(Integer chapter_id) {
        this.chapter_id = chapter_id;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }
}
