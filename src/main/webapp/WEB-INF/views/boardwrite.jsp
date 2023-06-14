<%@ page import="com.example.board.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button{
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>게시물 작성</h1>
<%
//    UserVO userVO = new UserVO();
    UserVO userVO = (UserVO) session.getAttribute("member");
    String id = "";
    if(userVO != null){
        id = userVO.getUserId();
    }else{
        id = null;
    }

    if(id != null && !id.isEmpty()){
        session.setAttribute("user",id);
    }else {
%>
      <script>
          alert("로그인이 필요합니다.");
          location.href="signinform";
      </script>
<%
    }
%>
<form action="boardwrite" method="post">
    <div>
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
    </div>
    <div>
        <label for="content">내용</label>
        <textarea id="content" name="content" rows="5" required></textarea>
    </div>
    <br>
    <button type="submit">작성</button>
    <button onclick=location.href="boardlist">취소</button>
</form>
</body>
</html>
