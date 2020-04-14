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
    <title>��������վ����</title>
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
                background:#FFFFFF;
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
       .content {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .input-css {
            width: 150px;
            height: 35px;
        }
        .btn {
            width: 80px;
            height: 35px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="navbar-header">
        <a href="http://localhost:8080/bookstore/index.jsp" class="navbar-brand">��������վ����</a>
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
			 <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					���ﳵ <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="http://localhost:8080/bookstore/user/user-cart.jsp">���ﳵ����</a></li>
					<li class="divider"></li>
					<li><a href="http://localhost:8080/bookstore/clearCart">��չ��ﳵ</a></li>
					<li class="divider"></li>
					<li><a href="http://localhost:8080/bookstore/user/selectCartServlet">�����¼</a></li>
				</ul>
			</li>
        <li><a href="http://localhost:8080/bookstore/register">ע��</a></li>
    </ul>
    <!--����� -->
    <form class="form-inline" action="" method="post">
    <div class="navbar-collapse collapse" id="leftbar">
        <ul class="nav" id="mz">
            <li>
                <div class="input-group left-dh">
                    <input type="text" class="form-control" name="key" placeholder="������ؼ���">
                    <span class="input-group-btn">
					<button class="btn btn-danger" type="submit">
					<span class="glyphicon glyphicon-search"></span>
					</button>
                     </sapn>
                </div>
            </li>
            <li class="panel panel-default">
                <a href="#sys" data-toggle="collapse" data-parent="#mz">�鼮����<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                <ul class="panel-collapse collapse nav" id="sys">
                    
						<%
							BookDao dao = new BookDao();
							List<type> List = dao.getbookstype();
	
							for (type Info : List) {
						%>
						<li class="dropdown">
							<a href="http://localhost:8080/bookstore/classServlet?classname=<%=Info.getType_id()%>" class="dropdown-toggle"><%=Info.getType_name()%></a>
						</li>
						<%
							}
						%>
                </ul>
            </li>
        </ul>
    </div>
    </form>
</nav>
<!--�ұ���Ҫ���� -->
<div class="page-right">
    <ol class="breadcrumb">
        <li><a href="#">��ҳ����</a></li>
        <li><a href="#">��̨����</a></li>
        <li><a href="#">���ﳵ����</a></li>
    </ol>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    ���ﳵ����
                </div>
                <div class="panel-body" >
                <div class="content">
                     <form action="updateUser" method="post">
		            <%--message��ʾ������Ϣ--%>
		            <span style="color: red;">${message}</span><br/>
		            <input type="hidden" name="userId" required class="input-css" value="${currentUser.userId}"/>
		            �˻���<input type="text" name="userName" required class="input-css" readonly value="${currentUser.userName}"/><br/>
		            ���룺<input type="password" name="userPassword" required class="input-css" value="${currentUser.userPassword}"/><br/>
		            <input type="submit" value="�޸�����" class="btn"><br/>
		       		 </form>
		        </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>