package com.common.model;

public class EScores {
    private Integer id;

    private Long userId;

    private Integer examSrandomId;

    private Integer totalNum;

    private Integer rightNum;

    private Integer errorNum;

    private Double score;

    private Integer takeTime;

    public EScores(Integer id, Long userId, Integer examSrandomId, Integer totalNum, Integer rightNum, Integer errorNum, Double score, Integer takeTime) {
        this.id = id;
        this.userId = userId;
        this.examSrandomId = examSrandomId;
        this.totalNum = totalNum;
        this.rightNum = rightNum;
        this.errorNum = errorNum;
        this.score = score;
        this.takeTime = takeTime;
    }

    public EScores() {
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

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getRightNum() {
        return rightNum;
    }

    public void setRightNum(Integer rightNum) {
        this.rightNum = rightNum;
    }

    public Integer getErrorNum() {
        return errorNum;
    }

    public void setErrorNum(Integer errorNum) {
        this.errorNum = errorNum;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(Integer takeTime) {
        this.takeTime = takeTime;
    }
}