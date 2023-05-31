<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
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
<h1>회원가입</h1>
<form name="signup" method="post" action="signup">
    <input type="text" placeholder="아이디" name="id" required/>
    <br>
    <input type="text" placeholder="이름" name="name" required/>
    <br>
    <input type="password" placeholder="비밀번호" name="pw" required/>
    <br>
    <br>
    <button type="submit">회원가입</button>
    <button onclick="location.href='signin'">로그인</button>
</form>
</body>
</html>
