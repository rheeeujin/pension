<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>NolDaGa &mdash; 놀다가</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/search.css">
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="fonts/jua/css/jua.css">
    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/index.css">
      <link rel="stylesheet" href="fonts/jua/css/jua.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script>
window.onload = function(){
	var frm = document.frm;
	frm.onsubmit = function(){
		if(frm.email.value == ''){
			alert("이메일이 입력되지 않았습니다.")
			frm.email.focus();
			return false;
		}
		if(frm.pw.value == ''){
			alert("비밀번호가 입력되지 않았습니다.")
			frm.pw.focus();
			return false;
		}
	}
}
</script>
<c:if test="${param.massage=='fail'}">
	<script>
		alert("로그인에 실패했습니다")
		location.href="login";
	</script>

	
</c:if>
<style>
.login_main{ width: 100%; height: 500px}
.login_main input{border-color:#6610f2;width: 500px; height:45px;margin-bottom: 10px}
.login_main button {width: 500px; height:70px; background-color: #6610f2 ;color:white;}
.login_main button b{margin:0 auto; width: 200px}
.login_table{margin:0 auto; }
.login_main p{color: #6610f2 ;text-align:center; font-size:70px}
.login_button{ font-size:20px}

</style>
</head>
<body>
  <jsp:include page="../header.jsp"></jsp:include>
<div id="wrapper">
	<section>
        <div class="login_main">	
		<form method="post" name="frm">
	    <p> NolDaGa </p>
		<table class="login_table">
			<tr>
				<td><input type="text" name="email" placeholder="이메일을 입력하세요." autofocus="autofocus"></td>
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder="4글자 이상의 비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td>
				<button class="login_button"><b>Log-in</b></button>
				</td>
			</tr>
			
		</table>

		</form>
    </div>
	</section>
</div>
  <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>