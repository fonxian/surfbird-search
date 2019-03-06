
package com.fonxian.controller;

import com.fonxian.lucene.LuceneUtil;
import com.fonxian.spider.CnblogProcessor;
import com.fonxian.spider.LucenePipeline;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.scheduler.QueueScheduler;
import us.codecraft.webmagic.scheduler.component.BloomFilterDuplicateRemover;

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
    @RequestMapping("index")
    public
    @ResponseBody
    ModelMap index(@RequestParam(required = false, defaultValue = "1") Integer tc,
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
    @RequestMapping("del")
    public void del() {
        LuceneUtil.delIndex();
    }

    /**
     * 关闭爬虫
     *
     * @return
     */
    @RequestMapping("stop")
    public
    @ResponseBody
    ModelMap stop() {
        ModelMap result = new ModelMap();
        close();
        result.put("msg", "关闭爬虫");
        return result;
    }

}
