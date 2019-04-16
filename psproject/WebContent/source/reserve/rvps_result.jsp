<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결과창</title>
<link href="css/reserve.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all" type="text/css" href="js/jquery-ui-1.11.4/jquery-ui.min.css" />
<script  src="js/jquery-1.6.2.min.js"></script>
<script  src="js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script  src="js/cash_help.js"></script>
<script  src="js/function.js"></script>
<script  src="js/move.js"></script>
<script type="text/javascript">  
    function go_mypage(){
        if(confirm("마이페이지로 이동하시겠습니까?")){
		  try{
            var url = $(opener.window.location).attr("pathname");
            var params = window.location.search.substring(1);
            var retURL = url+"?"+params;

            $(opener.window.location).attr("href","mypage");
            self.close();
            return;
		  } catch(e){
			location.href = "index";
			return;
		  }
        };
        self.close();
        alert("완료");
        return;
    }
</script>  
</head>
<body>
      <br>
			<form name="Pension" method="get">
			<input type="hidden" name="pension_code" value=""> <!-- 펜션 코드 -->
			<input type="hidden" name="goMonth" value="">
			<input type="hidden" name="rsrm_date" value=""> <!-- 예약 날짜 -->
			<input type="hidden" name="room_code" value="">
			</form>
</head>
<body>
    <h1 class="reserve_header">
        <span>${ls_rv_rsult[0].pstitle}</span><br>
        <span class="reserve_subTit">예약이 완료되었습니다.</span>
    </h1>
    <div class="cont_section">

        <!-- 예약정보 : 객실 및 날짜 정보  -->
        <table class="reservation_result pInfo2_table" cellpadding="5px" cellspacing="0">
            <colgroup>
                <col width="25%">
                <col width="25%">
                <col width="25%">
                <col width="25%">
            </colgroup>
            <thead>
                
                <tr>
                    <th col width="%">객실명</th>
                    <th col width="25%">시작날짜</th>
                    <th col width="25%">이용기간</th>
                    <th col width="25%">인원</th>
                </tr>
            </thead>
            <tbody>         
        <c:forEach items="${ls_rv_rsult}" var="i">
            <tr>
                <td>${i.rmtitle}</td> <!-- 방이름 -->
                <td>${i.sdate}</td> <!-- 예약 날짜 -->
                <td>${i.night}박</td> <!-- 박수 -->
                <td>${i.perscnt}명 </td> <!-- 인원수 -->
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    <!-- 예약정보 : 요금상세정보 -->
    <table class="reservation_result detailPrice_table dp_table2" cellpadding="5px" cellspacing="0">
        <colgroup>
            <col width="33%">
            <col width="33%">
            <col width="33%">
        </colgroup>
        <thead>
            <tr>
                <th class="">기본요금</th>
                <th class="line_left">추가요금합계</th>
                <th class="line_left">총결제금액</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tit_bg">
                    <span>${ls_rv_rsult[0].totmoney}원</span>
                </td>
                <td class="line_left tit_bg">
                    <img src="reserve_img/icon_plus.gif" class="ico ico_plus" alt="plus icon" />
                    <span>0원</span>
                </td>
                <td class="line_left tit_bg">
                    <img src="reserve_img/icon_equals_sign.gif" class="ico ico_equal" alt="equal icon" />
                    <span class="bold_red">${ls_rv_rsult[0].totmoney}원</span>
                </td>
            </tr>
    </table>
	<div class="cont_section">
        <table class="reservation">
            <colgroup>
                <col width="30%">
                <col width="*%">
            </colgroup>
            <tbody>
                <tr>
                    <th>결제방법</th>
                    <td>계좌이체</td>
                </tr>
                <tr>
                    <th>입금금액</th>
                    <td>${ls_rv_rsult[0].totmoney}원</td>
                </tr>            
                <tr class="rec_view">
                    <th>영수증 보기</th>
                    <td><a href="#" onclick="alert('준비중입니다.'); return false;"><img src="reserve_img/Script.gif" style="width: 16px; height: 16px;"></a></td>
                </tr>
            </tbody>
        </table>
        </div>
        <!-- 하단 버튼영역 -->
    	<div class="reserve_agree">
    		<a href="JavaScript:go_mypage();" class="btn btn_com btn_confirm">확인</a>
    	</div>
        </form>
</body>
</html>
