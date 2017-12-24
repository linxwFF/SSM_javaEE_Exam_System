package com.modules.exam.bo;

import java.util.Date;

/**
 * Created by LINxwFF on 2017/12/24.
 */
public class AnswerRecordsDetailVo extends AnswerRecordsListVo{
    private String answer_suc_records;

    private String answer_err_records;

    public AnswerRecordsDetailVo() {
        super();
    }

    public AnswerRecordsDetailVo(Date create_time, int error_num, Integer exam_srandom_id, int exam_time, String exam_title, int id, int right_num, int score, int take_time, int total_num, String answer_err_records, String answer_suc_records) {
        super(create_time, error_num, exam_srandom_id, exam_time, exam_title, id, right_num, score, take_time, total_num);
        this.answer_err_records = answer_err_records;
        this.answer_suc_records = answer_suc_records;
    }

    public String getAnswer_err_records() {
        return answer_err_records;
    }

    public void setAnswer_err_records(String answer_err_records) {
        this.answer_err_records = answer_err_records;
    }

    public String getAnswer_suc_records() {
        return answer_suc_records;
    }

    public void setAnswer_suc_records(String answer_suc_records) {
        this.answer_suc_records = answer_suc_records;
    }
}
