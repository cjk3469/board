<%@ page import="com.example.board.vo.UserVO" %>
<%@ page import="com.example.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <style>
        h1 {
            text-align: center;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }

        button {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<h1>게시물 목록</h1>
<%--<% UserVO userVO = (UserVO) session.getAttribute("member"); %>--%>
<%--<%String test = userVO.getId();%>--%>
<%--<% if (userVO != null) { %>--%>
<%--<p>로그인된 아이디: <%= userVO.getId() %></p>--%>
<%--<% } %>--%>
<%--<% session.setAttribute("user",test); %>--%>


<%
    List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
%>

<!-- 게시글 리스트 출력 -->
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <% for (BoardVO boardVO : boardList) { %>

    <tr>
        <td><%= boardVO.getBoardSeq()%></td>
        <td><%= boardVO.getBoardTitle() %></td>
<%--        <td><%= boardVO.getContent() %></td>--%>
        <td><%= boardVO.getBoardAuthor()%></td>
    </tr>
  <% } %>
    </tbody>
</table>
<br>
<button onclick="location.href='boardwrite'">게시물 작성</button>
</body>
</html>
