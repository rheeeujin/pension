<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function reser() {
		var pension_code = ${dao.psidx};
		window.open("rsv?pension_code="+${dao.psidx},'','width=899,height=1370');
	}
</script>
<style>
table {
	table-layout: fixed;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	padding: 0;
}

th {
	text-align: center;
}

.view_roomlist_all {
	width: 100%;
	margin: 10px 0;
	padding: 20px 0;
	font-size: 13px;
	letter-spacing: 0.2px;
	color: #666;
	padding-bottom: 5%;
	margin-bottom: 5%;
}

.view_roomlist_all h3 {
	font-size: 15px;
	background: url(images/bul_h3.gif) no-repeat 0 1px;
	padding-left: 17px;
}

.view_roomlist_all h3 span {
	color: #4675bb;
}

.view_roomlist_all td span.discount_fee {
	color: #E20000;
	font-weight: bold;
}

.inner {
	width: 1088px;
	margin: 0 auto;
	overflow: hidden;
}

.col {
	overflow: hidden
}

.col thead th:first-child {
	border-left: none;
}

.col table {
	border: 1px solid #dedede;
}

.col thead th {
	padding: 8px 0;
	height: 22px;
	border-left: 1px solid #dedede;
	border-bottom: 1px solid #dedede;
	background: #f2f2f2;
	color: #262626;
}

.col td {
	padding: 8px 20px;
	border-bottom: 1px solid #dedede;
	color: #626262;
	text-align: center;
	line-height: 150%;
}

.price-per {
	margin: 0; 
}
</style>
</head>
<body>
	<div class="view_roomlist_all">
		<div class="inner">
			<h3>
				<span>전체 객실 보기</span>
			</h3>
			<div class="col">
				<table id="roomInfoList">
					<colgroup>
						<col width="12%" />
						<col width="17%" />
						<col width="7%" />
						<col width="8%" />
						<col width="8%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="*" />
						<col width="9.5%" />
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2">객실명</th>
							<th rowspan="2">객실 형태(스타일)</th>
							<th rowspan="2">크기</th>
							<th rowspan="2">인원<br>(기준/최대)</th>
							<th colspan="4">요금안내</th>
							<th rowspan="2">추가요금</th>
							<th rowspan="2">예약하기</th>
						</tr>
						<tr>
							<th class="th">기간</th>
							<th class="th">주중</th>
							<th class="th">금요일</th>
							<th class="th">주말</th>
						</tr>
					</thead>
					<tbody class="amt">
						<c:forEach var="row" items="${room}">
							<tr>
								<td rowspan="2">${row.rmtitle}</td>
								<td rowspan="2">복층(침대룸+거실+주방+화장실)</td>
								<td rowspan="2">${row.rmsize}평</td>
								<td rowspan="2">${row.rmpermin}/${row.rmpermax}</td>
								<td><img src="images/off.gif" alt="비수기" /></td>
								<td>${row.chargeVos[0].week}원</td>
								<td>${row.chargeVos[0].fri}원</td>
								<td>${row.chargeVos[0].weekend}원</td>
								<td rowspan="2"><p class="price-per">인당 10,000원</p></td>
								<td rowspan="2">
									<input type="image" src="images/btn_reservation.gif" alt="예약하기" onclick="return reser()"/>
								</td>
							</tr>
							<tr>
								<td><img src="images/peak.gif" alt="성수기" /></td>
								<td>${row.chargeVos[1].week}원</td>
								<td>${row.chargeVos[1].fri}원</td>
								<td>${row.chargeVos[1].weekend}원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>