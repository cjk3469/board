<%@ page import="com.example.board.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        h1 {
            text-align: center;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }

        input[type="text"],
        input[type="password"] {
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
<%UserVO userVO = (UserVO) session.getAttribute("member"); %>
<% if (userVO != null) { %>
<script>
    location.href = "boardlist";
</script>

<% } else { %>
<script>
    location.href = "signin";
</script>
<% } %>
<div class="container">
    <h1>로그인</h1>
    <form name="signin" method="post" action="signin">
        <input type="text" class="form-control" placeholder="아이디" name="userId" required/>
        <br>
        <input type="password" class="form-control" placeholder="비밀번호" name="userPw" required/>
        <br>
        <button type="submit" class="btn btn-primary">로그인</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='signup'">회원가입</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
