package com.modules.article.utils;

import com.modules.core.mybatis.page.Pagination;

/**
 * Created by LINxwFF on 2018/1/3.
 */
public class ArticlePagination extends Pagination {

    @Override
    public String getPageHtml() {
        StringBuffer pageHtml = new StringBuffer("<ul class='pagination pagination-split'>");
        if(this.getPageNo()>1){
            if(this.getPageNo()>5){
                pageHtml.append("<li><a href='javascript:;' onclick='_submitform(1)'>首页</a></li>");
            }
            pageHtml.append("<li><a href='javascript:;'  onclick='_submitform("+(this.getPageNo() - 1)+")'>上一页</a></li>");
        }
        for (int i = (this.getPageNo()-2<=0?1:this.getPageNo()-2),no = 1; i <= this.getTotalPage()&& no <6 ; i++,no++) {
            if (this.getPageNo() == i) {
                pageHtml.append("<li class='active'><a href='javascript:void(0);' >"+i+"</a></li>");
            }else{
                pageHtml.append("<li><a href='javascript:;' onclick='_submitform("+i+")'>"+i+"</a></li>");
            }
        }
        if(this.getPageNo() < this.getTotalPage()){
            pageHtml.append("<li><a href='javascript:;'  onclick='_submitform("+(this.getPageNo() + 1)+")'>下一页</a></li>");
        }
        pageHtml.append("</ul>");
        pageHtml.append("<script>");
        pageHtml.append("	function _submitform(pageNo){");
        pageHtml.append("		$(\"#formId\").append(" +
                "$(\"<input type='hidden' value='\" + pageNo +\"' name='pageNo'>\")" +
                ").submit();");
        pageHtml.append("	}");
        pageHtml.append("</script>");

        return pageHtml.toString();
    }
}
