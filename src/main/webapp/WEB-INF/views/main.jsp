<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function() {
            function btn_signup() {
                // Sign up 버튼 클릭 시 동작하는 로직을 작성하세요
            }
        });
    </script>
</head>
<body>
<ul>
    <c:choose>
        <c:when test="${not empty member}">
            <h1>suc</h1>
        </c:when>
        <c:otherwise>
            <h1>fail</h1>
        </c:otherwise>
    </c:choose>
</ul>
</body>
</html>
