<%@ page import="com.example.board.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<h1>Home</h1>
<%-- 세션에서 아이디 정보 가져오기 --%>
<% UserVO userVO = (UserVO) session.getAttribute("member"); %>
<% if (userVO != null) { %>
<p>로그인된 아이디: <%= userVO.getUserId() %></p>
<% } %>
<button onclick="location.href='signin'">로그인</button>
</body>
</html>