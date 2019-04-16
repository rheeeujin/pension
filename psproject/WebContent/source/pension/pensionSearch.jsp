<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="css/pensionsearch.css">
	<link rel="stylesheet" href="css/index.css">
	<script>
		$(()=>{
			
		})
	</script>
</head>
<body>
<div class="wrap">
<jsp:include page="../header.jsp"></jsp:include>
	<section class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 id="formsearch1">${title} 검색 결과</h2>
				<br>
				<h4>총 ${num}개의 펜션이 있습니다.</h4>
				<hr id="hr">
			</div>
		</div>
		<div class="row blog-entries">
			<div class="col-md-12 col-lg-12 main-content">
				<div class="row">
					<c:forEach var="i" items="${search}">
						<div class="grid col-md-3">
							<figure class="effect-marley">
								<img src="${path}/${i.oridx}/thumb.jpg" alt="이미지안나옴 ㅋㅋㅋ">
								<div class="blog-content-body">
									<figcaption class="post-meta">
										<h5><span>${i.pstitle}</span></h5>
										<p>${i.preaddr}<br><span class="price">최저가 : ${i.lowPrice}원</span></p>
										<a href="detail.do?psidx=${i.psidx}">View more</a>
									</figcaption>
								</div>
							</figure>
						</div>
					</c:forEach>
					<c:if test="${num==0}">
						<div class="grid col-md-12">
							<div class="tbox">
								<h2><span class="tcolor">[${title}]</span>에 대한 <span class="tcolor">검색결과</span>가 없습니다.</h2>
								<p>다시 한 번 확인하시고 검색하여 주십시오.</p>
							</div>
						</div>
					</c:if>
					<c:if test="${page.currPage > page.pageCnt || page.currPage < 1}">
						<div class="grid col-md-12">
							<div class="tbox">
								<h2><span class="tcolor">페이지</span>에 대한 <span class="tcolor">검색범위</span>가 유효하지 않습니다.</h2>
								<p>다시 한 번 확인하시고 검색하여 주십시오.</p>
							</div>
						</div>
					</c:if>
				</div>
				<div class="row mt-5">
                	<div class="col-md-12 text-center">
                		<nav aria-label="Page navigation" class="text-center">
                		${page }
                			<ul class="pagination">
                			<c:if test="${page.firstRange}">
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${page.fromPage - 1}">&lt;&lt;</a></li>
               				</c:if>
               				<c:if test="${page.currPage > 1}">
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${page.currPage - 1}">&lt;</a></li>
                			</c:if>
                			
                			<c:forEach begin="${page.fromPage}" end="${page.toPage}" step="1" var="i">
		        				<li class="page-item"><a class="page-link ${i == page.currPage ? 'is-curr-page' : ''}" href="search?search=${title}&page=${i}">${i}</a></li>
                			</c:forEach>
                			
                			
                			<c:if test="${page.currPage < page.pageCnt}">
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${page.currPage + 1}">&gt;</a></li>
                			</c:if>
                			<c:if test="${page.lastRange}">
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${page.toPage + 1}">&gt;&gt;</a></li>
               				</c:if>
               				<%--
							<c:if test="${num==0}">
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${1}">&lt;</a></li>
                				<li class="page-item"><a class="page-link" href="search?search=${title}&page=${1}">1</a></li>
                				<li class="page-item  active"><a class="page-link" href="search?search=${title}&page=${1}">&gt;</a></li>
                			</c:if> --%>
                			</ul>
                		</nav>
                	</div>
            	</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>