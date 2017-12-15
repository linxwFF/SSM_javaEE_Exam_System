package com.modules.exam.service.impl;

import com.common.dao.DictsMapper;
import com.common.model.Dicts;
import com.modules.exam.bo.QKCourse;
import com.modules.exam.service.DictsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LINxwFF on 2017/12/16.
 */
@Service
public class DictsServiceImpl implements DictsService {

    @Autowired
    private DictsMapper dictsMapper;

    @Override
    public List<QKCourse> findAllByCourse(String findContent, Integer remarks) {

        List<Dicts> listDicts = dictsMapper.findAllByCourse(findContent,remarks);
        List<QKCourse> result = new ArrayList<>();

        for (Dicts item:listDicts) {

            QKCourse qkcourse = new QKCourse();
            qkcourse.setQKCourseName(item.getCodeName());
            qkcourse.setValue(item.getValue());

            result.add(qkcourse);

        }
        return result;
    }
}
