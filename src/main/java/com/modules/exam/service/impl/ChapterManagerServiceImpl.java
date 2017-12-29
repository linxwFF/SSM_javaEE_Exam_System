package com.modules.exam.service.impl;

import com.common.dao.QChapterMapper;
import com.common.dao.QCourseMapper;
import com.common.model.QChapter;
import com.common.model.QCourse;
import com.common.utils.LoggerUtils;
import com.modules.exam.service.ChapterManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2017/12/29.
 */
@Service
public class ChapterManagerServiceImpl implements ChapterManagerService {

    @Autowired
    private QChapterMapper qChapterMapper;

    @Override
    public List<QChapter> findAll_TableByType(Integer course_type_id) {
        return qChapterMapper.findAll_Table(course_type_id);
    }

    @Override
    public int insert(QChapter model) {
        return qChapterMapper.insertSelective(model);
    }

    @Override
    public Map<String, Object> delete(String ids) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        try {
            int count=0;
            String resultMsg ="删除%s条，失败%s条";
            String[] idArray = new String[]{};
            if(com.common.utils.StringUtils.contains(ids, ",")){
                idArray = ids.split(",");
            }else{
                idArray = new String[]{ids};
            }

            c:for (String idx : idArray) {
                int id = Integer.parseInt(idx);
                if(new Long(1).equals(id)){
                    resultMsg = "操作成功";
                    continue c;
                }else{
                    count+=this.deleteByPrimaryKey(id);
                }
            }

            resultMap.put("status", 200);
            resultMap.put("count", count);
            resultMap.put("resultMsg", resultMsg);
        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "根据IDS删除出现错误，ids[%s]", ids);
            resultMap.put("status", 500);
            resultMap.put("message", "删除出现错误，请刷新后再试！");
        }
        return resultMap;
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return qChapterMapper.deleteByPrimaryKey(id);
    }
}
