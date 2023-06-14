<%@ page import="com.example.board.vo.UserVO" %>
<%@ page import="com.example.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
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

        .btn-custom {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>게시물 상세</h1>

    <% BoardVO boardVO = (BoardVO) request.getAttribute("boardVO"); %>

    <!-- 게시글 정보 출력 -->
    <table class="table">
        <tbody>
        <tr>
            <th>제목</th>
            <td><%= boardVO.getBoardTitle() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><%= boardVO.getBoardContent() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%= boardVO.getBoardAuthor() %></td>
        </tr>
        <tr>
            <th>작성 일자</th>
            <td><%= boardVO.getBoardCreateDate() %></td>
        </tr>
        </tbody>
    </table>
    <br>
    <button class="btn btn-primary btn-custom" onclick="location.href='boardlist'">목록</button>
</div>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
