<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<title>NolDaGa &mdash; 놀다가</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="images/icon/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="fonts/jua/css/jua.css">
<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<!-- END header -->
		<section class="site-section pt-5 pb-5">
			<div class="subcontainer">
				<div class="row rollpic">
					<div class="col-md-12 rollpic">
						<div class="owl-carousel owl-theme home-slider">
							<div>
								<a href="spa.do" class="a-block d-flex align-items-center height-lg event phone1" style="background-image: url('images/spa.png');"> </a>
							</div>
							<div>
								<a href="work.do" class="a-block d-flex align-items-center height-lg event phone2" style="background-image: url('images/workshop.png');"> </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END section -->
		<section class="site-section py-sm">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 class="mb-4">추천펜션</h2>
					</div>
				</div>
				<div class="row blog-entries">
					<div class="col-md-12 col-lg-12 main-content">
						<div class="row">
							<c:forEach items="${list}" var="i" varStatus="stat">
								<c:if test="${stat.count<=9}">
									<div class="col-md-4">
										<a href="detail.do?psidx=${i.psidx}" class="blog-entry element-animate" data-animate-effect="fadeIn">
											<img src="${web_path}/${i.oridx}/thumb.jpg" alt="Image placeholder">
											<div class="blog-content-body">
												<div class="post-meta">
													<span class="mr-2">${i.pstitle}</span>
												</div>
												<h2 class="price">최저가 : ${i.lowPrice}원</h2>
											</div>
										</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- END main-content -->
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- END footer -->
	</div>
	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" />
		</svg>
	</div>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>