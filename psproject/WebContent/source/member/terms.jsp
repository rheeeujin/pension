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
	<script>
	
	function chk(){
		var req = document.form.chk[0].checked;
		var num = 0;
		if(req== true){
			num = 1;
			 return true;
		}	
		if(num==1){
			document.form.submit();
		}else{
			alert("개인정보 약관에 동의하셔야 합니다.");
		}
		return false
	}
	window.onload = function() {
		document.form.onsubmit = chk;
	}
		
	

	
	
	</script>
	<style>
		.content{width:100%;height:700px; padding-top: 30px;}
		.join_step{margin:0 auto; width:675px; height:166px;}
		.join_on{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left; background-color:#6610f2 ;color:white;}
		.join_off{padding-top:10px; border:1px solid;border-radius:65px; width:126px ;height: 126px;float:left;}
		.join_step span{margin:50px; text-decoration:underline;}
		.terms_main{margin:0 auto;width:605px; height:500px;}
		.t_input{margin:0px auto 10px 300px;width:585px; }
		.join_step li{margin-right:20px}
		ul {list-style: none;}
		ul li{text-align: center;}
		.t_buttons{margin:0 auto; width:400px}
		 	.join_step span {font-family: fantasy;} 
	</style>
</head>
<body>
<div class="wrap">
	<jsp:include page="../header.jsp"></jsp:include>
	<div class=content>
		<h1 align="center">회원가입</h1>
		<ul class="join_step">
			<li class="join_on">
				<p><span>01</span>약관동의</p>
			</li>
			<li class="join_off">
				<p><span>02</span>회원유형</p>
			</li>
			<li class="join_off">
				<p><span>03</span>정보입력</p>
			</li>
			<li class="join_off">
				<p><span>04</span>가입완료</p>
			</li>
		</ul>
		<div class="terms_main">
			<h5>회원정보이용약관</h5>
			<textarea style="margin:20px 0px 20px 0px; width:570px;height:200px;overflow-y:atuo; "readonly="readonly">개인정보 처리목적

놀다가는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 것입니다.

1. 홈페이지 회원 가입 및 관리
회원 가입의사 확인, 서비스 부정이용 방지을 위한 기초자료 등을 목적으로 개인정보를 처리합니다.

2. 홍보메일 발송
세미나, 뉴스레터 등의 메일 발송의 목적을 위해 개인정보를 처리합니다

3. 개인정보 항목
(일반회원) 비밀번호, 이름, 이메일, 휴대전화,거주지
(기업회원) 비밀번호, 이름, 이메일, 휴대전화, 기업명, 기업위치, 대표자명, 설립연도, 대표연락처, 대표 이메일, 업종, 년도별 매출액, 인력현황, 자본금, 기업 홈페이지, 사업자 등록증

4. 보유 및 이용기간
놀다가는 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유·이용기간을 3년내에서 개인정보를 처리·보유합니다.

5. 동의거부 권리 및 불이익 내용
개인정보보호법 제 15조에 따라서 개인정보 수집에 동의를 거부할 수 있으며, 필수항목을 입력하지 않을 경우 회원가입 및 민원사무처리가 불가능합니다.
			</textarea>
			<form name="form" action="rating" >
				<div class="t_input"> 	
					<input type="radio" name="chk" >동의합니다
					<input type="radio" name="chk" >동의하지 않습니다
				</div>
				<div class="t_buttons">
					<button type="button" style="width:162px; height:50px; background-color:white; "><a href="login"><p style="color:black;"><b>취소</b></p></a></button>
					<button type="submit" style="width:162px; height:50px; background-color:#6610f2" ><p style=" color:white; "><b>확인</b></p></button>
				</div>
			</form>
		</div>
	</div>
</div>
    <jsp:include page="../footer.jsp"></jsp:include>
    
</body>
</html> 
      
      
