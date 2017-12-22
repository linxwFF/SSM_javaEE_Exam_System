package com.common.model;

public class EScoresWithBLOBs extends EScores {
    private String answerSucRecords;

    private String answerErrRecords;

    public EScoresWithBLOBs(Integer id, Long userId, Integer examSrandomId, Integer totalNum, Integer rightNum, Integer errorNum, Double score, Integer takeTime, String answerSucRecords, String answerErrRecords) {
        super(id, userId, examSrandomId, totalNum, rightNum, errorNum, score, takeTime);
        this.answerSucRecords = answerSucRecords;
        this.answerErrRecords = answerErrRecords;
    }

    public EScoresWithBLOBs() {
        super();
    }

    public String getAnswerSucRecords() {
        return answerSucRecords;
    }

    public void setAnswerSucRecords(String answerSucRecords) {
        this.answerSucRecords = answerSucRecords == null ? null : answerSucRecords.trim();
    }

    public String getAnswerErrRecords() {
        return answerErrRecords;
    }

    public void setAnswerErrRecords(String answerErrRecords) {
        this.answerErrRecords = answerErrRecords == null ? null : answerErrRecords.trim();
    }
}