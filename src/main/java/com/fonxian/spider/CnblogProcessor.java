package com.fonxian.spider;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;


/**
 * Created by fangzhijie on 2019/3/2.
 */
public class CnblogProcessor implements PageProcessor {

    private static final String BLOG_LIST_REGEX = "https://www.cnblogs.com/#p(\\d+)";


    private static final String BLOG_DETAIL_REGEX = "https://www\\.cnblogs\\.com/(.*)/p/(.*).html";


    @Override
    public void process(Page page) {

        Document document = Jsoup.parse(page.getHtml().toString());

        if (page.getUrl().regex(BLOG_LIST_REGEX).match()) {
            Elements elements = document.select("#post_list div.post_item_body > h3 > a");
            for (Element element : elements) {
                page.addTargetRequest(element.attr("href"));
            }
            page.setSkip(true);

        } else if (page.getUrl().regex(BLOG_DETAIL_REGEX).match()) {
            String title = document.select("#cb_post_title_url").text();
            String url = page.getUrl().toString();
            String content = document.select("#topics").text();
            page.putField("title", title);
            page.putField("url", url);
            page.putField("content", content);
        } else {
            page.setSkip(true);
        }
    }

    @Override
    public Site getSite() {
        return Site.me().setDomain("www.cnblogs.com").setRetryTimes(8).setSleepTime(500);
    }


}
