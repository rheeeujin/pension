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
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/pension.css">
	<link rel="stylesheet" href="css/index.css">
<script>
	window.onload = () =>{
		$(".first").show();
		$(".second").hide();
	}
	
	function Change(val) {
		if (val=="경기") {
			$(".first").show();
			$(".second").hide();
		} else if (val=="인천") {
			$(".first").hide();
			$(".second").show();
		}
	}
	$(()=>{
		$(".page-link").on("click",()=>{
			 location.href="full.do?mainsearch="+${mainsearch}+"&subsearch="+${subsearch};
		});
	})
</script>
</head>
<body>
<div class="wrap">
	<jsp:include page="../header.jsp"></jsp:include>
	<h5 id="formsearch1">경기도 추천 풀빌라펜션</h5>
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
	<form name="form" method="get" class="formsearch">
		<div>
			<h4>지역검색</h4>
			<hr id="hr">
			<select name="mainsearch" id="maincode" onchange="return Change(this.value);">
				<option value="경기">경기</option>
				<option value="인천">인천</option>
			</select>
			<select name="subsearch" id="subcode">
				<option value="전체">전체</option>
				<option value="가평" class="first">가평군</option>
				<option value="포천" class="first">포천시</option>
				<option value="옹진" class="second">옹진군</option>
			</select>
			<input type="submit" value="검색">
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
	<div class="row mt-5">
		<div class="col-md-12 text-center">
			<nav aria-label="Page navigation" class="text-center">
			<ul class="pagination">
				<c:if test="${page > 1}">
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${page=1}">&lt;&lt;</a></li>
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${fromPage-1}">&lt;</a></li>
				</c:if>
				<c:forEach begin="${fromPage}" end="${toPage}" step="1" var="i">
				<li class="page-item"><a class="page-link" href="full.do?search=${sear}&page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${page < allPage}">
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${toPage+1}">&gt;</a></li>
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${toPage=allPage}">&gt;&gt;</a></li>
				</c:if>
				<c:if test="${num==0}">
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${1}">&lt;</a></li>
				<li class="page-item"><a class="page-link" href="full.do?search=${sear}&page=${1}">1</a></li>
				<li class="page-item  active"><a class="page-link" href="full.do?search=${sear}&page=${1}">&gt;</a></li>
				</c:if>
			</ul>
			</nav>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>