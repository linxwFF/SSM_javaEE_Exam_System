package com.modules.exam.bo;

import java.util.Date;

/**
 * Created by LINxwFF on 2018/1/5.
 */
public class QQuestionVo {

    private Integer id;

    private String subject;

    private String choose_A;

    private String choose_B;

    private String choose_C;

    private String choose_D;

    private String choose_E;

    private String choose_F;

    private String choose_G;

    private String choose_right;

    private String analysis;

    //考试类型
    private String typeName;

    private Integer type;

    //考试项目名
    private String CourseName;

    //考试科目名
    private String courseTypeIdName;

    //章节名
    private String chapterName;

    //节名
    private String chapterSubName;

    private Date update_time;

    private Date create_time;

    //图片类型的题目，即一张图一道题
    private String img_url;

    public QQuestionVo() {
    }

    public QQuestionVo(String analysis, String chapterName, String chapterSubName, String choose_A, String choose_B, String choose_C, String choose_D, String choose_E, String choose_F, String choose_G, String choose_right, String courseName, String courseTypeIdName, Date create_time, Integer id, String img_url, String subject, Integer type, String typeName, Date update_time) {
        this.analysis = analysis;
        this.chapterName = chapterName;
        this.chapterSubName = chapterSubName;
        this.choose_A = choose_A;
        this.choose_B = choose_B;
        this.choose_C = choose_C;
        this.choose_D = choose_D;
        this.choose_E = choose_E;
        this.choose_F = choose_F;
        this.choose_G = choose_G;
        this.choose_right = choose_right;
        CourseName = courseName;
        this.courseTypeIdName = courseTypeIdName;
        this.create_time = create_time;
        this.id = id;
        this.img_url = img_url;
        this.subject = subject;
        this.type = type;
        this.typeName = typeName;
        this.update_time = update_time;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getChapterSubName() {
        return chapterSubName;
    }

    public void setChapterSubName(String chapterSubName) {
        this.chapterSubName = chapterSubName;
    }

    public String getChoose_A() {
        return choose_A;
    }

    public void setChoose_A(String choose_A) {
        this.choose_A = choose_A;
    }

    public String getChoose_B() {
        return choose_B;
    }

    public void setChoose_B(String choose_B) {
        this.choose_B = choose_B;
    }

    public String getChoose_C() {
        return choose_C;
    }

    public void setChoose_C(String choose_C) {
        this.choose_C = choose_C;
    }

    public String getChoose_D() {
        return choose_D;
    }

    public void setChoose_D(String choose_D) {
        this.choose_D = choose_D;
    }

    public String getChoose_E() {
        return choose_E;
    }

    public void setChoose_E(String choose_E) {
        this.choose_E = choose_E;
    }

    public String getChoose_F() {
        return choose_F;
    }

    public void setChoose_F(String choose_F) {
        this.choose_F = choose_F;
    }

    public String getChoose_G() {
        return choose_G;
    }

    public void setChoose_G(String choose_G) {
        this.choose_G = choose_G;
    }

    public String getChoose_right() {
        return choose_right;
    }

    public void setChoose_right(String choose_right) {
        this.choose_right = choose_right;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String courseName) {
        CourseName = courseName;
    }

    public String getCourseTypeIdName() {
        return courseTypeIdName;
    }

    public void setCourseTypeIdName(String courseTypeIdName) {
        this.courseTypeIdName = courseTypeIdName;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
