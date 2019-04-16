<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta  charset="UTF-8">

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
		if(frm.name.value == ''){
			alert("회원성명이 입력되지 않았습니다.")
			frm.name.focus();
			return false;
		}
		if(frm.pw.value == ''){
			alert("비밀번호가 입력되지 않았습니다.")
			frm.pw.focus();
			return false;
		}
		if(frm.address.value == ''){
			alert("주소지가 입력되지않았습니다.")
			frm.address.focus();
			return false;
		}
		if(frm.tel.value == ''){
			alert("연락처가 입력되지 않았습니다.")
			frm.tel.focus();
			return false;
		}
		
		
		
		
		
		alert("회원등록이 완료 되었습니다!");
	}
}
</script>
<style>
.join_step{margin:0 auto; width:675px; height:166px;}
		.join_on{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left; background-color:#6610f2 ;color:white;}
		.join_off{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left;}
		.join_step span{margin:50px; text-decoration:underline;}
		.join_step li{margin-right:20px}
         ul {list-style: none;}
		 ul li{text-align: center;} 
     	.main {margin:0 auto;width:500px; height: 500px;}
     	.main input{border-color:#6610f2}
        input {width:350px;margin-bottom:10px;}
     	.main table tr th{margin-left:20px}
     	.main table button{margin-left:65px; width:350px;background-color:#6610f2;color:white;}
     	.join_step span {font-family: fantasy;} 
</style>






</head>
<body>

<div class="wrap">
	    <jsp:include page="../header.jsp"></jsp:include>

			<h1 style="margin-top:20px" align="center">회원가입</h1>
			<ul class="join_step">
				<li class="join_off">
					<p><span>01</span>약관동의</p>
				</li>
				<li class="join_off">
					<p><span>02</span>회원유형</p>
				</li>
				<li class="join_on">
					<p><span>03</span>정보입력</p>
				</li>
				<li class="join_off">
					<p><span>04</span>가입완료</p>
				</li>
			</ul>


<section>


	<form method="post" name="frm" class="main">
	<input type="hidden" name="rating" value="0"> 
	<table>
	
		<tr>
			<th><span>이메일</span></th>
			<td><input type="text" name="email" value="${no}" placeholder="이메일을 입력하세요."></td>
		</tr>
		<tr>
			<th><span>비밀번호</span></th>
			<td><input type="password" name="pw" placeholder="4글자 이상의 비밀번호를 입력하세요."></td>
		</tr>
		<tr>
			<th><span>성명</span></th>
			<td><input type="text" name="name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
		<th><span>주소지</span></th>
			<td><input type="text" name="address" ></td>
		</tr>
		<tr>
		    <th><span>연락처</span></th>
			<td><input type="text" name="tel" placeholder="-를 빼고 입력"></td>
				</tr>
		<tr>
			<td colspan="2">
			<button><b>회원가입</b></button>
		</tr>
	</table>
	
	</form>
</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>