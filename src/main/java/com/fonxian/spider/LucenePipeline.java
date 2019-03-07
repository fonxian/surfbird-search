/*
 * Copyright (c) 2016 lcc523572741@qq.com
 */

package com.fonxian.spider;

import com.fonxian.constant.FieldTypeConstant;
import com.fonxian.lucene.Index;
import com.fonxian.lucene.LuceneUtil;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

import java.io.Closeable;
import java.io.IOException;
import java.util.concurrent.locks.ReentrantLock;

/**
 * <p>
 * description
 * </p >
 *
 * @author Michael Fang
 * @since 2019-02-28
 */
public class LucenePipeline implements Pipeline, Closeable {


    private final ReentrantLock lock = new ReentrantLock();
    private Index index;

    @Override
    public void process(ResultItems resultItems, Task task) {
        if (index == null) {
            lock.lock();
            try {
                if (index == null) {
                    index = LuceneUtil.newIndex();
                }
            } finally {
                lock.unlock();
            }
        }
        Document doc = new Document();
        doc.add(new Field("title", resultItems.getAll().get("title").toString(), FieldTypeConstant.TYPE_NOT_INDEX));
        doc.add(new Field("url", resultItems.getRequest().getUrl(), FieldTypeConstant.TYPE_INDEX_TERM));
        doc.add(new Field("content", resultItems.getAll().get("content").toString(), FieldTypeConstant.TYPE_INDEX));
        index.update(resultItems.getRequest().getUrl(), doc);
    }

    @Override
    public void close() throws IOException {
        if (index != null) {
            LuceneUtil.closeIndex();
        }
    }
}
