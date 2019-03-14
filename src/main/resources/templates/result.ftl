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
                                                            href="/s?wd=%E5%8F%B6%E7%92%87%E6%8E%A7%E8%AF%89%E5%BC%BA%E8%BF%AB%E5%96%9D%E9%85%92&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_1&amp;rqid=de81beae000e1653">叶璇控诉强迫喝酒</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1303万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot2 c-gap-icon-right-small">2</span><a
                                                            target="_blank" title="巩俐出演中国女排"
                                                            href="/s?wd=%E5%B7%A9%E4%BF%90%E5%87%BA%E6%BC%94%E4%B8%AD%E5%9B%BD%E5%A5%B3%E6%8E%92&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_2&amp;rqid=de81beae000e1653">巩俐出演中国女排</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1158万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span
                                                            class="c-index  c-index-hot3 c-gap-icon-right-small">3</span><a
                                                            target="_blank" title="刘恺威资产未分割"
                                                            href="/s?wd=%E5%88%98%E6%81%BA%E5%A8%81%E8%B5%84%E4%BA%A7%E6%9C%AA%E5%88%86%E5%89%B2&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_3&amp;rqid=de81beae000e1653">刘恺威资产未分割</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">1072万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">4</span><a
                                                            target="_blank" title="陈意涵出月子跑步"
                                                            href="/s?wd=%E9%99%88%E6%84%8F%E6%B6%B5%E5%87%BA%E6%9C%88%E5%AD%90%E8%B7%91%E6%AD%A5&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_4&amp;rqid=de81beae000e1653">陈意涵出月子跑步</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">921万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">5</span><a
                                                            target="_blank" title="派遣人类定居月球"
                                                            href="/s?wd=%E6%B4%BE%E9%81%A3%E4%BA%BA%E7%B1%BB%E5%AE%9A%E5%B1%85%E6%9C%88%E7%90%83&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_5&amp;rqid=de81beae000e1653">派遣人类定居月球</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">837万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">6</span><a
                                                            target="_blank" title="GA20首次公开试飞"
                                                            href="/s?wd=GA20%E9%A6%96%E6%AC%A1%E5%85%AC%E5%BC%80%E8%AF%95%E9%A3%9E&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_6&amp;rqid=de81beae000e1653">GA20首次公开试飞</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">815万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">7</span><a
                                                            target="_blank" title="YG市值蒸发7亿"
                                                            href="/s?wd=YG%E5%B8%82%E5%80%BC%E8%92%B8%E5%8F%917%E4%BA%BF&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_7&amp;rqid=de81beae000e1653">YG市值蒸发7亿</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">786万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">8</span><a
                                                            target="_blank" title="鲁能战平鹿岛鹿角"
                                                            href="/s?wd=%E9%B2%81%E8%83%BD%E6%88%98%E5%B9%B3%E9%B9%BF%E5%B2%9B%E9%B9%BF%E8%A7%92&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_8&amp;rqid=de81beae000e1653">鲁能战平鹿岛鹿角</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">784万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">9</span><a
                                                            target="_blank" title="崔钟训退出娱乐圈"
                                                            href="/s?wd=%E5%B4%94%E9%92%9F%E8%AE%AD%E9%80%80%E5%87%BA%E5%A8%B1%E4%B9%90%E5%9C%88&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_9&amp;rqid=de81beae000e1653">崔钟训退出娱乐圈</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">717万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">10</span><a
                                                            target="_blank" title="买超求婚视频"
                                                            href="/s?wd=%E4%B9%B0%E8%B6%85%E6%B1%82%E5%A9%9A%E8%A7%86%E9%A2%91&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_10&amp;rqid=de81beae000e1653">买超求婚视频</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">637万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">11</span><a
                                                            target="_blank" title="娱乐圈四小花旦"
                                                            href="/s?wd=%E5%A8%B1%E4%B9%90%E5%9C%88%E5%9B%9B%E5%B0%8F%E8%8A%B1%E6%97%A6&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_11&amp;rqid=de81beae000e1653">娱乐圈四小花旦</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">515万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">12</span><a
                                                            target="_blank" title="波音股价连续大跌"
                                                            href="/s?wd=%E6%B3%A2%E9%9F%B3%E8%82%A1%E4%BB%B7%E8%BF%9E%E7%BB%AD%E5%A4%A7%E8%B7%8C&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_12&amp;rqid=de81beae000e1653">波音股价连续大跌</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">496万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">13</span><a
                                                            target="_blank" title="恒大1-3惨败大邱"
                                                            href="/s?wd=%E6%81%92%E5%A4%A71-3%E6%83%A8%E8%B4%A5%E5%A4%A7%E9%82%B1&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_13&amp;rqid=de81beae000e1653">恒大1-3惨败大邱</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">450万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">14</span><a
                                                            target="_blank" title="李荣浩同款狗狗"
                                                            href="/s?wd=%E6%9D%8E%E8%8D%A3%E6%B5%A9%E5%90%8C%E6%AC%BE%E7%8B%97%E7%8B%97&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_14&amp;rqid=de81beae000e1653">李荣浩同款狗狗</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">407万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">15</span><a
                                                            target="_blank" title="QQ注销功能上线"
                                                            href="/s?wd=QQ%E6%B3%A8%E9%94%80%E5%8A%9F%E8%83%BD%E4%B8%8A%E7%BA%BF&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_1_15_15&amp;rqid=de81beae000e1653">QQ注销功能上线</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">363万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                </tbody>
                                                <tbody style="display:none">
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">16</span><a
                                                            target="_blank" title="利物浦晋级欧冠8强"
                                                            href="/s?wd=%E5%88%A9%E7%89%A9%E6%B5%A6%E6%99%8B%E7%BA%A7%E6%AC%A7%E5%86%A08%E5%BC%BA&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_16&amp;rqid=de81beae000e1653">利物浦晋级欧冠8强</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">361万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">17</span><a
                                                            target="_blank" title="大S婆婆朋友圈"
                                                            href="/s?wd=%E5%A4%A7S%E5%A9%86%E5%A9%86%E6%9C%8B%E5%8F%8B%E5%9C%88&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_17&amp;rqid=de81beae000e1653">大S婆婆朋友圈</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">360万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">18</span><a
                                                            target="_blank" title="巴萨5-1晋级八强"
                                                            href="/s?wd=%E5%B7%B4%E8%90%A85-1%E6%99%8B%E7%BA%A7%E5%85%AB%E5%BC%BA&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_18&amp;rqid=de81beae000e1653">巴萨5-1晋级八强</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">353万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">19</span><a
                                                            target="_blank" title="医保药品目录调整"
                                                            href="/s?wd=%E5%8C%BB%E4%BF%9D%E8%8D%AF%E5%93%81%E7%9B%AE%E5%BD%95%E8%B0%83%E6%95%B4&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_19&amp;rqid=de81beae000e1653">医保药品目录调整</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">345万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">20</span><a
                                                            target="_blank" title="中学禁止男女同行"
                                                            href="/s?wd=%E4%B8%AD%E5%AD%A6%E7%A6%81%E6%AD%A2%E7%94%B7%E5%A5%B3%E5%90%8C%E8%A1%8C&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_20&amp;rqid=de81beae000e1653">中学禁止男女同行</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">344万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">21</span><a
                                                            target="_blank" title="郑俊英道歉信"
                                                            href="/s?wd=%E9%83%91%E4%BF%8A%E8%8B%B1%E9%81%93%E6%AD%89%E4%BF%A1&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_21&amp;rqid=de81beae000e1653">郑俊英道歉信</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">338万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">22</span><a
                                                            target="_blank" title="火箭宣布转正豪斯"
                                                            href="/s?wd=%E7%81%AB%E7%AE%AD%E5%AE%A3%E5%B8%83%E8%BD%AC%E6%AD%A3%E8%B1%AA%E6%96%AF&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_22&amp;rqid=de81beae000e1653">火箭宣布转正豪斯</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">338万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">23</span><a
                                                            target="_blank" title="C罗帽子戏法逆转"
                                                            href="/s?wd=C%E7%BD%97%E5%B8%BD%E5%AD%90%E6%88%8F%E6%B3%95%E9%80%86%E8%BD%AC&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_23&amp;rqid=de81beae000e1653">C罗帽子戏法逆转</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">335万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">24</span><a
                                                            target="_blank" title="女孩云南相亲被困"
                                                            href="/s?wd=%E5%A5%B3%E5%AD%A9%E4%BA%91%E5%8D%97%E7%9B%B8%E4%BA%B2%E8%A2%AB%E5%9B%B0&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_24&amp;rqid=de81beae000e1653">女孩云南相亲被困</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">333万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">25</span><a
                                                            target="_blank" title="龙俊亨宣布退团"
                                                            href="/s?wd=%E9%BE%99%E4%BF%8A%E4%BA%A8%E5%AE%A3%E5%B8%83%E9%80%80%E5%9B%A2&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_25&amp;rqid=de81beae000e1653">龙俊亨宣布退团</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">332万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">26</span><a
                                                            target="_blank" title="三星8K电视发布"
                                                            href="/s?wd=%E4%B8%89%E6%98%9F8K%E7%94%B5%E8%A7%86%E5%8F%91%E5%B8%83&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_26&amp;rqid=de81beae000e1653">三星8K电视发布</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">332万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">27</span><a
                                                            target="_blank" title="火箭vs勇士"
                                                            href="/s?wd=%E7%81%AB%E7%AE%ADvs%E5%8B%87%E5%A3%AB&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_27&amp;rqid=de81beae000e1653">火箭vs勇士</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">322万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">28</span><a
                                                            target="_blank" title="全球最佳城市排名"
                                                            href="/s?wd=%E5%85%A8%E7%90%83%E6%9C%80%E4%BD%B3%E5%9F%8E%E5%B8%82%E6%8E%92%E5%90%8D&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_28&amp;rqid=de81beae000e1653">全球最佳城市排名</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">319万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">29</span><a
                                                            target="_blank" title="梅西独造四球"
                                                            href="/s?wd=%E6%A2%85%E8%A5%BF%E7%8B%AC%E9%80%A0%E5%9B%9B%E7%90%83&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_29&amp;rqid=de81beae000e1653">梅西独造四球</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">317万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">30</span><a
                                                            target="_blank" title="西安交大夸夸群"
                                                            href="/s?wd=%E8%A5%BF%E5%AE%89%E4%BA%A4%E5%A4%A7%E5%A4%B8%E5%A4%B8%E7%BE%A4&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_16_30_30&amp;rqid=de81beae000e1653">西安交大夸夸群</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">304万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                </tbody>
                                                <tbody style="display:none">
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">31</span><a
                                                            target="_blank" title="库里31岁生日"
                                                            href="/s?wd=%E5%BA%93%E9%87%8C31%E5%B2%81%E7%94%9F%E6%97%A5&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_31&amp;rqid=de81beae000e1653">库里31岁生日</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">297万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">32</span><a
                                                            target="_blank" title="迪士尼收购福克斯"
                                                            href="/s?wd=%E8%BF%AA%E5%A3%AB%E5%B0%BC%E6%94%B6%E8%B4%AD%E7%A6%8F%E5%85%8B%E6%96%AF&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_32&amp;rqid=de81beae000e1653">迪士尼收购福克斯</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">295万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">33</span><a
                                                            target="_blank" title="欧冠8强出炉"
                                                            href="/s?wd=%E6%AC%A7%E5%86%A08%E5%BC%BA%E5%87%BA%E7%82%89&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_33&amp;rqid=de81beae000e1653">欧冠8强出炉</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">288万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">34</span><a
                                                            target="_blank" title="拼多多股价大跌"
                                                            href="/s?wd=%E6%8B%BC%E5%A4%9A%E5%A4%9A%E8%82%A1%E4%BB%B7%E5%A4%A7%E8%B7%8C&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_34&amp;rqid=de81beae000e1653">拼多多股价大跌</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">287万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">35</span><a
                                                            target="_blank" title="baby现身医院就医"
                                                            href="/s?wd=baby%E7%8E%B0%E8%BA%AB%E5%8C%BB%E9%99%A2%E5%B0%B1%E5%8C%BB&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_35&amp;rqid=de81beae000e1653">baby现身医院就医</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">286万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">36</span><a
                                                            target="_blank" title="青海泽库县地震"
                                                            href="/s?wd=%E9%9D%92%E6%B5%B7%E6%B3%BD%E5%BA%93%E5%8E%BF%E5%9C%B0%E9%9C%87&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_36&amp;rqid=de81beae000e1653">青海泽库县地震</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">286万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">37</span><a
                                                            target="_blank" title="周杰伦亲自打假"
                                                            href="/s?wd=%E5%91%A8%E6%9D%B0%E4%BC%A6%E4%BA%B2%E8%87%AA%E6%89%93%E5%81%87&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_37&amp;rqid=de81beae000e1653">周杰伦亲自打假</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">282万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">38</span><a
                                                            target="_blank" title="梅艳芳母亲破产"
                                                            href="/s?wd=%E6%A2%85%E8%89%B3%E8%8A%B3%E6%AF%8D%E4%BA%B2%E7%A0%B4%E4%BA%A7&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_38&amp;rqid=de81beae000e1653">梅艳芳母亲破产</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">278万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">39</span><a
                                                            target="_blank" title="吴昕新剧演技被赞"
                                                            href="/s?wd=%E5%90%B4%E6%98%95%E6%96%B0%E5%89%A7%E6%BC%94%E6%8A%80%E8%A2%AB%E8%B5%9E&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_39&amp;rqid=de81beae000e1653">吴昕新剧演技被赞</a></span><span
                                                            class="c-text c-text-danger c-gap-icon-left-small opr-toplist1-new">新</span>
                                                    </td>
                                                    <td class="opr-toplist1-right">274万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">40</span><a
                                                            target="_blank" title="坠机现场遗物挖出"
                                                            href="/s?wd=%E5%9D%A0%E6%9C%BA%E7%8E%B0%E5%9C%BA%E9%81%97%E7%89%A9%E6%8C%96%E5%87%BA&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_40&amp;rqid=de81beae000e1653">坠机现场遗物挖出</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">271万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">41</span><a
                                                            target="_blank" title="教育部辟谣改革"
                                                            href="/s?wd=%E6%95%99%E8%82%B2%E9%83%A8%E8%BE%9F%E8%B0%A3%E6%94%B9%E9%9D%A9&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_41&amp;rqid=de81beae000e1653">教育部辟谣改革</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">268万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">42</span><a
                                                            target="_blank" title="杨幂谢依霖同框"
                                                            href="/s?wd=%E6%9D%A8%E5%B9%82%E8%B0%A2%E4%BE%9D%E9%9C%96%E5%90%8C%E6%A1%86&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_42&amp;rqid=de81beae000e1653">杨幂谢依霖同框</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">260万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">43</span><a
                                                            target="_blank" title="猫眼投资欢喜传媒"
                                                            href="/s?wd=%E7%8C%AB%E7%9C%BC%E6%8A%95%E8%B5%84%E6%AC%A2%E5%96%9C%E4%BC%A0%E5%AA%92&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_43&amp;rqid=de81beae000e1653">猫眼投资欢喜传媒</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">260万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">44</span><a
                                                            target="_blank" title="吴京坐轮椅现身"
                                                            href="/s?wd=%E5%90%B4%E4%BA%AC%E5%9D%90%E8%BD%AE%E6%A4%85%E7%8E%B0%E8%BA%AB&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_44&amp;rqid=de81beae000e1653">吴京坐轮椅现身</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">250万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">45</span><a
                                                            target="_blank" title="微信好友数算成绩"
                                                            href="/s?wd=%E5%BE%AE%E4%BF%A1%E5%A5%BD%E5%8F%8B%E6%95%B0%E7%AE%97%E6%88%90%E7%BB%A9&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_31_45_45&amp;rqid=de81beae000e1653">微信好友数算成绩</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">246万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                </tbody>
                                                <tbody style="display:none">
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">46</span><a
                                                            target="_blank" title="香港电影导演会"
                                                            href="/s?wd=%E9%A6%99%E6%B8%AF%E7%94%B5%E5%BD%B1%E5%AF%BC%E6%BC%94%E4%BC%9A&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_46_50_46&amp;rqid=de81beae000e1653">香港电影导演会</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">243万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">47</span><a
                                                            target="_blank" title="范加尔告别足坛"
                                                            href="/s?wd=%E8%8C%83%E5%8A%A0%E5%B0%94%E5%91%8A%E5%88%AB%E8%B6%B3%E5%9D%9B&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_46_50_47&amp;rqid=de81beae000e1653">范加尔告别足坛</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">235万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">48</span><a
                                                            target="_blank" title="埃航最后6分钟"
                                                            href="/s?wd=%E5%9F%83%E8%88%AA%E6%9C%80%E5%90%8E6%E5%88%86%E9%92%9F&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_46_50_48&amp;rqid=de81beae000e1653">埃航最后6分钟</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">233万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">49</span><a
                                                            target="_blank" title="吃聪明药等于吸毒"
                                                            href="/s?wd=%E5%90%83%E8%81%AA%E6%98%8E%E8%8D%AF%E7%AD%89%E4%BA%8E%E5%90%B8%E6%AF%92&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_46_50_49&amp;rqid=de81beae000e1653">吃聪明药等于吸毒</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">232万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                <tr>

                                                    <td><span><span class="c-index  c-gap-icon-right-small">50</span><a
                                                            target="_blank" title="菜鸟驿站刷脸取件"
                                                            href="/s?wd=%E8%8F%9C%E9%B8%9F%E9%A9%BF%E7%AB%99%E5%88%B7%E8%84%B8%E5%8F%96%E4%BB%B6&amp;tn=baiduhome_pg&amp;rsv_idx=2&amp;ie=utf-8&amp;rsv_cq=Lucene+%E8%81%94%E6%83%B3%E8%AF%8D&amp;rsv_dl=0_right_fyb_pchot_20811_01&amp;rsf=48e1b70712fc3a4dadb9fe5221319a59_46_50_50&amp;rqid=de81beae000e1653">菜鸟驿站刷脸取件</a></span>
                                                    </td>
                                                    <td class="opr-toplist1-right">215万<i
                                                            class="opr-toplist1-st c-icon "></i></td>
                                                </tr>
                                                </tbody>
                                                <tbody style="display:none"></tbody>
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
