package com.modules.article.service.impl;

import com.common.dao.ArticleCategoryMapper;
import com.common.dao.ArticleMapper;
import com.common.model.Article;
import com.common.model.ArticleCategory;
import com.common.utils.LoggerUtils;
import com.modules.article.bo.ArticleListVo;
import com.modules.article.service.ArticleManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2018/1/1.
 */
@Service
public class ArticleManagerServiceImpl implements ArticleManagerService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<ArticleListVo> findAll_Table() {
        return articleMapper.findAll_Table();
    }

    @Override
    public int insert(Article article) {
        return articleMapper.insertSelective(article);
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
        return articleMapper.deleteByPrimaryKey(id);
    }
}
