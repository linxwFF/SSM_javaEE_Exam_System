package com.modules.exam.service;

import com.common.model.QQuestion;

import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/17.
 */
public interface ExamService {

    Map<Integer,List<QQuestion>> QueryQuestionsByMode1(Integer type, Integer courseType);
}
