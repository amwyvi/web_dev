<%@ page import="java.util.List" %>
<%@ page import="com.bo.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style type="text/css">
        h2, h3 ,h5 {
            color: rgb(73, 73, 73);
        }

        img{
            cursor: pointer;
            transition: all 0.3s;
        }
        img:hover {
            transform: scale(0.9);
        }

        #search {
            height: 80px;
            background-color: rgb(246, 246, 241);
            display: flex;
            align-items: center;
            padding-left: 8%;
            margin-bottom: 10px;
        }

        .search-input {
            flex: 0 0 40%;
            height: 35px;
            background-color: #fff;
            border: none;
            border-radius: 3px;
            margin-left: 50px;
        }

        .search-btn {
            width: 35px;
            height: 35px;
            background-color: rgb(155, 154, 143);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-btn img {
            width: 50%;
            height: 50%;
        }

        .card {
            height: 180px;
            margin: 20px 5px 20px 5px;
        }

        .card img {
            width: 100%;
            height: 90%;
        }

        .card p {
            font-size: 13px;
            color: #9b9b9b;
        }

        .col-4 img {
            margin: 10px 5px 20px 5px;
            width: 80%;
        }

        hr {
            width: 90%;
            color: #eee;
            margin-top: 10px;
        }
        .right{
            flex: 0 0 30%;
            height: 100%;
        }

        .right-a{
            flex: 0 0 50%;
            list-style: none;
            display: flex;
        }
        .right a{
            text-decoration: none;
            color: #000;
        }
        .right a:hover{
            color: #9b9b9b;
        }


    </style>
</head>
<body>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<%--使用jsp的include动作，将top.jsp页面包含进来，这个顶部导航可以给各个页面共享--%>
<div id="top">
    <jsp:include page="top.jsp"/>
</div>

<%--搜索区--%>
<div id="search">
    <h2>读书时刻</h2>
    <input type="text" placeholder="搜索书名或作者" class="search-input">
    <div class="search-btn">
        <img src="images/search.png" alt="">
    </div>
</div>

<%--主体内容区--%>
<div class="container">
    <div class="row">
        <%--左侧2/3主体部分--%>
        <div class="col-8">
            <h3>热门书籍</h3>
            <hr>
            <div class="row">
                <%--遍历图书数据集合，将每个图书对象放入页面对象--%>
                <%
                    for (Book book : bookList) {
                        pageContext.setAttribute("book", book);
                %>
                <%--引用col-2表示每行显示5本，再追加card细节样式--%>
                <div class="col-2 card">
                    <%--点击每本图书封面图，地址栏跳转为/detail/id,进入图书详情Servlet--%>
                    <a href="${pageContext.request.contextPath}/detail/${book.id}">
                        <img src="images/${book.cover}" alt="">
                    </a>
                    <p style="color: rgb(51, 119, 178)">${book.name}</p>
                    <p>${book.author}</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="right">
            <h3>图书标签</h3>
            <hr>
            <h2>小说</h2><br>
            <ul class="right-a">
                <p><a href="#">外国小说 </a> <a href="#"> 中国当代小说 </a> <a href="#"> 中国古典小说 </a> <a href="#"> 科幻小说 </a></p>
            </ul><br><br>

            <h2>文学</h2><br>
            <ul class="right-a">
                <a href="#">   </a>
                <p><a href="#">   中国现当代散文   </a> <a href="#">    外国散文  </a> <a href="#">    中国现当代诗歌  </a> <a href="#">   外国诗歌  </a></p>
            </ul><br><br>

            <h2>历史</h2><br>
            <ul class="right-a">
                <a href="#">   </a>
                <p><a href="#"> 中国史</a> <a href="#"> 世界史 </a> <a href="#"> 地方史志 </a> <a href="#">  史料典籍</a></p>
            </ul><br><br>
            <h2>法律</h2><br>
            <ul class="right-a">
                <a href="#">   </a>
                <p><a href="#"> 法的理论</a> <a href="#"> 法律法规 </a> <a href="#"> 国际法 </a> <a href="#">  经济法</a></p>
            </ul><br><br>

            <h2>书法</h2><br>
            <ul class="right-a">
                <a href="#">  </a>
                <p><a href="#"> 碑帖</a> <a href="#"> 技法教程 </a> <a href="#"> 书法理论 </a> <a href="#"> 硬笔书法 </a></p>
            </ul><br><br>

            <h2>经济/管理</h2><br>
            <ul class="right-a">
                <a href="#">  </a>
                <p><a href="#"> 经济理论</a> <a href="#">  中国经济</a> <a href="#"> 国际经济 </a> <a href="#">   经济通俗读物</a></p>
            </ul><br><br>



        </div>
    </div>

    <footer>
        <ul>
            <li>@2015-2019</li>
            <li>niit.edu.cn,</li>
            <li>all rights reserved</li>
            <li>南工院计算机学院</li>
        </ul>
        <ul>
            <li>联系我们</li>
            <li>帮助中心</li>
            <li>法律声明</li>
            <li>移动合作</li>
        </ul>
    </footer>
</div>
</body>
</html>
