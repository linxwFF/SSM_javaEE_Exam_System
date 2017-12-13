package dao;

import model.QCourse;

public interface QCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCourse record);

    int insertSelective(QCourse record);

    QCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCourse record);

    int updateByPrimaryKey(QCourse record);
}