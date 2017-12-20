package com.common.model;

import java.io.Serializable;
import java.util.Date;

public class QQuestion implements Serializable {

    private static final long serialVersionUID = -2060550357305407661L;

    private Integer id;

    private String subject;

    private String chooseA;

    private String chooseB;

    private String chooseC;

    private String chooseD;

    private String chooseE;

    private String chooseF;

    private String chooseG;

    private String chooseRight;

    private String analysis;

    private String type;

    private Integer courseType;

    private Integer courseTypeId;

    private Integer chapterId;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    private String imgUrl;

    public QQuestion(Integer id, String subject, String chooseA, String chooseB, String chooseC, String chooseD, String chooseE, String chooseF, String chooseG, String chooseRight, String analysis, String type, Integer courseType, Integer courseTypeId, Integer chapterId, Date updateTime, Date createTime, Date deleteTime, String imgUrl) {
        this.id = id;
        this.subject = subject;
        this.chooseA = chooseA;
        this.chooseB = chooseB;
        this.chooseC = chooseC;
        this.chooseD = chooseD;
        this.chooseE = chooseE;
        this.chooseF = chooseF;
        this.chooseG = chooseG;
        this.chooseRight = chooseRight;
        this.analysis = analysis;
        this.type = type;
        this.courseType = courseType;
        this.courseTypeId = courseTypeId;
        this.chapterId = chapterId;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
        this.imgUrl = imgUrl;
    }

    public QQuestion() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getChooseA() {
        return chooseA;
    }

    public void setChooseA(String chooseA) {
        this.chooseA = chooseA == null ? null : chooseA.trim();
    }

    public String getChooseB() {
        return chooseB;
    }

    public void setChooseB(String chooseB) {
        this.chooseB = chooseB == null ? null : chooseB.trim();
    }

    public String getChooseC() {
        return chooseC;
    }

    public void setChooseC(String chooseC) {
        this.chooseC = chooseC == null ? null : chooseC.trim();
    }

    public String getChooseD() {
        return chooseD;
    }

    public void setChooseD(String chooseD) {
        this.chooseD = chooseD == null ? null : chooseD.trim();
    }

    public String getChooseE() {
        return chooseE;
    }

    public void setChooseE(String chooseE) {
        this.chooseE = chooseE == null ? null : chooseE.trim();
    }

    public String getChooseF() {
        return chooseF;
    }

    public void setChooseF(String chooseF) {
        this.chooseF = chooseF == null ? null : chooseF.trim();
    }

    public String getChooseG() {
        return chooseG;
    }

    public void setChooseG(String chooseG) {
        this.chooseG = chooseG == null ? null : chooseG.trim();
    }

    public String getChooseRight() {
        return chooseRight;
    }

    public void setChooseRight(String chooseRight) {
        this.chooseRight = chooseRight == null ? null : chooseRight.trim();
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis == null ? null : analysis.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
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

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }
}