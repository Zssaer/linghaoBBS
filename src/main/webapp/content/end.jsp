<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>尾页</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
    <title>页尾</title>
    <style>
        .footer{
            margin-top:35px;
            color: white;
            background-color:#4476A7;
        }
    </style>
</head>
<body>
<div class="footer">
    <div class="container">
        <div class="row footer-top">
            <div class="col-sm-6 col-lg-6">
                <H4>零号论坛专注于应用软件学习和开发交流，是程序员沟通之间的桥梁。</H4>
                <H4>你可能觉得这个论坛没什么用，那么你或许是对的，这个论坛现在真的没什么用。</H4>
            </div>
            <div class="col-sm-6  col-lg-5 col-lg-offset-1">
                <div class="row about">
                    <div class="col-xs-3">
                        <h4>联系方式</h4>
                        <ul class="list-unstyled">
                            <li>
                                <a href="https://nmdwsm.cn/" class="btn btn-primary btn-lg active" role="button">个人网站</a>
                            </li>
                            <li>
                                <button type="button" class="btn btn-lg btn-primary" disabled="disabled">QQ：641348448</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer-bottom">
            <ul class="list-inline text-center">
                <li>Copyright &copy;2020. 2018级软件13班1组 Software All Rights Reserved.</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
