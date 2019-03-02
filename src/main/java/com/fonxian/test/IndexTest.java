package com.fonxian.test;

/**
 * Created by fangzhijie on 2019/2/28.
 */

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.Directory;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.FileReader;
import java.nio.file.Paths;

public class IndexTest {

    public static void main(String[] args) throws Exception {
//        if (args.length != 2) {
//            throw new IllegalArgumentException("Usage: java " + IndexTest.class.getName()
//                    + " <index dir> <data dir>");
//        }
        String rootPath = "/Users/fangzhijie/opensource/searchengine/surfbird-search/src/main/resources/lucene";
        String indexDir = rootPath + "/index";         //1 指定目录创建索引
        String dataDir = rootPath + "/data";          //2 对指定目录中的*.txt文件进行索引

        long start = System.currentTimeMillis();
        IndexTest indexer = new IndexTest(indexDir);
        int numIndexed;
        try {
            numIndexed = indexer.index(dataDir, new TextFilesFilter());
        } finally {
            indexer.close();
        }
        long end = System.currentTimeMillis();

        System.out.println("Indexing " + numIndexed + " files took "
                + (end - start) + " milliseconds");
    }

    private IndexWriter writer;

    public IndexTest(String indexDir) throws IOException {
        Directory dir = FSDirectory.open(Paths.get(indexDir));
        Analyzer analyzer = new StandardAnalyzer(); //标准分词器，会自动去掉空格啊，is a the等单词
        IndexWriterConfig config = new IndexWriterConfig(analyzer); //将标准分词器配到写索引的配置中
        writer = new IndexWriter(dir, config); //实例化写索引对象
    }

    public void close() throws IOException {
        writer.close();                             //4 关闭IndexWriter
    }

    public int index(String dataDir, FileFilter filter)
            throws Exception {

        File[] files = new File(dataDir).listFiles();

        for (File f : files) {
            if (!f.isDirectory() &&
                    !f.isHidden() &&
                    f.exists() &&
                    f.canRead() &&
                    (filter == null || filter.accept(f))) {
                indexFile(f);
            }
        }

        return writer.numDocs();                     //5 返回被索引的文档数
    }

    private static class TextFilesFilter implements FileFilter {
        public boolean accept(File path) {
            return path.getName().toLowerCase()        //6 只索引*.txt文件，采用FileFilter
                    .endsWith(".txt");                  //6
        }
    }

    protected Document getDocument(File f) throws Exception {
        Document doc = new Document();
        doc.add(new Field("contents", new FileReader(f)));      //7 索引文件内容
        doc.add(new Field("filename", f.getName(),              //8 索引文件名
                Field.Store.YES, Field.Index.NOT_ANALYZED));//8
        doc.add(new Field("fullpath", f.getCanonicalPath(),     //9 索引文件完整路径
                Field.Store.YES, Field.Index.NOT_ANALYZED));//9
        return doc;
    }

    private void indexFile(File f) throws Exception {
        System.out.println("Indexing " + f.getCanonicalPath());
        Document doc = getDocument(f);
        writer.addDocument(doc);                              //10 向Lucene索引中添加文档
    }
}
