<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
  <head>
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
    <style>
		.nomal_member{magin:0 auto; border:1px solid; width:480px; height:144px;padding:10px 0px 40px 20px ; float:left;  border-color: #6610f2 #666 #666 #666;border-top: 2px solid #6610f2;}
		.buisness_member{magin:0 auto;  border:1px solid;width:480px; height:144px; padding:10px 0px 40px 20px;float:left; border-color: #C71585 #666 #666 #666;border-left: 0px ;border-top: 2px solid #C71585;} 
		.join_choice{width:960px;margin:0 auto;height:166px; }
		.nomal_member button {width: 130px; HEIGHT: 30pt; background:#6610f2;color:white; border-radius:30px;}
		.buisness_member button {width: 130px; HEIGHT: 30pt; background:#C71585;color:white;border-radius:30px;}
		.content{width:100%;height:700px; padding-top: 30px;}
		.join_step{margin:0 auto; width:675px; height:166px;}
		.join_on{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left; background-color:#6610f2 ;color:white;}
		.join_off{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left;}
		.join_step span{margin:50px; text-decoration:underline;}
		.join_step li{margin-right:20px}
		ul {list-style: none;}
		ul li{text-align: center;} 
		 	.join_step span {font-family: fantasy;} 
		 .buisness_member p {float:left;margin-right: 75px}
		 .nomal_member p {float:left;margin-right: 70px}
	</style>
  </head>
  <body>
	<div class="wrap">
	    <jsp:include page="../header.jsp"></jsp:include>
		<div class=content>
			<h1 align="center">회원가입</h1>
			<ul class="join_step">
				<li class="join_off">
					<p><span>01</span>약관동의</p>
				</li>
				<li class="join_on">
					<p><span>02</span>회원유형</p>
				</li>
				<li class="join_off">
					<p><span>03</span>정보입력</p>
				</li>
				<li class="join_off">
					<p><span>04</span>가입완료</p>
				</li>
			</ul>
			<div class="join_choice">
				<div class="nomal_member">
				  	<h3>일반회원 가입 </h3>
				  	<p >개인가입을 원하시면 선택해주세요.</p>
				  	<button type="button" onclick="location='join'">가입하기</button>   
				</div>
				<div class="buisness_member">
				 	<h3>기업회원 가입 </h3>
				 	<p>기업가입을 원하시면 선택해주세요.</p>
					<button type="button" onclick="location='join2'">가입하기</button>
				</div>
			</div>
		</div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>>
</body>
</html> 