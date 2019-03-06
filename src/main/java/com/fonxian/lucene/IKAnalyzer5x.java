/*
 * Copyright (c) 2016 lcc523572741@qq.com
 */

package com.fonxian.lucene;

import org.apache.lucene.analysis.Analyzer;

/**
 * <p>
 * description
 * </p >
 *
 * @author Michael Fang
 * @since 2019-02-28
 */
public class IKAnalyzer5x extends Analyzer {

    private boolean useSmart;

    public IKAnalyzer5x() {
        this(false);
    }

    public IKAnalyzer5x(boolean useSmart) {
        this.useSmart = useSmart;
    }

    public boolean useSmart() {
        return this.useSmart;
    }

    public void setUseSmart(boolean useSmart) {
        this.useSmart = useSmart;
    }

    @Override
    protected TokenStreamComponents createComponents(String fieldName) {
        IKTokenizer5x _IKTokenizer = new IKTokenizer5x(this.useSmart);
        return new TokenStreamComponents(_IKTokenizer);
    }
}
