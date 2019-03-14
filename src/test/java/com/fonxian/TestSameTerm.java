package com.fonxian;

import com.fonxian.lucene.IKAnalyzer5x;
import com.fonxian.lucene.LuceneUtil;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.apache.lucene.store.RAMDirectory;

import static junit.framework.TestCase.assertEquals;

/**
 * <p>
 * description
 * </p >
 *
 * @author Michael Fang
 * @since 2019-03-15
 */
public class TestSameTerm {

    Directory dir;

    private Analyzer SYNONY_ANALYZER;


    @Before
    public void setUp() throws Exception {
        String synonymsPath = LuceneUtil.class.getClassLoader().getResource("").getPath() + "../classes/lucene/synonyms/synonyms.txt";
        SYNONY_ANALYZER = new SynonymsAnalyzer(synonymsPath);
        dir = new RAMDirectory();
        IndexWriterConfig conf = new IndexWriterConfig(SYNONY_ANALYZER);
        IndexWriter writer = new IndexWriter(dir, conf);
        Document doc1 = new Document();
        doc1.add(new TextField("content", "中国的泉城是哪", Field.Store.YES));
        Document doc2 = new Document();
        doc2.add(new TextField("content", "高数好难", Field.Store.YES));
        writer.addDocument(doc1);
        writer.addDocument(doc2);
        writer.close();
    }


    @Test
    public void test3() throws IOException {

        try {

            String content = "济南";
            QueryParser queryParser = new QueryParser("content", SYNONY_ANALYZER);
            Query query = queryParser.parse(content);
            IndexReader reader = DirectoryReader.open(dir);
            IndexSearcher searcher = new IndexSearcher(reader);
            TopDocs docs = searcher.search(query, 10);
            ScoreDoc[] scoreDoc = docs.scoreDocs;


            for (ScoreDoc doc : scoreDoc) {
                Document document = searcher.doc(doc.doc);
                for (IndexableField indexableField : document.getFields()) {
                    System.out.println(indexableField.name());
                    System.out.println(indexableField.stringValue());
                }
            }
            assertEquals(1, docs.totalHits);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
