<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
 <title>����ϵͳ</title>
    <style>
        h1 {
            text-align: center;
            border-bottom: 1px solid black;
            line-height: 100px;
        }

        .content {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        input {
            margin: 15px;
        }

        .input-css {
            width: 250px;
            height: 35px;
        }

        .btn {
            width: 80px;
            height: 35px;
        }
    </style>
</head>
<body>
<div class="content">
    <h1>����ϵͳ</h1>
    <form id="registerForm" method="post" action="register">
        <strong>${message}</strong><br/>
        �˻���<input type="text" name="userName" required class="userName input-css"/><br/>
        ���룺<input type="password" name="userPassword" required class="userPassword input-css"/><br/>
        ȷ�ϣ�<input type="password" required class="checkUserPassword input-css" placeholder=" ȷ������"/><br/>
        <input type="button" value="ע ��" class="btn" onclick="registerFun()"><br/>
      	<a href="index.jsp">�οͷ���</a><br/>
        <a href="login.jsp">ȥ��¼</a>
    </form>
</div>
<script>
    function registerFun() {
        var userName = document.getElementsByClassName("userName")[0].value;
        var userPassword = document.getElementsByClassName("userPassword")[0].value;
        var checkUserPassword = document.getElementsByClassName("checkUserPassword")[0].value;
        //�Ƿ������������Ƿ�Ϊ��
        if (userName != null && userName.length != 0 && userPassword != null && userPassword.length != 0) {
            if (userPassword != checkUserPassword) {
                alert("������������벻ͬ����������");
            } else {
                var form = document.getElementById("registerForm");
                form.submit();
            }
        } else {
            alert("�û��������벻��Ϊ��");
        }
    }
</script>
</body>
</html>