<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
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
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>회원가입</h1>
    <form name="signup" method="post" action="signup">
        <div class="row">
            <div class="col">
                <input type="text" id="inputId" class="form-control" placeholder="아이디" name="userId" required/>
            </div>
            <div class="col-auto">
                <button onclick="checkId()" class="btn btn-secondary">아이디 확인</button>
            </div>
        </div>
        <br>
        <input type="text" class="form-control" placeholder="이름" name="userName" required/>
        <br>
        <input type="password" class="form-control" placeholder="비밀번호" name="userPw" required/>
        <br>
        <input type="password" class="form-control" placeholder="비밀번호확인" name="userPw" required/>
        <br>
        <button type="submit" class="btn btn-primary">회원가입</button>
        <button onclick="location.href='signinform'" class="btn btn-secondary">로그인</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    function checkId() {
        var inputIdValue = $("#inputId").val();
        var test = {userId: inputIdValue}
        $.ajax({
            type: "POST",
            url: "/checkId",
            data: test,
            success: response => {
                alert(response)
                alert(inputIdValue)
                if (response === 0) {
                    alert("사용 가능한 아이디입니다.");
                } else if (inputIdValue === null || inputIdValue === "") {
                    alert("아이디를 입력해주세요.");
                }else {
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
</body>
</html>
