package com.fonxian.lucene;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.synonym.SynonymFilterFactory;
import org.apache.lucene.analysis.util.ClasspathResourceLoader;
import org.apache.lucene.analysis.util.FilesystemResourceLoader;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 同义词分词器
 * </p >
 *
 * @author Michael Fang
 * @since 2019-03-15
 */
public class IKSynonymsAnalyzer extends Analyzer {

    private final String synonymsPath;

    public IKSynonymsAnalyzer(String synonymsPath) {
        if(synonymsPath==null || synonymsPath.isEmpty()) {
            throw new IllegalArgumentException("synonymsPath must be provided!");
        }
        this.synonymsPath = synonymsPath;
    }

    @Override
    protected TokenStreamComponents createComponents(String fieldName) {
        SynonymFilterFactory factory = null;
        try {
            factory = getSynonymFilterFactory();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Tokenizer tokenizer = new IKTokenizer5x(true);
        if(factory != null) {
            TokenStream tokenStream = factory.create(tokenizer);
            return new TokenStreamComponents(tokenizer,tokenStream);
        }
        return new TokenStreamComponents(tokenizer);
    }

    private SynonymFilterFactory getSynonymFilterFactory() throws IOException {
        if(synonymsPath.contains("classpath:")) {
            String path = synonymsPath.replace("classpath:", "");
            Map args = new HashMap<>();
            args.put("synonyms", path);
            SynonymFilterFactory factory = new SynonymFilterFactory(args );
            factory.inform(new ClasspathResourceLoader());
            return factory;
        }
        int index = synonymsPath.lastIndexOf(File.separator);
        String dir = synonymsPath.substring(0,index);
        String name = synonymsPath.substring(index+1);
        Map args = new HashMap<>();
        args.put("synonyms", name);
        SynonymFilterFactory factory = new SynonymFilterFactory(args);
        Path baseDirectory = Paths.get(dir);
        FilesystemResourceLoader loader = new FilesystemResourceLoader(baseDirectory);
        factory.inform(loader);
        return factory;
    }

}
