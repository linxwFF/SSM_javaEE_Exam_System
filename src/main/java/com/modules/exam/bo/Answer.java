package com.modules.exam.bo;

/**
 * Created by LINxwFF on 2017/12/19.
 */
public class Answer {

    //题目
    private String subject;

    //选择答案
    private String chooseA;

    private String chooseB;

    private String chooseC;

    private String chooseD;

    private String chooseE;

    private String chooseF;

    private String chooseG;

    private String chooseRight;

    private String analysis;

    //选择
    private String choose;

    //分数
    //选择题1分  多选题2  判断题1分  大题每小题2分
    private int score;

    //1.选择 2.多选 3.判断
    private int type;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Answer() {
    }

    public Answer(String analysis, String choose, String chooseA, String chooseB, String chooseC, String chooseD, String chooseE, String chooseF, String chooseG, String chooseRight, int score, String subject, int type) {
        this.analysis = analysis;
        this.choose = choose;
        this.chooseA = chooseA;
        this.chooseB = chooseB;
        this.chooseC = chooseC;
        this.chooseD = chooseD;
        this.chooseE = chooseE;
        this.chooseF = chooseF;
        this.chooseG = chooseG;
        this.chooseRight = chooseRight;
        this.score = score;
        this.subject = subject;
        this.type = type;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose;
    }

    public String getChooseA() {
        return chooseA;
    }

    public void setChooseA(String chooseA) {
        this.chooseA = chooseA;
    }

    public String getChooseB() {
        return chooseB;
    }

    public void setChooseB(String chooseB) {
        this.chooseB = chooseB;
    }

    public String getChooseC() {
        return chooseC;
    }

    public void setChooseC(String chooseC) {
        this.chooseC = chooseC;
    }

    public String getChooseD() {
        return chooseD;
    }

    public void setChooseD(String chooseD) {
        this.chooseD = chooseD;
    }

    public String getChooseE() {
        return chooseE;
    }

    public void setChooseE(String chooseE) {
        this.chooseE = chooseE;
    }

    public String getChooseF() {
        return chooseF;
    }

    public void setChooseF(String chooseF) {
        this.chooseF = chooseF;
    }

    public String getChooseG() {
        return chooseG;
    }

    public void setChooseG(String chooseG) {
        this.chooseG = chooseG;
    }

    public String getChooseRight() {
        return chooseRight;
    }

    public void setChooseRight(String chooseRight) {
        this.chooseRight = chooseRight;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
