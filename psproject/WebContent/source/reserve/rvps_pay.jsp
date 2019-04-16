<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${s_pension_nm} 결제창 - 놀다가</title>
<link href="css/reserve.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all" type="text/css" href="js/jquery-ui-1.11.4/jquery-ui.min.css" />
<script  src="js/jquery-1.6.2.min.js"></script>
<script  src="js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script  src="js/cash_help.js"></script>
<script  src="js/function.js"></script>
<script  src="js/move.js"></script>
<script>
//maxlength 체크
function maxLengthCheck(object){
  if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
  }
}
function staystep(){
	return;
}
//-----------------------------------------------------------------------------
// 숫자만 체크
//
// @return : true(맞는 형식) | false(잘못된 형식)
//-----------------------------------------------------------------------------
function NumberCheck(val){
	return (val.trim().match(/^[0-9]+$/)) ? true : false;
}

function Nextstep(){
// 	var Account="";

    if($("#nameId").val() === ""){
        alert("이름을 입력해 주십시요.");
        $("#nameId").focus();
        return;
    }

    var $oTotChk = $("input[name=chk]");
    var $oOnChk = $oTotChk.filter(":checked");

    if($oOnChk.length < $oTotChk.length){
        $oTotChk.each(function(idx, el){
            if(!$(this).is(":checked")){
                //alert( $("#wrapCheck label:eq("+idx+")").text() + " 하셔야 예약진행이 가능합니다" );
                alert("이용약관에 모두 동의하셔야 예약진행이 가능합니다.");
                $(this).focus();
                return false;
            };
        });
        return;
    };
	document.ReserveForm.submit();
}

function Pay_Account(Account){
	switch (Account)
	{

	case "Account" :
		document.getElementById("AccountStr").innerText="계좌이체";
		document.getElementById("tblB").style.display="none";
		document.getElementById("tblA").style.display="";
		document.getElementById("tblC").style.display="none";
		document.pay_Bank.card_code.selectedIndex=0;
		document.pay_Bank.sell_mm.selectedIndex=0;
		document.pay_Bank.rese_panm.value="";
		break;

	default			:
		document.getElementById("AccountStr").innerText="";

		document.getElementById("tblA").style.display="none";
		document.getElementById("tblC").style.display="none";
		document.pay_Bank.card_code.selectedIndex=0;
		document.pay_Bank.sell_mm.selectedIndex=0;
		document.pay_Bank.account_nm.value="";
		document.pay_Bank.cash_yn.selectedIndex=0;
		document.pay_Bank.cert_no.value="";
		document.pay_Bank.rese_panm.value="";
		break;
	}
	document.getElementById("A1Tr").style.display="none";
	use_woori_payment_select();
 }

