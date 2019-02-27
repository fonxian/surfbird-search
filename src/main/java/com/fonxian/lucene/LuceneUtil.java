package com.fonxian.lucene;

import com.fonxian.model.PageInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fangzhijie on 2019/2/28.
 */

public class LuceneUtil {


    public static PageInfo query(String q, int pageNum, int pageSize) {
        List<String> result = new ArrayList<>();
        return new PageInfo(result, pageNum, pageSize, 10, 8);
    }

}
