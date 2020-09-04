<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>主体内容</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
<%-- 方便ajax获取APP_PATH --%>
<input id="APP_PATH" type="hidden" value="${APP_PATH}" >
<%-- 方便ajax获取session中的userid --%>
<input id="session_userid" type="hidden" value="${userid}" >
<!--主体（下）-->
<div class="container BG">
    <div class="row">
        <!--左边板块-->
        <div id="content_left">
            <!--代码部分begin-->
            <div class="jq22">
                <!-- 帖子展示-循环 -->
                <div id="articles_all"></div>
                <div class="text-center more" id="appendMore"></div>
            </div>
            <div class="row">
                <div class="col-md-12"
                     style="position: relative; background-color: #f6f6f6; height: 30px;"></div>
            </div>
        </div>

        <!--右边板块-->
        <div id="content_right">
            <div class="row">
                <div class="col-md-12" style="position: relative; padding-top: 10px;">
                    <b>所有板块</b>
                    <hr>
                </div>
            </div>
            <!-- 板块展示-循环 -->
            <div class="row" id="plates_all"></div>
            <div class="row">
                <div class="col-md-12" style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
            </div>

            <div class="row">
                <div class="col-md-12"
                     style="position: relative; padding-top: 10px;">
                    <b>热门文章</b>
                    <hr>
                </div>
            </div>
            <!-- 热门帖子展示-循环 -->
            <div id="hotArticle_all"></div>

            <div class="row" style="position: relative; background-color: #f6f6f6; height: 10px;"></div>

            <div class="row">
                <div class="col-md-12" style="position: relative; padding-top: 10px;">
                    <b>论坛简介</b>
                    <hr>
                </div>
            </div>
            <div>
                <p style="line-height:30px;">零号论坛存在是为了方便大家讨论、学习计算机的程序员论坛。</p>
            </div>

            <div class="row" style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
            <div class="row">
                <div class="col-md-12" style="position: relative; padding-top: 10px;">
                    <b>论坛开发日志</b>
                    <hr>
                </div>
            </div>

            <div style="line-height:30px;">

                <p><small class="text-warning">2020.07.28</small> 零号论坛所有代码基本完成</p>
                <p><small class="text-warning">2020.07.23</small> 零号论坛Mybaits框架完成</p>
                <p><small class="text-warning">2020.07.21</small> 零号论坛Spring框架完成</p>
                <p><small class="text-warning">2020.07.18</small> 零号论坛基本页面框架完成</p>
                <p><small class="text-warning">2020.07.16</small> 零号论坛项目规划完毕</p>
                <p><small class="text-warning">2020.07.14</small> 零号论坛项目上线</p>
                <h4>......</h4>
            </div>

            <div class="row" style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
            <div class="row">
                <div class="col-md-12" style="position: relative; padding-top: 10px;">
                    <b>友情链接</b>
                    <hr>
                </div>
            </div>
            <div style="line-height:30px;">
                <p>
                    <a href="https://www.baidu.com/" target="_blank">
                        <b class="text-primary">有问题百度！</b> - <small></small>
                    </a>
                </p>
                <p>
                    <a href="https://www.google.cn/" target="_blank">
                        <b class="text-primary">当然也可以谷歌！</b> - <small></small>
                    </a>
                </p>
                <p>
                    <a href="https://www.nmdwsm.cn/" target="_blank">
                        <b class="text-primary">作者个人空间！</b> - <small></small>
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
<script charset="utf-8" src="${APP_PATH }/static/js/content/content.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/content/comment.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/content/attention.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/content/collect.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/content/plate.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/content/article.js"></script>



<script charset="utf-8" src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/phones_pc.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/load_more.js"></script>
<script charset="utf-8" src="${APP_PATH }/static/js/echars/echarts.min.js"></script>

</body>
</html>
