/*
 * Copyright (c) 2016 lcc523572741@qq.com
 */

package com.fonxian.lucene;

import com.fonxian.constant.FieldTypeConstant;
import com.fonxian.constant.IndexOptConstant;
import com.fonxian.model.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.springframework.util.ResourceUtils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.FileSystems;
import java.util.*;

/**
 * <p>
 * Lucene 工具类
 * </p >
 *
 * @author Michael Fang
 * @since 2019-02-28
 */
public class LuceneUtil {
    public static final String INDEX_PATH;
    private static final Analyzer ANALYZER = new IKAnalyzer5x(true);
    private static int count = 0;
    private static Index index = null;

    static {
        String index = "lucene/index";
        try {
            if (!ResourceUtils.getFile(index).exists()) {
                index = "classpath:lucene/index";
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            INDEX_PATH = index;
        }
    }

    /**
     * 删除索引
     */
    public synchronized static boolean delIndex(int type, String term) {

        try {
            Directory dictionary = getIndexDocument();
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(ANALYZER);
            IndexWriter indexWriter = new IndexWriter(dictionary, indexWriterConfig);
            //删除所有索引
            if (type == IndexOptConstant.INDEX_DEL_TYPE_ALL) {
                indexWriter.deleteAll();
            }
            //删除包含某个词项的索引
            if (type == IndexOptConstant.INDEX_DEL_TYPE_TERM && StringUtils.isNoneBlank(term)) {
                indexWriter.deleteDocuments(new Term("content", term));
            }

            indexWriter.commit();
            indexWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return true;

    }

    /**
     * 更新索引
     */
    public synchronized static boolean updateIndex(String term, String newContent) {

        try {
            Directory dictionary = getIndexDocument();
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(ANALYZER);
            IndexWriter indexWriter = new IndexWriter(dictionary, indexWriterConfig);
            Document doc = new Document();

            doc.add(new Field("title", "测试一下", FieldTypeConstant.TYPE_INDEX_TERM));
            doc.add(new Field("url", "https://www.baidu.com", FieldTypeConstant.TYPE_INDEX_TERM));
            doc.add(new Field("content", newContent, FieldTypeConstant.TYPE_INDEX));
            //注意对搜索词进行分词，Linux分词后的结果为linux。若不分词，term为Linux，匹配不到文档
            indexWriter.updateDocument(new Term("content", tokenSearchTerm(term)), doc);
            indexWriter.commit();
            indexWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return true;

    }

    /**
     * 索引数据
     */
    public synchronized static Index newIndex() {
        try {
            count++;
            if (index != null) {
                return index;
            }
            Directory dictionary = getIndexDocument();
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(ANALYZER);
            indexWriterConfig.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
            IndexWriter indexWriter = new IndexWriter(dictionary, indexWriterConfig);
            index = new Index(indexWriter, dictionary);
            return index;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 关闭索引
     */
    public synchronized static void closeIndex() {
        if (index != null) {
            count--;
            if (count < 1) {
                index.close();
                index = null;
                count = 0;
            }
        }
    }

    /**
     * 查询
     *
     * @param q
     * @param pageNum
     * @param pageSize
     * @return
     */
    public static PageInfo query(String q, int pageNum, int pageSize) {
        try {
            Directory dictionary = getIndexDocument();
            DirectoryReader reader = DirectoryReader.open(dictionary);
            IndexSearcher searcher = new IndexSearcher(reader);
            //创建查询对象（默认搜索域，分词器）
//            QueryParser parser = new QueryParser("content", ANALYZER);
            QueryParser parser = new MultiFieldQueryParser(new String[]{"title", "content"}, ANALYZER);
            //查询语法
            Query query = parser.parse(q);
//            DuplicateFilter filter = new DuplicateFilter("content");
//            filter.setKeepMode(DuplicateFilter.KeepMode.KM_USE_FIRST_OCCURRENCE);
            //获取搜索结果
            TopDocs topDocs = searcher.search(query, (pageNum + 1) * pageSize);
            //从搜索结果对象中获取结果集
            ScoreDoc[] hits = topDocs.scoreDocs;
            //文档命中数
            Integer total = topDocs.totalHits;
            List<Map<String, String>> result = new ArrayList<Map<String, String>>();
            int start = (pageNum - 1) * pageSize;
            int end = start + pageSize;

            SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<span style=\"color:red\">", "</span>");
            Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query));

            //此处需要优化，若返回结果集过大，可能会超出内存
            //TODO
            for (int i = start; i < end && i < total; i++) {
                Map<String, String> map = new HashMap<String, String>();
                //通过文档ID从磁盘中获取对应文档
                Document hitDoc = searcher.doc(hits[i].doc);

                for (Iterator<IndexableField> iter = hitDoc.iterator(); iter.hasNext(); ) {
                    IndexableField field = iter.next();
                    String value = field.stringValue();
                    String fieldName = field.name();
                    if (fieldName.equals("content") || fieldName.equals("title")) {
                        //添加关键字高亮
                        TokenStream tokenStream = ANALYZER.tokenStream(fieldName, new StringReader(value));
                        String highlighterValue = highlighter.getBestFragment(tokenStream, value);
                        if (StringUtils.isNoneBlank(highlighterValue)) {
                            value = highlighterValue;
                        }
                        if (value.length() > 400) {
                            value = value.substring(0, 400) + "...";
                        }
                    }
                    map.put(field.name(), value);
                }
                result.add(map);
            }
            reader.close();
            dictionary.close();
            return new PageInfo(result, pageNum, pageSize, total, 8);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取索引文件
     *
     * @return
     * @throws IOException
     */
    private static Directory getIndexDocument() throws IOException {
        String path = ResourceUtils.getFile(INDEX_PATH).getPath();
        if (path.startsWith("/")) {
            path = path.substring(1);
        }
        return new SimpleFSDirectory(FileSystems.getDefault().getPath(path));

    }

    /**
     * 对一个查询词进行分词
     * TODO 查询句子时的处理
     *
     * @param text
     * @return
     * @throws IOException
     */
    private static String tokenSearchTerm(String text) throws IOException {
        TokenStream ts = ANALYZER.tokenStream("content", text);
        ts.reset();
        CharTermAttribute cta = ts.getAttribute(CharTermAttribute.class);
        String result = "";
        while (ts.incrementToken()) {
            result = cta.toString();
        }
        ts.end();
        ts.close();
        return result;
    }

}
