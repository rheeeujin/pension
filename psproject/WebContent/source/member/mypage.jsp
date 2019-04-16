<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html lang="ko">




<head>
<c:if test="${empty member}">
<script>
alert("세션정보가 만료되었습니다 다시로그린 진행해주세여");
		location.href="login";
</script>
</c:if>
<script>
window.onload = function(){
	var frm = document.frm;
	frm.onsubmit = function(){
		if(frm.address.value == ''){
			alert("주소가 입력되지않앗습니다.")
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
		
		if(frm.tel.value == ''){
			alert("연락처가 등록되지않았습니다.")
			frm.pw.focus();
			return false;
		}
		
		
		alert("변경완료");
	}
}
</script>



<style>

.mypage_main ul{list-style:none;  width: 200px; padding: 0px; }
.mypage_main{margin:0 auto ;width: 1200px; height: 500px; padding-top: 10px}

.mypage_main button {background-color:white; width: 200px; padding:0px;}
.user_img{width:200px;height:200px; border: 2px solid;}
.user_img img{width: 60%;
    margin: 20px;
    min-height: 117px;
    margin-left: 36px;
    margin-top:36px;
    }
  .menu_bar{width: 200px; height:313px; float: left; margin-right:150px;}
  .maypage_header{float: right; margin-top:20px; height: 60px; }
  .mypage_header td{width: 170px;height: 40px; }
.mypage_header table{margin:10px 10px 40px 10px;}
  .mypage_header td:nth-child(1){border:2px solid ; border-bottom: 0px; border-top:4px solid #6610f2; font-size: 20px}
   .mypage_header td:nth-child(2){border-bottom:2px solid;}
   .menu_bar h1{text-align: center;}
   .mypage_input table{border-collapse: separate; border-spacing: 0 10px;}
   .mypage_input input{width: 300px ;}
   .mypage_input button{margin-left:80px; width: 250px; }
   .menu_bar ul li:nth-child(1) button {color:#6610f2}
	
}
	
}}

</style>


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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="mypage_main">

<div class="menu_bar">
<h1>MY PAGE</h1>
 	<div class="user_img">
 	<img src="memberimg/userimg.png" alt="회원이미지">
 	</div>
	<ul>
		<li>
	   <button onclick="location='mypage'">정보수정 > </button>
		</li>

		<li>
		<a href="cart.do"><button>찜한목록 > </button></a>
		</li>
	
		<li>
		<button>예약정보 > </button>
		</li>
	
	</ul>
	</div>
	<div class="mypage_header">
	  <table>
      <tr>
    <td>&nbsp; 회원정보  수정</td>
    <td></td>
   
      
      </tr>
   </table>
   
   
	</div>
		<form method="post" name="frm">
	<div class ="mypage_input">
	<input type="hidden" name="email" value="${member.email}">
	<table>
	   
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw" value="${member.pw}"  placeholder="4글자 이상의 비밀번호를 입력하세요."></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" value="${member.name}" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
		<th>주소지</th>
			<td><input type="text" name="address" value="${member.address}" ></td>
		</tr>
		<tr>
		    <th>연락처</th>
			<td><input type="text" name="tel" value="${member.tel}"></td>
				</tr>
		
		
		<tr>
			<td colspan="2">
			<button ><b>정보 수정</b></button>
		</tr>
		<tr>
			<td colspan="3">
			<a href="resign"><button type="button"  onclick="return confirm('정말 탈퇴하시겠습니까?')"><b>회원 탈퇴</b></button></a>
		</tr>
		
	</table>
	
	</div>
	</form>
	</div>
    
	







<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>