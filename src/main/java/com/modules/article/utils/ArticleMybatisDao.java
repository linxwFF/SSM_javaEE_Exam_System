package com.modules.article.utils;

import com.common.utils.LoggerUtils;
import com.common.utils.StringUtils;
import com.modules.core.mybatis.BaseMybatisDao;
import com.modules.core.mybatis.page.Pagination;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.session.Configuration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

/**
 * Created by LINxwFF on 2018/1/3.
 */
public class ArticleMybatisDao<T> extends BaseMybatisDao {

    final static Class<? extends Object> SELF = ArticleMybatisDao.class;

    public ArticleMybatisDao() {
        super();
    }

    /**
     * 分页
     *
     * @param sqlId
     *            主语句
     * @param countId
     *            Count 语句
     * @param params
     *            参数
     * @param pageNo
     *            第几页
     * @param pageSize每页显示多少条
     * @param requiredType	返回的类型[可以不传参]
     * @return
     */
    @Override
    public ArticlePagination findPage(String sqlId, String countId, Map params, Integer pageNo, Integer pageSize) {

        pageNo = null == pageNo ? 1 : pageNo;
        pageSize = null == pageSize ? 10 : pageSize;

        //专门文章的分页
        ArticlePagination page = new ArticlePagination();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        Configuration c = this.getSqlSession().getConfiguration();
        int offset = (page.getPageNo() - 1) * page.getPageSize();
        String page_sql = String.format(" limit  %s , %s ", offset,pageSize);
        params.put("page_sql", page_sql);

        sqlId =  String.format("%s.%s", NAMESPACE,sqlId) ;

        BoundSql boundSql = c.getMappedStatement(sqlId).getBoundSql(params);
        String sqlcode = boundSql.getSql();
        LoggerUtils.fmtDebug(SELF, "findPage sql : %s",sqlcode );
        String countCode = "";
        BoundSql countSql = null;
        if (StringUtils.isBlank(countId)) {
            countCode = sqlcode;
            countSql = boundSql;
        } else {
            countId = String.format("%s.%s", NAMESPACE,countId) ;
            countSql = c.getMappedStatement(countId).getBoundSql(params);
            countCode = countSql.getSql();
        }
        try {
            Connection conn = this.getSqlSession().getConnection();

            List resultList = this.getSqlSession().selectList(sqlId, params);

            page.setList(resultList);

            /**
             * 处理Count
             */
            PreparedStatement ps = getPreparedStatement4Count(countCode, countSql
                    .getParameterMappings(), params, conn);
            ps.execute();
            ResultSet set = ps.getResultSet();

            while (set.next()) {
                page.setTotalCount(set.getInt(1));
            }
        } catch (Exception e) {
            LoggerUtils.error(SELF, "jdbc.error.code.findByPageBySqlId",e);
        }
        return page;
    }
}
