<%@ page import="com.example.board.vo.UserVO" %>
<%@ page import="com.example.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
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
    <h1>게시물 목록</h1>

    <% List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList"); %>
    <% UserVO user = (UserVO) session.getAttribute("member"); %>

    <div class="text-end">
        <% if(user != null){ %>
        <h2><%= user.getUserId() %></h2>
        <button class="btn btn-primary btn-custom" onclick="location.href='logout'">로그아웃</button>
        <% } else { %>
        <button class="btn btn-primary btn-custom" onclick="location.href='signin'">로그인</button>
        <% } %>
    </div>

    <!-- 게시글 리스트 출력 -->
    <table class="table">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성 일자</th>
        </tr>
        </thead>
        <tbody>
        <% int pageSize = 10;
            int currentPage = 1;
            String currentPageParam = request.getParameter("page");
            if (currentPageParam != null) {
                currentPage = Integer.parseInt(currentPageParam);
            }
            int startIdx = (currentPage - 1) * pageSize;
            int endIdx = Math.min(startIdx + pageSize, boardList.size());

            for (int i = startIdx; i < endIdx; i++) {
                BoardVO boardVO = boardList.get(i);
        %>
        <tr name="boardSeq" onclick="location.href='boarddetail?boardSeq=<%= boardVO.getBoardSeq() %>'">
            <td><%= boardVO.getBoardSeq() %></td>
            <td><%= boardVO.getBoardTitle() %></td>
            <td><%= boardVO.getBoardAuthor() %></td>
            <td><%= boardVO.getBoardCreateDate() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <br>
    <nav aria-label="게시물 목록 페이지">
        <ul class="pagination justify-content-center">
            <% int pageCount = (int) Math.ceil((double) boardList.size() / pageSize);
                for (int i = 1; i <= pageCount; i++) {
                    if (i == currentPage) { %>
            <li class="page-item active" aria-current="page">
                <span class="page-link"><%= i %></span>
            </li>
            <% } else { %>
            <li class="page-item">
                <a class="page-link" href="boardlist?page=<%= i %>"><%= i %></a>
            </li>
            <% }
            } %>
        </ul>
    </nav>
    <br>
    <button class="btn btn-primary btn-custom" onclick="location.href='boardwrite'">게시물 작성</button>
</div>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
