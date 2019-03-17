[Lucene学习笔记](https://github.com/fonxian/surfbird-search/wiki)


# 运行方法
1、引入Jar包到Maven依赖

```
mvn install:install-file -Dfile=IKAnalyzer2012_FF.jar -DgroupId=ik -DartifactId=ik -Dversion=1.0 -Dpackaging=jar
```

2、启动Application

3、请求爬取数据、创建索引
```
curl http://127.0.0.1:8080/datas/index
```
4、访问首页
```
curl http://127.0.0.1:8080
```
# 功能
- WebMagic爬取博客园数据
- Lucene创建索引、搜索关键字
- 关键字高亮
- 同义词匹配（如企业=公司，泉城=济南）

# 页面效果

首页

![image.png](img/search-1.png)

搜索页

![image.png](img/search-3.png)
