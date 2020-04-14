<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cyf.dao.*" %>
<%@ page import="com.cyf.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="GB18030">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>��������վ��̨�������</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        /*ý���ѯ��С��Ļ��ƽ�壬���ڵ���768px��*/
        @media (min-width:768px){
            #leftbar{
                width:240px;
                margin:55px 0px 0px 0px;
                position:absolute;
                /*z-index:1;*/
                height:500px;
                /*background:#B9DEF0;*/
            }
            .page-right{
                background:#ddd;
                margin:-5px 0px 0px 245px;
            }
        }
        /* */
        .left-dh{
            margin: 10px 0px;
        }
        @media (max-width:768px){
            body{
                background:#777;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="navbar-header">
        <a href="#" class="navbar-brand">��������վ��̨����</a>
        <button class="navbar-toggle" data-toggle="collapse" data-target="#login">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <button class="navbar-toggle" data-toggle="collapse" data-target="#leftbar">
            <span>����</span>
        </button>
    </div>
    <ul class="nav navbar-nav navbar-right navbar-collapse collapse" id="login" style="margin:0px 20px 0px 0px;">
       <c:set var="username" scope="session" value="${currentUser.userName}"/>
		<c:choose>
		 <c:when test="${not empty username}">
		    <li><a href="#"><span class="badge" >��ǰ�û���</span>${currentUser.userName}</a></li>
		    </c:when>
		    <c:otherwise>
		    <li><a href="#"><span class="badge">��ǰ�û���</span>δ��¼${currentUser.userName}</a></li>
		    </c:otherwise>
		</c:choose>
        <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					�û� <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="http://localhost:8080/bookstore/user/user-update.jsp">��������</a></li>
					<li class="divider"></li>
					<li><a href="http://localhost:8080/bookstore/login.jsp">��¼</a></li>
					<li class="divider"></li>
					<li><a href="http://localhost:8080/bookstore/logout">�˳���¼</a></li>
				</ul>
			</li>
    </ul>
    <!--����� -->
       <div class="navbar-collapse collapse" id="leftbar">
        <ul class="nav" id="mz">
            <li class="panel panel-default">
                <a href="#lanmu" data-toggle="collapse" data-parent="#mz">��������<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                <ul class="panel-collapse collapse nav" id="lanmu">
	                <li><a href="manage-order-updata.jsp">�����޸�</a></li>
	                <li><a href="manage-order-delete.jsp">����ɾ��</a></li>
                    <li><a href="OrderAdminServlet">�������</a></li>
                </ul>
            </li>
            <li class="panel panel-default">
                <a href="#la" data-toggle="collapse" data-parent="#mz">�û�����<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                <ul class="panel-collapse collapse nav" id="la">
	                <li><a href="manage-user-delete.jsp">�û���Ϣɾ��</a></li>
                    <li><a href="userselectServlet">�û���Ϣ���</a></li>
                </ul>
            </li>
            <li class="panel panel-default">
                <a href="#l" data-toggle="collapse" data-parent="#mz">�鼮����<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                <ul class="panel-collapse collapse nav" id="l">
	                <li><a href="manage-book-delete.jsp">�鼮ɾ��</a></li>
                    <li><a href="bookselectServlet">�鼮��Ϣ���</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!--�ұ���Ҫ���� -->
<div class="page-right">
    <ol class="breadcrumb">
        <li><a href="#">��ҳ����</a></li>
        <li><a href="#">��̨����</a></li>
        <li><a href="#">�������</a></li>
    </ol>    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    ����Ϣ���
                </div>
               <c:choose>
	            <c:when test="${empty bookList}">
	                <h3 class="text-center">û�ж�����¼ </h3>
	            </c:when>
	            <c:otherwise>
                <div class="panel-body">
                    <table class="table table-striped table-hover table-responsive">
                        <thead>
                    <tr>
                       <th>���</th>
                       <th>����</th>
                       <th>�۸�</th>
                       <th>����</th>
                       <th>����</th>
                       <th>����</th>
                       <th>���</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookList}" var="list">
                        <tr>
                            <td>${list.bookId}</td>
                            <td>${list.bookName}</td>
                            <td>${list.bookSprice}</td>
                            <td>${list.bookAuthor}</td>
                            <td>${list.bookCount}</td>
                            <td>${list.booktype}</td>
                            <td>${list.bookremark}</td>
                        </tr>
                    </c:forEach>             
                    </tbody>
                    </table>
                </div>
                </c:otherwise>
             </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>