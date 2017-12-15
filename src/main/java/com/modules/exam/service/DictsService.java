package com.modules.exam.service;

import com.modules.exam.bo.QKCourse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LINxwFF on 2017/12/16.
 */

public interface DictsService {

    //根据 type = remarks 对应的值,查询出考试项目对于的所有的考试项目的科目
    List<QKCourse> findAllByCourse(String findContent, Integer remarks);

}
