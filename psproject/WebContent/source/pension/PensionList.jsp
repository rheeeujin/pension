<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NolDaGa &mdash; 놀다가</title>
	<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/search.css">
	<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="fonts/jua/css/jua.css">
	<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="fonts/jua/css/jua.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/pension.css">
	<link rel="stylesheet" href="css/index.css">
</head>
<script>
	$(()=>{
		$(".page-link").on("click",()=>{
			 location.href="list.do?search="+${sear};
		})
	})
</script>
<body>
<div class="wrap">
	<jsp:include page="../header.jsp"></jsp:include>
	<!--	검색
	 <form name="form1" method="post" action="list.do" class="formsearch">
		<input name="search" type="text" class="Search">
		<button class="btnSearch" type="submit">검색</button>
	</form> -->
	<h5 id="formsearch1">경기도 전체 추천펜션</h5>
	<hr id="hr">
	<c:forEach var="row" items="${list}">
		<div class="grid">
			<figure class="effect-marley">
				<img src="http://noldaga.shop/psproject/pension_img/${row.oridx}/thumb.jpg" alt="이미지안나옴 ㅋㅋㅋ">
				<figcaption>
					<h5><span>${row.pstitle}</span></h5>
					<p>${row.preaddr}</p>
					<a href="detail.do?psidx=${row.psidx}">View more</a>
				</figcaption>
			</figure>
		</div>
	</c:forEach>
	<form name="form1" method="get" action="list.do" class="formsearch">
		<div>
			<h4>지역검색</h4>
			<hr id="hr">
			<select>
				<option value="경기">경기</option>
			</select> 
			<select name="search">
				<option value="가평" >가평군</option>
				<option> 춘천</option>
           		<option>강화도</option>
           		<option>광주시</option>
           		<option>남양주시</option>
           		<option>대부도</option>
           		<option>안성시</option>
           		<option>양평군</option>
           		<option>포천시</option>
           		<option>용인시</option>
           		<option>고양시</option>
           		<option>파주시</option>
           		<option>선재도</option>
           		<option>여주시</option>
           		<option>영흥도</option>
           		<option>이천시</option>
           		<option>을왕리</option>
           		<option>연천군</option>
           		<option>양주시</option>
           		<option>안양시</option>
           		<option>안산시</option>
           		<option>웅진군</option>
           		<option>화성시(제부도)</option>
			</select> 
			<input name="search" type="submit" value="검색">
		</div>
	</form>
	<hr id="hr">
	<c:forEach var="row" items="${search}">
		<div class="grid">
			<figure class="effect-marley">
				<img src="http://noldaga.shop/psproject/pension_img/${row.oridx}/thumb.jpg" alt="이미지안나옴 ㅋㅋㅋ">
				<figcaption>
					<h5><span>${row.pstitle}</span></h5>
					<p>${row.preaddr}</p>
					<a href="detail.do?psidx=${row.psidx}">View more</a>
				</figcaption>
			</figure>
		</div>
	</c:forEach>
	<c:if test="${num==0}">
		<div class="grid col-md-12 nosearch">
			<div class="tbox">
				<h2><span class="tcolor">[${sear}]</span>에 대한 <span class="tcolor">결과</span>가 없습니다.</h2>
			</div>
		</div>
	</c:if>
	<div class="row mt-5">
		<div class="col-md-12 text-center">
			<nav aria-label="Page navigation" class="text-center">
			<ul class="pagination">
				<c:if test="${page > 1}">
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${page=1}">&lt;&lt;</a></li>
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${fromPage-1}">&lt;</a></li>
				</c:if>
				<c:forEach begin="${fromPage}" end="${toPage}" step="1" var="i">
					<li class="page-item"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${page < allPage}">
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${toPage+1}">&gt;</a></li>
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${page=allPage}">&gt;&gt;</a></li>
				</c:if>
				<c:if test="${num==0}">
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${1}">&lt;</a></li>
					<li class="page-item"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${1}">1</a></li>
					<li class="page-item  active"><a class="page-link" href="list.do?search=${sear}&search=검색&page=${1}">&gt;</a></li>
				</c:if>
			</ul>
			</nav>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>