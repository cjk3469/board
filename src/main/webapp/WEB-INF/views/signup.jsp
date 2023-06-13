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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>회원가입</h1>
<form name="signup" method="post" action="signup">
    <input type="text" id="inputId" placeholder="아이디" name="userId" required/>
    <br>
    <input type="text" placeholder="이름" name="userName" required/>
    <br>
    <input type="password" placeholder="비밀번호" name="userPw" required/>
    <br>
    <input type="password" placeholder="비밀번호확인" name="userPw" required/>
    <br>
</form>
<button onclick="checkId()" method="post">아이디 확인</button>
<script>
    function checkId() {
        var inputIdValue = $("#inputId").val();
        var test = {userId : inputIdValue}
        $.ajax({
            type: "POST",
            url: "/checkId",
            data: test,
            success: response => {
                if (response === inputIdValue) {
                    alert("사용 가능한 아이디입니다.");
                }
                else if(inputIdValue === null || inputIdValue === ""){
                    alert("아이디를 입력해주세요.");
                }
                else {
                    alert("이미 사용 중인 아이디입니다.");
                    $("#inputId").val(""); // 입력 필드를 공백으로 설정
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX 요청 실패:" + error);
            }
        });
    }
</script>
<button type="submit">회원가입</button>
<button onclick="location.href='signinform'">로그인</button>
</body>
</html>
