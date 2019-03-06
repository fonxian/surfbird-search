
package com.fonxian.controller;

import com.fonxian.constant.IndexOptConstant;
import com.fonxian.lucene.LuceneUtil;
import com.fonxian.spider.CnblogProcessor;
import com.fonxian.spider.LucenePipeline;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.scheduler.QueueScheduler;
import us.codecraft.webmagic.scheduler.component.BloomFilterDuplicateRemover;

/**
 * <p>
 * 数据索引 控制类
 * </p >
 *
 * @author Michael Fang
 * @since 2019-03-07
 */
@RestController
@RequestMapping("/datas")
public class IndexController {

    private static Spider spider = null;

    private static synchronized Spider start() {
        if (spider == null) {
            spider = Spider.create(new CnblogProcessor()).setScheduler(new QueueScheduler()
                    .setDuplicateRemover(new BloomFilterDuplicateRemover(10000000))).addPipeline(new LucenePipeline());
            return spider;
        } else {
            return null;
        }
    }

    private static synchronized void close() {
        if (spider != null) {
            try {
                spider.close();
            } finally {
                spider = null;
            }
        }
    }

    /**
     * 索引数据
     *
     * @return
     */
    @RequestMapping("/index")
    @ResponseBody
    public ModelMap index(@RequestParam(required = false, defaultValue = "1") Integer tc,
                          @RequestParam(required = false, defaultValue = "https://www.cnblogs.com/#p1") String url) {
        ModelMap result = new ModelMap();
        Spider spider = start();
        if (spider != null) {
            spider.addUrl(url);
            spider.thread(tc).start();
            result.put("msg", "启动爬虫开始索引数据");
        } else {
            result.put("msg", "爬虫已经启动，无法同时多个任务");
        }
        return result;
    }

    /**
     * 删除索引
     *
     * @return
     */
    @RequestMapping("/delAll")
    @ResponseBody
    public boolean del() {
        try {
            return LuceneUtil.delIndex(IndexOptConstant.INDEX_DEL_TYPE_ALL, "");
        } catch (Exception e) {
            return false;
        }
    }


    /**
     * 删除索引
     *
     * @return
     */
    @RequestMapping("/delTerm/{term}")
    @ResponseBody
    public boolean delTerm(@PathVariable("term")String term) {
        try {
            return LuceneUtil.delIndex(IndexOptConstant.INDEX_DEL_TYPE_TERM, term);
        } catch (Exception e) {
            return false;
        }

    }

    /**
     * 关闭爬虫
     *
     * @return
     */
    @RequestMapping("/stop")
    @ResponseBody
    public ModelMap stop() {
        ModelMap result = new ModelMap();
        close();
        result.put("msg", "关闭爬虫");
        return result;
    }

}
