<%@ page import="com.bo.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style type="text/css">
        .explore {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgb(237, 244, 237);
            height: 80px;
            padding-left: 8%;
            padding-right: 10px;
        }

        .nav {
            display: flex;
            align-items: center;
            list-style: none;
        }

        .nav li {
            color: rgb(61, 133, 73);
            font-size: 18px;
            margin-right: 20px;
        }

        .search-input {
            flex: 0 0 30%;
            height: 35px;
            background-color: #fff;
            border: none;
            border-radius: 3px;
            margin-left: 50px;
            color: rgb(187, 187, 202);
            font-size: 16px;
        }

        .info {
            display: flex;
        }

        .profile {
            width: 80px;
            height: 80px;
            border-radius: 5px;
        }

        h2 {
            color: rgb(73, 73, 73);
            margin-left: 15px;
        }

        .info-box {
            padding: 10px 10px 10px 10px;
            width: 90%;
            height: 240px;
            border: 1px solid #eee;
            border-radius: 5px;
            background-color: rgb(237, 244, 237);
        }

        .info-box .top {
            height: 80%;
            display: flex;
            border-bottom: 1px solid #e4e6e5;
        }

        .info-box .top img {
            width: 55%;
            height: 85%;
            margin-right: 5px;
            border-radius: 5px;
        }

        p {
            font-size: 13px;
            color: #333;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .item {
            height: 80px;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .read {
            border-bottom: 1px solid #eee;
        }

        .read a {
            color: rgb(51, 119, 170);
            text-decoration: none;
        }

        .container {
            width: 85%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    pageContext.setAttribute("user", user);
%>

<%--顶部区域，引入共用的top.jsp页面--%>
<div id="top">
    <jsp:include page="top.jsp"/>
</div>

<%--浏览区域--%>
<div class="explore">
    <ul class="nav">
        <li>首页</li>
        <li>浏览记录</li>
        <li>我的关注</li>
        <li>访客记录</li>
    </ul>
    <label>
        <input type="text" placeholder="添加好友" class="search-input">
    </label>
</div>
<br>

<%--页面主题区域--%>
<div class="container">
    <div class="row">
        <%--左侧2/3区域--%>
        <div class="col-8">
            <div class="info">
                <img src="images/${user.avatar}" alt="" class="profile">
                <h2>${user.nickname}</h2>
            </div>
            <div>
                <p>账号：${user.account}</p>
                <p>常居地址：${user.address}</p>
                <p>加入时间：${user.joinDate}</p>
            </div>
            <br>
            <div class="item">
                <ul class="nav">
                    <li>我的笔记</li>
                </ul>
               <p>第一章</p> <p style="color: #9b9b9b;">2019.1.3</p>


            </div>

            <div class="item">
                <ul class="nav">
                    <li>关注作者</li>
                </ul>
                <p>已关注：10位</p>
            </div>
            <div class="item">
                <ul class="nav">
                    <li>留言板</li>
                </ul>
                <label>
                    <textarea cols="80" rows="5"></textarea>
                </label>
                <div>
                    <input type="button" value="留言">
                </div>
            </div>
        </div>

        <%-- 右侧1/3区域--%>
        <div class="col-4">

            <div class="item">
                <ul class="nav">
                    <li>推荐书籍</li>
                </ul>
                <br>
                <div class="read">
                    <p><a href="">我的世界</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2018年1月13日</p>
                </div>
                <div class="read">
                    <p><a href="">大主宰</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2012年6月1日</p>
                </div>
                <div class="read">
                    <p><a href="">斗罗大陆</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2008年1月2日</p>
                </div>
                <div class="read">
                    <p><a href="">我的世界</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2018年1月13日</p>
                </div>
                <div class="read">
                    <p><a href="">大主宰</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2012年6月1日</p>
                </div>
                <div class="read">
                    <p><a href="">斗罗大陆</a>推荐给
                        <a href="">${user.nickname}</a>
                    </p>
                    <p style="color: #9b9b9b;">出书时间：2008年1月2日</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
