package com.fonxian.controller;

import com.fonxian.lucene.LuceneUtil;
import com.fonxian.model.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 数据搜索 控制类
 * </p >
 *
 * @author Michael Fang
 * @since 2019-02-28
 */
@RestController
public class SearchController {

    @RequestMapping({"", "index", "query"})
    public ModelAndView query(String q,
                              @RequestParam(required = false, defaultValue = "1") Integer page,
                              @RequestParam(required = false, defaultValue = "10") Integer rows) {
        ModelAndView result = new ModelAndView();
        if (StringUtils.isNotEmpty(q)) {
            result.setViewName("result");
            PageInfo pageInfo = LuceneUtil.query(q, page, rows);
            result.addObject("q", q);
            result.addObject("page", pageInfo);
        } else {
            result.setViewName("index");
        }
        return result;
    }

}
