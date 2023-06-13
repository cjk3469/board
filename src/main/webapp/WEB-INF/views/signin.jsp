<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <style>
        h1 {
            text-align: center;
        }

        form {
            margin: 0 auto;
            width: 300px;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<h1>로그인</h1>
<form name="signin" method="post" action="signin">
    <input type="text" placeholder="아이디" name="userId" required/>
    <br>
    <input type="password" placeholder="비밀번호" name="userPw" required/>
    <br>
    <button type="submit">로그인</button>

</form>
<button onclick="location.href='signupform'">회원가입</button>
</body>
</html>
