package com.common.dao;

import com.common.model.QQuestion;
import com.modules.exam.bo.QQuestionVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QQuestion record);

    int insertSelective(QQuestion record);

    QQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QQuestion record);

    int updateByPrimaryKey(QQuestion record);

    //获取科目下面的题目
    List<QQuestion> queryQuestionByType(@Param("type")Integer type,
                                        @Param("course_type")Integer course_type,
                                        @Param("course_type_id")Integer course_type_id
    );

    //随机获取特定考试项目特定考试科目特定考试题目类型的题
    List<QQuestion> queryQuestionByTypeRand(@Param("type")Integer type,
                                        @Param("course_type")Integer course_type,
                                        @Param("course_type_id")Integer course_type_id,
                                        @Param("limit")Integer limit
                                        );
    //获取所有的题目
    List<QQuestionVo> findAll_Table();
}