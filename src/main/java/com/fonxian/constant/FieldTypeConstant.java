package com.fonxian.constant;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.FieldType;
import org.apache.lucene.index.IndexOptions;

/**
 * <p>
 * 域类型 常量类
 * </p >
 *
 * @author Michael Fang
 * @since 2019-03-07
 */
public class FieldTypeConstant {

    public static final FieldType TYPE_NOT_INDEX = new FieldType();
    public static final FieldType TYPE_INDEX = new FieldType();
    public static final FieldType TYPE_INDEX_TERM = new FieldType();

    static {
        //不索引，不分词，存储
        TYPE_NOT_INDEX.setIndexOptions(IndexOptions.NONE);
        TYPE_NOT_INDEX.setTokenized(false);
        TYPE_NOT_INDEX.setStored(true);
        TYPE_NOT_INDEX.freeze();

        //索引，分词，存储
        //文档，词频，位置都被索引
        TYPE_INDEX.setIndexOptions(IndexOptions.DOCS_AND_FREQS_AND_POSITIONS);
        TYPE_INDEX.setTokenized(true);
        TYPE_INDEX.setStored(true);
        TYPE_INDEX.freeze();

        //索引，分词，存储
        TYPE_INDEX_TERM.setIndexOptions(IndexOptions.DOCS_AND_FREQS_AND_POSITIONS);
        TYPE_INDEX_TERM.setTokenized(true);
        TYPE_INDEX_TERM.setStored(true);
        //存储词项向量
        TYPE_INDEX_TERM.setStoreTermVectors(true);
        TYPE_INDEX_TERM.freeze();
    }


}