function checkEmail(email) {
   var arrMatch = email.match(/^(\".*\"|[A-Za-z0-9_-]([A-Za-z0-9_-]|[\+\.])*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z0-9][A-Za-z0-9_-]*(\.[A-Za-z0-9][A-Za-z0-9_-]*)+)$/);
    if (arrMatch == null) {
      return false;
    }
     var arrIP = arrMatch[2].match(/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/);
    if (arrIP != null) {
          for (var i = 1; i <= 4; i++) {
                    if (arrIP[i] > 255) {
                         return false;
                    }
          }
    }
    return true;
}

/*
* 약관 텝 버튼 클릭 시
*/
function termsTabSelect(id) {

    var checkId         = id;
    var checkCnt        = 4;

    var tabObj = document.getElementById("tab_" + id);
    var tabDivObj = document.getElementById("tabDiv_" + id);

        for(var i = 1; i < 5; i++) {
            document.getElementById("tab_" + i).className = "";
            document.getElementById("tabDiv_" + i).style.display = "none";
        }
        tabObj.className = "tab_on";
        tabDivObj.style.display = "";
}

/*
* 약관 텝 버튼 클릭 시
*/
function termsCheck(id) {

    var checkId         = id;
    var termsChkObj     = document.getElementsByName("chk");    // 체크박스 Object
    var selectChkObj    = document.getElementById(checkId);     // 선택한 체크박스 Object
    var allChkObj       = document.getElementById("agreement"); // 전체동의 체크박스 Object
    var chkCnt          = 0;
    // 단일선택 / 전체선택
    if(checkId !== "agreement") {
        // 하나라도 체크 해제면, 전체선택 체크해제
        if(selectChkObj.checked === false) {
            allChkObj.checked = false;
        }else{
            // 모두 선택되어있으면 0 아니면 1
            for(var i = 0; i < termsChkObj.length; i++) {
                if(termsChkObj[i].checked === false) {
                    chkCnt = 1;
                }
            }
            // 모두 선택되어있을 경우 전체선택 버튼 체큰
            if(chkCnt === 0){
                allChkObj.checked = true;
            }
        }
    }else{
        // 모두선택 / 모두해제
        for(var i = 0; i < termsChkObj.length; i++) {
            termsChkObj[i].checked = allChkObj.checked;
        }
    }
}
//-->
</script>
</head>
<body>	
<br>
<form name="ReserveForm" method="post" action="rvPay" >

	<!--예약정보 시작-->
	<h1 class="reserve_header">
	    <span>${s_pension_nm} 예약</span><br>
	    <span class="reserve_subTit">예약 및 결제정보 입력</span>
	</h1>
	<div class="cont_section">
	    <h2 class="reserve_infoTit">펜션 예약 정보</h2>
	    <!-- 예약정보 : 객실 및 날짜 정보  -->
	    <table class="reservation_pension pInfo_table" cellpadding="5px" cellspacing="0">
	        <colgroup>
	            <col width="25%">
	            <col width="25%">
	            <col width="25%">
	            <col width="25%">
	        </colgroup>
	        <thead>
	            <tr>
	                <th width="25%">객실명</th>
	                <th width="25%">이용일자</th>
	                <th width="25%">이용기간</th>
	                <th width="25%">인원</th>
	            </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${s_ls_rdtvo}" var="i" >
	            <input type="hidden" name="rs_baseamt" value="${i.baseamt}">
	            <input type="hidden" name="rs_night" value="${i.night}">
	            <input type="hidden" name="rs_perscnt" value="${i.perscnt}">
	            <input type="hidden" name="rs_status" value="${i.status}">
	            <input type="hidden" name="rs_sdate" value="${i.sdate}">
	            <input type="hidden" name="rs_psidx" value="${i.psidx}">
	            <input type="hidden" name="rs_rmidx" value="${i.rmidx}">
	            <tr>
		            <td>${i.rmnm}</td>
	                <td>${i.sdate}</td>
	                <td>${i.night}일</td>
	                <td>${i.perscnt}명</td>
	                <c:set var="sumfee" value="${sumfee +((i.baseamt)*(i.night)*(i.perscnt))}"></c:set>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
	<!--예약정보 끝-->
	    <!--요금상세정보 시작-->
	    <table class="reservation_pension detail_price_table" cellpadding="5px" cellspacing="0">
	        <thead>
	            <tr>
	                <th>기본요금</th>
	                <th class="line_left">추가요금합계</th>
	           
	                <th class="line_left">총결제금액</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>${sumfee}원</td>
	                <td class="line_left"><img src="reserve_img/icon_plus.gif" class="ico_plus" alt="plus icon" />0원</td>
	                
	                <td class="line_left"><img src="reserve_img/icon_equals_sign.gif" class="ico_equal" alt="equal icon" />${sumfee}<span class="bold_red" id="total_price"></span>
	                <input type="hidden" name="rs_sumfee" value="${sumfee}">
	            </tr>
	        </tbody>
	    </table>
	</div>

	<div id="contentLayer">
		<div class="cont_section">
		    <input type="hidden" name="rs_mem_email" value="${member.email}">
	        <table class="reservationE custoInfo_table">
	            <colgroup>
	                <col width="20%">
	                <col width="80%">
	            </colgroup>
	            <tbody>
	                <tr class="line_bottom">
	                    <th class="ico_point">예약자 이름</th>
	                    <td>
	                        <input type="text" name="nameId" id="nameId" value="${member.name }" class="ipt_middle ipt_sname">
	                    </td>
	                </tr>
	                <tr class="line_bottom">
	                    <th class="ico_point">휴대폰 번호</th>
	                    <td>
	                        <input type="text" name="tel" id="tel" value="${member.tel}" class="ipt_middle ipt_sname">
	                    
	                    </td>
	                </tr>
	                <tr class="line_bottom">
	                    <th><span>이메일</span></th>
	                    <td colspan="3"><input type="text" class="ipt_large" name="pers_mail" size="25" maxlength="50" value="${member.email }"><span class="red_text">*예약 및 결제 관련 내역을 메일로 받으실 수 있습니다.</span></td>
	                </tr>
	                <tr class="line_bottom">
	                </tr>         
	                <tr>
	                    <th><span>요청사항</span></th>
	                    <td>
	                        <textarea class="rese_requ" name="rese_requ" wrap="hard"></textarea>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	
		<!-- 결제방식 선택 영역 -->
		<div id="bottomLayer" >
		<div class="cont_section">
		    <!-- 결제방식(선택) -->
		    <h2 class="reserve_infoTit">결제방식 선택</h2>
		    <div class="pay_method">
		        <ul>
		            <li><input type="radio" name="AccountType" value="Account" onClick='JavaScript:Pay_Account(this.value);' class="ipt_radio"><label for="">계좌이체</label></li>
		        </ul>
		    </div>
		    <!--// 결제방식 (선택) -->
		    <!-- 결제방식(결과) -->
		    <table class="pay_method_result">
		        <colgroup>
		            <col width="50%">
		            <col width="50%">
		        </colgroup>
		        <thead>
		            <tr>
		                <th>결제방법</th>
		                <th>결제금액</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td><span id="AccountStr">결제방식을 선택하세요.</span></td>
		                <td><span id="PaymentStr">${sumfee}원</span></td>
		            </tr>
		            <tr id="A1Tr" style="display:none;">
		              <td align="center" class="cn_5"><font color="#3366FF">(-)<span id="A1Str"></span>${sumfee}원</font></td>
		            </tr>
		        </tbody>
		    </table>
		    <!--//  결제방식(결과) -->
		</div>
		</div>
	</div>
</form>
	
	<!-- 이용약관 영역 -->
	<div class="cont_section">
	  <!-- 이용약관 내용-->
	  <div class="seciton_license">
	      <h2 class="reserve_infoTit">이용약관</h2>
	      <div class="license_list">
	          <ul>
	              <li class="tab_on" id="tab_1" onclick="javscript:termsTabSelect('1');">
	                  <input type="checkbox" name="chk" value="chk1" id="chk1" onclick="javscirpt:termsCheck(this.id);">
	                  <label for="">취소 수수료 및 이용 약관</label>
	              </li>
	              <li class="" id="tab_2" onclick="javscript:termsTabSelect('2');">
	                  <input type="checkbox" name="chk" value="chk2" id="chk2" onclick="javscirpt:termsCheck(this.id);">
	                  <label for="">개인정보 수집 및 이용</label>
	              </li>
	              <li class="" id="tab_3" onclick="javscript:termsTabSelect('3');">
	                  <input type="checkbox" name="chk" value="chk3" id="chk3" onclick="javscirpt:termsCheck(this.id);">
	                  <label for="">개인정보 제 3자(펜션) 제공</label>
	              </li>
	              <li class="" id="tab_4" onclick="javscript:termsTabSelect('4');">
	                  <input type="checkbox" name="chk" value="chk4" id="chk4" onclick="javscirpt:termsCheck(this.id);">
	                  <label for="">미성년자 아님</label>
	              </li>
	          </ul>
	      </div>
	
	      <!-- 취소 수수료 및 이용 약관 -->
	      <div id="tabDiv_1" class="license_decs">
	      	<!-- 취소 수수료 테이블 -->
	          <table class="cancel_table">
	          		<colgroup>
	          			<col width="14%">
	          			<col width="16%">
	          			<col width="14%">
	          			<col width="14%">
	          			<col width="14%">
	          			<col width="14%">
	          			<col width="14%">
	          		</colgroup>
	          		<thead>
	          			<tr>
	          				<th class="first">입실일 8일전 취소</th>
	          				<th>입실일 5~7일전 취소</th>
	          				<th>입실일 4일전 취소</th>
	          				<th>입실일 3일전 취소</th>
	          				<th>입실일 2일전 취소</th>
	          				<th>입실일 1일전 취소</th>
	          				<th>입실일 당일 취소</th>
	          			</tr>
	          		</thead>
	          		<tbody>
	          			<tr>
	          				<td class="first">전액환불</td>
	          				<td>전체금액의 10%</td>
	          				<td>전체금액의 20%</td>
	          				<td>전체금액의 30%</td>
	          				<td>전체금액의 50%</td>
	          				<td>전체금액의 70%</td>
	          				<td>전액환불 불가</td>
	          			</tr>
	          		</tbody>
	          </table>
	          <!--// 취소 수수료 테이블 -->
	
	          <ul>
	              <li>- 예약 당일 취소 시에도 이용일 기준으로 취소 수수료가 적용됩니다.</li>
	              <li>- 취소 수수료는 예약 시 결제한 전체 객실금액에 대해 적용됩니다.</li>
	              <li>- 이용일 당일 예약 후 당일 취소한 경우, 당일 취소에 해당되며 환불이 불가합니다.</li>
	              <li>- 우리펜션을 통해 판매되는 객실 예약현황은 실제 현황과 99% 일치합니다. 하지만 실시간 예약 특성상 100% 일치하지는 않습니다.</li>
	              <li>- 때문에 중복 예약이 될 가능성은 존재하며, 이 경우 먼저 결제된 예약건에 우선권이 있습니다.</li>
	              <li>- 중복 예약에 대해 우리펜션과 우리펜션의 가맹 펜션은 어떠한 책임도 지지 않으므로, 예약 후 꼭 펜션과 통화하시길 권장합니다. 펜션 연락처는 예약 완료 시 문자로 보내드립니다.</li>
	              <li>- 우리펜션은 예약 중계 시스템만 운영하며, 펜션 입실 후 현장에서 일어난 일에 대해 일체의 책임을 지지 않습니다.</li>
	              <li>- 기준 인원에서 인원 추가 시 1인당 추가 요금이 있습니다. (유아: 24개월 미만, 소아: 24개월 이상~미취학아동)</li>
	              <li><font color="red">- 취소수수료의 경우 포인트로 결제가 불가하며, 현금으로만 수수료 결제가 가능합니다.</font></li>
	          </ul>
	      </div>
	
	      <!-- 개인정보 수집 및 이용 -->
	      <div id="tabDiv_2" class="license_decs" style="display:none">
	          <ul>
	              <li>- 개인정보 이용 목적: 청약 및 거래 이행, 대금결제 서비스 제공, 해피콜, 고객상담, 민원 처리</li>
	              <li>- 수집하는 개인정보 항목: 이름, 휴대전화번호, 이메일, 생년월일, 예약 및 결제 정보, 신용카드 정보, 은행명, 입금자명, 접속IP, 결제기록</li>
	              <li>- 개인정보의 보유기간 및 이용기간: 개인정보 수집 목적이 달성된 후 지체없이 파기. 단, 관계법령의 규정에 의해 보존할 필요가 있을 경우 관계법령에서 정한 기간 동안 보관</li>
	                  <li>1. 보존 항목: 접속 로그, 결제 기록</li>
	                  <li>2. 보존 근거: 전자상거래 등에서의 소비자 보호에 관한 법률</li>
	                  <li>3. 계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)</li>
	                  <li>4. 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)</li>
	                  <li>5. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래 등에서의 소비자 보호에 관한 법률)</li>
	          </ul>
	      </div>
	      <!-- 개인정보 제 3자 제공 -->
	      <div id="tabDiv_3" class="license_decs" style="display:none">
	        <p>
	        우리펜션(이하 "회사"라 함)이 제공하는 서비스를 통하여 이용자간 거래 관계가 이루어진 경우 펜션 이용을 위하여 관련한 정보는 필요한 범위 내에서 펜션주에게 아래와 같이 제공됩니다.
	        </p>
	        <ul>
	            <li>- 개인정보 제공받는 자: 양평 본 펜션</li>
	            <li>- 개인정보 이용 목적: 해피콜, 구매자 확인, 미성년 여부 확인, 고객 상담 및 안내 목적</li>
	            <li>- 개인정보 제공 항목: 이름, 휴대전화번호, 주문정보</li>
	            <li>- 개인정보 보유 및 이용 기간: 개인정보 제공 목적 달성 후 지체 없이 파기 (단, 관계법령의 규정에 의해 보존할 필요가 있을 경우 관계법령에서 정한 기간 동안 보관)
	        </ul>
	      </div>
	      <!-- 미성년자 아님 -->
	      <div id="tabDiv_4" class="license_decs" style="display:none">
	          <ul>
	              <li>- 청소년보호법은 만 19세 미만의 남녀혼숙에 대해 금지하고 있습니다.</li>
	              <li>- 보호자가 동반하지 않는 미성년자는 펜션 입실이 불가능합니다.</li>
	              <li>- 예약 후 미성년자임이 확인될 경우, 펜션에서 보호자의 동의 각서를 요구하거나 펜션 입실을 거부할 수 있습니다.</li>
	          </ul>
	      </div>
	  </div>
	  <!--// 이용약관 내용-->
	</div>
	<!--// 이용약관 영역 -->
	<!-- 하단 버튼영역 -->
	<div class="agree_wrap">
	    <input type="checkbox" name="" id="agreement" onclick="javascirpt:termsCheck(this.id);"><label for="agreement">약관에 모두 동의</label>
	</div>
	<div class="btn_wrap" id="reserve_agree_button">
	    <a href="javascript:Nextstep();" class="btn btn_com btn_next">결제</a> 
	  <!--   <a href="rvinsRst" class="btn btn_com btn_next">결제</a> -->
	</div>
</body>
</html>
