package com.common.model;

import java.util.Date;

public class EAnswerRecords {
    private Integer id;

    private Long userId;

    private Integer examSrandomId;

    private Integer scoresId;

    private Date updateTime;

    private Date createTime;

    private Date deleteTime;

    private String answer;

    public EAnswerRecords(Integer id, Long userId, Integer examSrandomId, Integer scoresId, Date updateTime, Date createTime, Date deleteTime, String answer) {
        this.id = id;
        this.userId = userId;
        this.examSrandomId = examSrandomId;
        this.scoresId = scoresId;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleteTime = deleteTime;
        this.answer = answer;
    }

    public EAnswerRecords() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getExamSrandomId() {
        return examSrandomId;
    }

    public void setExamSrandomId(Integer examSrandomId) {
        this.examSrandomId = examSrandomId;
    }

    public Integer getScoresId() {
        return scoresId;
    }

    public void setScoresId(Integer scoresId) {
        this.scoresId = scoresId;
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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }
}