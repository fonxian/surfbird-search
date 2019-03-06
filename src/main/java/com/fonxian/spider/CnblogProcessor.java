package com.fonxian.spider;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.PlainText;


/**
 * <p>
 * description
 * </p >
 *
 * @author Michael Fang
 * @since 2019-02-28
 */
public class CnblogProcessor implements PageProcessor {

    private static final String BLOG_LIST_REGEX = "https://www.cnblogs.com/#p(\\d+)";

    private static final String BLOG_LIST_PREFIX = "https://www.cnblogs.com/#p";

    private static final String BLOG_DETAIL_REGEX = "https://www\\.cnblogs\\.com/(.*)/p/(.*)\\.html";

    private static final int MAX_PAGE_NUM = 20;

    @Override
    public void process(Page page) {

        Document document = Jsoup.parse(page.getHtml().toString());

        if (page.getUrl().regex(BLOG_LIST_REGEX).match()) {
            System.out.println("当前链接href=" + page.getUrl().toString());
            Elements elements = document.select("#post_list div.post_item_body > h3 > a");
            for (Element element : elements) {
                System.out.println(element.attr("href"));
                page.addTargetRequest(element.attr("href"));
            }
            //获取页码
            String pageNum = PlainText.create(page.getUrl().toString()).regex(BLOG_LIST_REGEX).get();
            System.out.println("当前爬取页码=" + pageNum);
            //将下一页添加到队列
            int currentPageNum = Integer.valueOf(pageNum);
            if (currentPageNum <= MAX_PAGE_NUM) {
                page.addTargetRequest(BLOG_LIST_PREFIX + (currentPageNum + 1));
            }
            //将当前页面设置为跳过
        } else if (page.getUrl().regex(BLOG_DETAIL_REGEX).match()) {
            String title = document.select("#cb_post_title_url").text();
            System.out.println("标题=" + title);
            String url = page.getUrl().toString();
            System.out.println("url=" + url);
            String content = document.select("#topics").text();
            page.putField("title", title);
            page.putField("url", url);
            page.putField("content", content);
            //将当前页面设置为跳过

        }

    }

    @Override
    public Site getSite() {
        return Site.me().setDomain("www.cnblogs.com").setRetryTimes(8).setSleepTime(500);
    }


}
