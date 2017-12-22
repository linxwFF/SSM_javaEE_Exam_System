package com.modules.exam.bo;

import java.awt.print.Paper;
import java.util.Date;

/**
 * Created by LINxwFF on 2017/12/22.
 */
public class AnswerRecordsListVo {

    private int id;
    //试卷名称
    private String exam_title;
    //考试规定时间
    private int exam_time;
    //考试题目数量
    private int total_num;
    //考试花费时间
    private int take_time;
    //考试成绩
    private int score;
    //答对题数目
    private int right_num;
    //答错题数目
    private int error_num;
    //考试创建时间
    private Date create_time;

    public AnswerRecordsListVo(Date create_time, int error_num, int exam_time, String exam_title, int id, int right_num, int score, int take_time, int total_num) {
        this.create_time = create_time;
        this.error_num = error_num;
        this.exam_time = exam_time;
        this.exam_title = exam_title;
        this.id = id;
        this.right_num = right_num;
        this.score = score;
        this.take_time = take_time;
        this.total_num = total_num;
    }

    public AnswerRecordsListVo() {
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public int getError_num() {
        return error_num;
    }

    public void setError_num(int error_num) {
        this.error_num = error_num;
    }

    public int getExam_time() {
        return exam_time;
    }

    public void setExam_time(int exam_time) {
        this.exam_time = exam_time;
    }

    public String getExam_title() {
        return exam_title;
    }

    public void setExam_title(String exam_title) {
        this.exam_title = exam_title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRight_num() {
        return right_num;
    }

    public void setRight_num(int right_num) {
        this.right_num = right_num;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTake_time() {
        return take_time;
    }

    public void setTake_time(int take_time) {
        this.take_time = take_time;
    }

    public int getTotal_num() {
        return total_num;
    }

    public void setTotal_num(int total_num) {
        this.total_num = total_num;
    }
}
