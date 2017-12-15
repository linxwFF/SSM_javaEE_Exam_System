package com.modules.exam.bo;

import java.io.Serializable;

/**
 * Created by LINxwFF on 2017/12/16.
 */
public class QKCourse implements Serializable {
    private static final long serialVersionUID = 1L;

    private String QKCourseName;    //考试科目

    private Integer value;          //考试类型type

    public QKCourse(String QKCourseName, Integer value) {
        this.QKCourseName = QKCourseName;
        this.value = value;
    }

    public QKCourse() {
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getQKCourseName() {
        return QKCourseName;
    }

    public void setQKCourseName(String QKCourseName) {
        this.QKCourseName = QKCourseName;
    }
}
