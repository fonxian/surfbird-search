package com.fonxian.test;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.Directory;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import java.io.IOException;
import java.nio.file.Paths;

/**
 * Created by fangzhijie on 2019/2/28.
 */

public class SearchTest {

    public static void search(String indexDir, String q)
            throws IOException, ParseException {

        Directory dir = FSDirectory.open(Paths.get(indexDir));
        IndexReader reader = DirectoryReader.open(dir);
        Analyzer analyzer = new StandardAnalyzer(); //标准分词器，会自动去掉空格啊，is a the等单词
        QueryParser parser = new QueryParser("contents", analyzer); //查询解析器
        Query query = parser.parse(q);              //4
        long start = System.currentTimeMillis();

        IndexSearcher searcher = new IndexSearcher(reader);
        TopDocs hits = searcher.search(query, 10); //5 搜索索引
        long end = System.currentTimeMillis();

        System.err.println("Found " + hits.totalHits +   //6 记录索引状态
                " document(s) (in " + (end - start) +        // 6
                " milliseconds) that matched query '" +     // 6
                q + "':");                                   // 6

        for (ScoreDoc scoreDoc : hits.scoreDocs) {
            Document doc = searcher.doc(scoreDoc.doc);               //7 返回匹配文本
            System.out.println(doc.get("fullpath"));  //8 显示匹配文件名
        }

        reader.close();                                //9 关闭IndexSearcher
    }

    public static void main(String[] args) {
        String rootPath = "/Users/fangzhijie/opensource/searchengine/surfbird-search";
        String indexDir = rootPath + "/index";         //1 指定目录创建索引
        String q = "网站"; //查询这个字符串
        try {
            search(indexDir, q);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
