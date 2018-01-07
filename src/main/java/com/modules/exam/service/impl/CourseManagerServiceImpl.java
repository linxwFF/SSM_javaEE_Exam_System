package com.modules.exam.service.impl;

import com.common.dao.QCourseMapper;
import com.common.model.ArticleCategory;
import com.common.model.QCourse;
import com.common.utils.LoggerUtils;
import com.modules.exam.service.CourseManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/29.
 */
@Service
public class CourseManagerServiceImpl implements CourseManagerService {

    @Autowired
    private QCourseMapper qCourseMapper;

    @Override
    public List<QCourse> findAll_Table() {
        return qCourseMapper.findAll_Table();
    }

    @Override
    public int insert(QCourse model) {
        return qCourseMapper.insertSelective(model);
    }

    @Override
    public Map<String, Object> delete(Integer id) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        try {

            //查询子课目 //有就返回0.不让删除
            List<QCourse> subQcourses = qCourseMapper.findAll_CourseTypeId(id);
            if(subQcourses.size() > 0){
                resultMap.put("status", 500);
                resultMap.put("message", "该课程下有子科目，请先删除子项目");
            }else{
                resultMap.put("status", 200);
                resultMap.put("message","删除成功");
                qCourseMapper.deleteByPrimaryKey(id);
            }

        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "根据IDS删除出现错误，ids[%s]", id);
            resultMap.put("status", 500);
            resultMap.put("message", "删除出现错误，请刷新后再试！");
        }
        return resultMap;
    }
}
