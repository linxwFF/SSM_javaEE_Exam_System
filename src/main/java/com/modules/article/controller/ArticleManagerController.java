package com.modules.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by LINxwFF on 2017/12/26.
 */
@Controller
@RequestMapping("articleManager")
public class ArticleManagerController {

    @RequestMapping(value = "add_article")
    public ModelAndView index()
    {
        return new ModelAndView("articleManager/add_article");
    }

    @RequestMapping(value = "add_article_do")
    public ModelAndView add_article()
    {

        return new ModelAndView("articleManager/add_article");
    }
}
