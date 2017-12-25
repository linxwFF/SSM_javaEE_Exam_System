package com.common.dao;

import com.common.model.EPaper;
import com.modules.exam.bo.EPapersCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EPaperMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EPaper record);

    int insertSelective(EPaper record);

    EPaper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EPaper record);

    int updateByPrimaryKeyWithBLOBs(EPaper record);

    int updateByPrimaryKey(EPaper record);

    //查询用户未完成的考卷
    List<EPaper> findAllEPaperState0(EPapersCondition condition);

    //根据试卷的随机码获取试卷
    EPaper findEpaperBySrandom(String srandom);

    //根据试卷的随机码更新考卷状态
    int updateEPaperState(@Param(value = "srandom") Integer srandom,@Param(value = "state") Integer state);
}