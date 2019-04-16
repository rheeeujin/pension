<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${dao.pstitle}</title>
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700"
	rel="stylesheet">
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
<link rel="stylesheet" href="css/pension.css">
<link rel="stylesheet" href="css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<script src="js/pension.js">
	
</script>

</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="wrap">

		<div class="pensioninfo">

			<p>
				<img
					src="http://noldaga.shop/psproject/pension_img/${dao.oridx}/thumb.jpg"
					width="500px" height="350px">
			</p>


			<ul class="psinfo">
				<li><h3>${dao.pstitle}</h3></li>


				<li>상세주소:&nbsp; 신주소${dao.preaddr} <br> 구주소:&nbsp;
					${dao.curaddr}
				<li>입실시간 : 14시 이후 퇴실시간 : 11시 이전</li>

				<li>픽업: &nbsp; ${dao.pickup}</li>

				<li>예약문의: &nbsp; ${dao.calltel}</li>

			</ul>

			<!-- 장바구니 담기 기능 -->
			<c:if test="${member!=null}">
			<div class="info2">
				<form name="form1" method="get" 
					action="insert.do">
					<input type="hidden" name="psidx" value="${dao.psidx}"> <input
						type="button" value="예약현황"> <input type="button"
						value="예약하기"> <input type="submit" value="장바구니 담기">
				</form>
			</div>
		</c:if>
		</div>
		
						

		<div class="con_tab_area">
			<ul class="cont_tab">
				<li><a href="?psidx=${param.psidx}&pension=room">객실안내 </a></li>
				<li><a href="?psidx=${param.psidx}&pension=info">펜션정보</a></li>
				<li><a href="?psidx=${param.psidx}&pension=map">찾아오는 길</a></li>
				<li><a href="?psidx=${param.psidx}&pension=review">이용후기</a></li>
				<li><a href="?psidx=${param.psidx}&pension=cancel">이용 및
						취소안내</a></li>
			</ul>
		</div>

		<c:choose>
			<c:when
				test="${param.pension == 'room' || empty param.pension || param.pension == 'roomlist'}">
				<div class="roomlist">

					<ul>
						<c:forEach var="row" items="${room}">
							<li><a
								href="?psidx=${param.psidx}&pension=roomlist&rmidx=${row.rmidx}">${row.rmtitle}</a></li>
						</c:forEach>
					</ul>
				</div>


				<div class="body1">

					<div>
						<div class="roomin">
							<ul class="roominimg2">
								<c:forEach var="row" items="${room}">

									<c:forEach var="img" items="${row.roomimgVos}" varStatus="stat">
										<c:if test="${rmIdx == img.rmidx}">

											<li><img ${stat.index != 0 ? "style='display:none'" : "" }
												src="http://noldaga.shop/psproject/pension_img/${dao.oridx}/${img.rmidx}/main/${img.rmimginurl}"
												alt="이미지안나옴 ㅋㅋㅋ" data-order="${stat.index}"></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul>
						</div>

					
						<div class="roominimg-wrapper">
							<ul class="roominimg">
								<c:forEach var="row" items="${room}">
									<c:forEach var="img" items="${row.roomimgVos}" varStatus="stat">
										<c:if test="${rmIdx == img.rmidx}">
											<li><a href="javascript:void(0)"><img
													src="http://noldaga.shop/psproject/pension_img/${dao.oridx}/${img.rmidx}/thumb/${img.rmimginurl}"
													alt="이미지안나옴 ㅋㅋㅋ" data-order="${stat.index}"></a></li>

										</c:if>
									</c:forEach>
								</c:forEach>

							</ul>
						</div>

					</div>

					<div >

						<ul>
						<c:forEach var="row" items="${room}">
							<c:if test="${row.rmidx==param.rmidx}">
							<li >${row.rmtitle}</li>
							</c:if>
						</c:forEach>
						
						</ul>

					</div>

				</div>
			</c:when>
			<%-- @author 최보송
				@since 19.03.31
				@카카오 지도 삽입
				--%>

			<c:when test="${param.pension == 'map'}">
			<jsp:include page="map.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.pension == 'review'}">
				<h1>이용후기</h1>
			<jsp:include page="review.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.pension == 'cancel'}">
				<jsp:include page="Pensioncancel.jsp"></jsp:include>
			</c:when>
		</c:choose>
		<jsp:include page="pensionPrice.jsp"></jsp:include>

	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>