<html>
<head>
    <title>千鸟搜索</title>
    <script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
    <script src="${request.contextPath}/static/js/test.js"></script>
    <link href="${request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .queryForm {
            background-color: #f1f1f1;
            border-bottom: 1px solid #666;
            border-color: #e5e5e5;
            padding: 0 20px;
        }

        .searchText {
            width: 490px;
            height: 35px;
            line-height: 35px;
            font-size: 18px;
            padding: 5px 9px;
        }

        .searchText:hover {
            border-width: 1px;
            border-color: #a0a0a0 #b9b9b9 #b9b9b9 #b9b9b9 !important;
        }

        .searchBtn {
            width: 100px;
            height: 35px;
            line-height: 27px;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f1f1f1));
            background-image: -webkit-linear-gradient(top, #f8f8f8, #f1f1f1);
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            background-color: #f8f8f8;
            background-image: linear-gradient(top, #f8f8f8, #f1f1f1);
            background-image: -o-linear-gradient(top, #f8f8f8, #f1f1f1);
            border: 1px solid #c6c6c6;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            color: #222;
            cursor: default;
            font-family: arial, sans-serif;
            font-size: 13px;
            font-weight: bold;
            margin: 11px 4px;
            min-width: 54px;
            padding: 0 16px;
            text-align: center;
        }

        .searchBtn:hover {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#f1f1f1));
            background-image: -webkit-linear-gradient(top, #ffffff, #f1f1f1);
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            background-image: linear-gradient(top, #ffffff, #f1f1f1);
            background-image: -o-linear-gradient(top, #ffffff, #f1f1f1);
            border: 1px solid #c6c6c6;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            color: #222;
        }

        .result-item {
            padding: 10px 300px 10px 40px;
        }

        #tads a, #tadsb a, #res a, #rhs a, #taw a {
            text-decoration: none;
        }

        a:link {
            cursor: pointer;
        }

        a:link, #prs a:visited, #prs a:active {
            color: #353535;
        }

        .cite {
            color: #006621;
            font-style: normal;
            font-size: small;
            line-height: 18px;
        }

        .item-url {
            text-decoration: none;
        }

        .item-content {
            color: #545454;
            font-size: small;
            line-height: 16px;
        }

        #resultStats {
            line-height: 43px;
            -webkit-transition: all 220ms ease-in-out;
            color: #808080;
            padding: 0 8px 0 16px;
            font-size: small;
        }

        .copyright {
            color: #666;
            text-align: center;
        }

        #content_left {
            width: 636px;
            float: left;
            padding-left: 35px;
        }

        #content_left {
            width: 540px;
            padding-left: 121px;
            padding-top: 5px;
        }

        /*.middle-search {*/
        /*text-align: center;*/
        /*margin: 0 auto;*/
        /*height: auto;*/
        /*}*/

        .c-abstract {
            font-size: 13px;
        }

        .c-container {
            width: 538px;
            font-size: 13px;
            line-height: 1.54;
            word-wrap: break-word;
            word-break: break-word;
        }

        .result {
            width: 33.7em;
            table-layout: fixed;
        }

        #content_left {
            width: 540px;
            padding-left: 121px;
            padding-top: 5px;
            float: left;
        }

        #content_left .result {
            margin-bottom: 14px;
            border-collapse: collapse;
        }


        #content_right {
            margin-top: 45px;
            border-left: 1px solid #e1e1e1;
            float: right;
        }

        .container_l #content_right {
            width: 384px;
        }

        .container_l .cr-content {
            width: 351px;
        }

        .cr-title {
            font-size: 14px;
            line-height: 1.29;
            font-weight: 700;
        }

        .opr-toplist1-title {
            position: relative;
            margin-bottom: .5px;
        }

        .c-table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

        .cr-content table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .cr-content td {
            font-size: 13px;
            line-height: 1.54;
            vertical-align: top;
        }

        .cr-offset {
            padding-left: 17px;
        }

        .opr-toplist1-table .opr-toplist1-right {
            text-align: right;
            white-space: nowrap;
        }

        .c-index-hot, .c-index-hot1 {
            background-color: #f54545;
        }

        .c-index {
            display: inline-block;
            padding: 1px 0;
            color: #fff;
            width: 14px;
            line-height: 100%;
            font-size: 12px;
            text-align: center;
            background-color: #8eb9f5;
        }

        .c-gap-icon-right-small {
            margin-right: 5px;
        }

        .c-table th, .c-table td {
            padding-left: 10px;
            line-height: 1.54;
            font-size: 13px;
            border-bottom: 1px solid #f3f3f3;
            text-align: left;
        }

        body, th, td, .p1, .p2 {
            font-family: arial;
        }

        body {
            color: #333;
            background: #fff;
            padding: 6px 0 0;
            margin: 0;
            position: relative;
            min-width: 900px;
        }

        body #wrapper, body #head, #head #head_wrapper, body #s_fm, body #s_form_wrapper, body #form, body #wrapper_wrapper, body #u, body #s_tab, body #result_logo img, #u div, #u div a, #head .bdsug ul {
            display: block;
        }

        #con-ar {
            margin-bottom: 40px;
        }

        td {
            font-size: 9pt;
            line-height: 18px;
        }

        #con-ar .result-op {
            margin-bottom: 28px;
            font-size: 13px;
            line-height: 1.52em;
        }

        table {
            display: table;
            border-collapse: separate;
            border-spacing: 2px;
            border-color: grey;
        }

        #head {
            padding: 0;
            margin: 0;
            width: 100%;
            position: absolute;
            z-index: 301;
            min-width: 1000px;
            background: #fff;
            border-bottom: 1px solid #ebebeb;
            position: fixed;
            _position: absolute;
            -webkit-transform: translateZ(0);
        }

        #head .head_wrapper {
            padding-top: 0px !important;
        }

        .s_form {
            zoom: 1;
            height: 55px;
            padding: 0 0 0 10px;
        }

        .s_form:after, .s_tab:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        .fm {
            clear: none;
            float: left;
            margin: 11px 0 0 10px;
        }

        .fm {
            clear: both;
            position: relative;
            z-index: 297;
        }

        p, form, ol, ul, li, dl, dt, dd, h3 {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #head .head_wrapper{_width:1000px}
        #head.s_down{box-shadow:0 0 5px #888}
        #s_tab {
            background: #f8f8f8;
            line-height: 36px;
            height: 38px;
            padding: 55px 0 0 121px;
            float: none;
            zoom: 1;
        }

        #foot {
            background: #f5f6f5;
            border-top: 1px solid #ebebeb;
            text-align: left;
            height: 42px;
            line-height: 42px;
            margin-top: 40px;
            *margin-top: 0;
        }

        #foot {
            height: 20px;
            line-height: 20px;
            color: #77c;
            background: #e6e6e6;
            text-align: center;
        }

        #foot span {
            color: #666;
        }

        #help {
            background: #f5f6f5;
            zoom: 1;
            padding: 0 0 0 50px;
            float: right;
        }

        #container {
            word-break: break-all;
            word-wrap: break-word;
            position: relative;
        }

        .container_l {
            width: 1212px;
        }
        .head_nums_cont_outer {
            height: 40px;
            overflow: hidden;
            position: relative;
        }

        .head_nums_cont_inner {
            position: relative;
        }
        .search_tool_conter {
            font-size: 12px;
            color: #666;
            margin: 0 0 0 121px;
            height: 42px;
            width: 538px;
            line-height: 42px;
            *height: auto;
            *line-height: normal;
            *padding: 14px 0;
        }

        .nums {
            width: 538px;
        }
        .nums {
            margin: 0 0 0 121px;
            height: 42px;
            line-height: 42px;
        }
        .nums {
            font-size: 12px;
            color: #999;
        }

        .search_tool, .search_tool_close {
            float: right;
        }

        .search_tool, .search_tool_conter span {
            cursor: pointer;
            color: #666;
        }

        #page {
            padding: 0 0 0 121px;
            margin: 30px 0 40px;
        }

        #page {
            font: 14px arial;
            white-space: nowrap;
            padding-left: 35px;
        }

        #page .pc {
            width: 34px;
            height: 34px;
            border: 1px solid #e1e2e3;
            cursor: pointer;
        }

        #page .n:hover, #page a:hover .pc {
            background: #f2f8ff;
            border: 1px solid #38f;
        }


        em {
            font-style: normal;
            color: #c00;
        }

        #page strong .pc {
            border: 0;
            width: 36px;
            height: 36px;
            line-height: 36px;
        }

        #page a, #page strong {
            display: inline-block;
            vertical-align: text-bottom;
            height: 66px;
            text-align: center;
            line-height: 34px;
            text-decoration: none;
            overflow: hidden;
            margin-right: 9px;
            background: #fff;
        }

        .pc {
            cursor: auto;
        }

        .c-container .t, .c-default .t {
            line-height: 1.54;
        }

        .t {
            font-weight: 400;
            font-size: medium;
            margin-bottom: 1px;
        }

        a:link, #prs a:visited, #prs a:active {
            color: #353535;
        }

        a:link {
            cursor: pointer;
        }

        .item-url {
            text-decoration: none;
        }

        a:-webkit-any-link {
            color: -webkit-link;
            cursor: pointer;
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div id="wrapper">
    <div id="head" class="s-skin-hasbg white-logo s-opacity-90">
        <div id="head_wrapper" class="s-isindex-wrap head_wrapper s-title-img">
            <div id="s_fm" class="s_form">
                <form  id="form" class="fm" action="${request.contextPath}/query" method="post">
                    <table style="width:700px;border:none;">
                        <tr>
                            <td><h3 class="title-init">千鸟搜索</h3></td>
                            <td><input type="text" name="q" class="searchText" value="${q}"/></td>
                            <td><input type="submit" value="搜索" class="searchBtn"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <div class="s_tab" id="s_tab"></div>
    <div id="wrapper_wrapper" style="display: block;">
        <div id="container" class="container_l">
            <div id="content_right" class="cr-offset">
                <table cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">


                            <div id="con-ar" class="result_hidden" style="position: static;">


                                <div class="result-op xpath-log" tpl="right_toplist1"
                                     data-click="{&quot;fm&quot;:&quot;alxr&quot;,&quot;p1&quot;:1,&quot;mu&quot;:&quot;http://top.baidu.com/buzz?b=1&quot;,&quot;rsv_stl&quot;:&quot;0&quot;,&quot;rsv_srcid&quot;:20811,&quot;p5&quot;:11}">


                                    <div class="cr-content ">


                                        <div class="FYB_RD">
                                            <div class="cr-title opr-toplist1-title" title="搜索热点">
                                                <div class="opr-toplist1-update" data-click="{fm:'beha'}">
                                                    <a class="OP_LOG_BTN opr-toplist1-refresh"
                                                       href="javascript:void(0);">换一换<i
                                                            class="c-gap-left-small c-icon opr-toplist1-icon"></i></a>
                                                </div>
                                                搜索热点
                                            </div>
                                            <table class="c-table opr-toplist1-table">
                                                <tbody>
                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot1 c-gap-icon-right-small">1</span><a
                                                            target="_blank" title="叶璇控诉强迫喝酒"
                                                            href="#">热门标题1</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>

                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot1 c-gap-icon-right-small">1</span><a
                                                            target="_blank" title="热门标题1"
                                                            href="#">热门标题1</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot1 c-gap-icon-right-small">1</span><a
                                                            target="_blank" title="热门标题1"
                                                            href="#">热门标题1</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>

                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot1 c-gap-icon-right-small">1</span><a
                                                            target="_blank" title="热门标题1"
                                                            href="#">热门标题1</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>

                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot1 c-gap-icon-right-small">1</span><a
                                                            target="_blank" title="热门标题1"
                                                            href="#">热门标题1</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>


                                                </tbody>

                                            </table>
                                            <div class="OP_LOG_BTN c-gap-top-small opr-toplist1-from">
                                                <a target="_blank"
                                                   href="https://www.baidu.com/link?url=ODFEflzCA1GBL8hwHBtZeHPcpJJbMxLlJIZyJWoHNvEGQ5DmJVO6bjmcQ0sGwTx5&amp;wd=&amp;eqid=de81beae000e1653000000065c8a756a">查看更多&gt;&gt;</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </div>


                            <div>
                            </div>


                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="head_nums_cont_outer OP_LOG">
                <div class="head_nums_cont_inner">
                        <div class="search_tool_conter"></div>
                        <div class="nums">
                            <span class="nums_text">千鸟为您找到相关结果约${page.total}个</span>

                        </div>
                </div>
            </div>
            <div id="content_left">

            <#if page??>

                    <#list page.list as info>
                        <div class="result c-container" data-hveid="27">
                            <h3 class="t"><a href="${info.url}" class="item-url" target="_blank">${info.title}</a></h3>

                            <div class="cite" style="white-space:nowrap">${info.url}</div>
                            <div class="c-abstract">
                                <span >${info.content}</span>
                            </div>
                        </div>
                    </#list>

            </div>
            <div id="page">


                        <#if page.hasPreviousPage>

                                <a href="${request.contextPath}/query?page=1&rows=10&q=${q}">首页</a>
                                <a href="${request.contextPath}/query?page=${page.prePage}&rows=10&q=${q}">前一页</a>

                        </#if>
                        <#list page.navigatepageNums as nav>
                            <#if nav == page.pageNum>
                                <strong style="font-weight: bold;">
                                    <span class="pc">${nav}</span>
                                </strong>
                            </#if>
                            <#if nav != page.pageNum>

                                    <a href="${request.contextPath}/query?page=${nav}&rows=10&q=${q}">${nav}</a>

                            </#if>
                        </#list>
                        <#if page.hasNextPage>

                                <a href="${request.contextPath}/query?page=${page.nextPage}&rows=10&q=${q}">下一页</a>
                                <a href="${request.contextPath}/query?page=${page.pages}&rows=10&q=${q}">尾页</a>

                        </#if>


            </div>

            </#if>
        </div>
        <div id="foot">
            <div class="foot-inner">
                <span id="help" style="float:left;padding-left:121px">
                    <a>帮助</a>
                    <a>举报</a>
                    <a>用户反馈</a>
                </span>
            </div>
        </div>
    </div>
</body>
</html>
