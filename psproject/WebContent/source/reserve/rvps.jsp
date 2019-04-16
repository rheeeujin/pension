<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${s_ls_initroom[0].pstitle}예약창 - 놀다가</title>
<link href="css/reserve.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all" type="text/css" href="js/jquery-ui-1.11.4/jquery-ui.min.css" />
<script  src="js/jquery-1.6.2.min.js"></script>
<script  src="js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script  src="js/cash_help.js"></script>
<script  src="js/function.js"></script>
<script  src="js/move.js"></script>

</head>
<body>
      <br>
						
<fmt:parseDate value="${s_todate}"  pattern="yyyyMMdd" var="l_todate" />	
<fmt:formatDate value="${l_todate}" pattern="yyyy-MM-dd" var="l_todate" />

<script type="text/javascript">
    /*
     * Title   : 예약버튼 클릭 시
     * Comment :
     */
     function reserve(pr_count){
         var f = document.reserve;
         var count = 0;
         var rsrm_term = 0;

         for(var i = 0; i < pr_count; i++){
             if(pr_count > 1){
            	 if(f.room_chk[i].checked == true) count++;
             } else {
            	 if(f.room_chk.checked == true) count++;
             }
         }
             
         if(count == 0){ 
             alert('예약할 Room을 Check하세요.!!!');
             return;
         }
         
         f.action="rsv";
         f.submit();
     }    
    /*
    * Title   : 회원예약 버튼 클릭 시
    * Comment :
    */
    function log_check(){
        if(confirm("로그인 페이지로 이동하시겠습니까?")){
		  try{
            var url = $(opener.window.location).attr("pathname");
            var params = window.location.search.substring(1);
            var retURL = url+"?"+params;

            $(opener.window.location).attr("href","login");
            self.close();
            return;
		  } catch(e){
			location.href = "index";
			return;
		  }
        };
        alert("로그인후에 사용하실 수 있는 메뉴입니다.");
        return;
    }

    /*
     * Title   : 
     * Comment :
     */
     function changeCheckbox(e) {
         $(e).parent().parent().find('td:first-child input:checkbox').prop('checked','checked');
     }
     /*
     * Title   : 인원 변경 시
     * Comment :
     */
     function chkUser(val, obj, pr_count, defaultPersonCount){
         var f = document.reserve;
         var maxuser = 0;
         var cntuser = 0;
         // f val번째 selectbox.options[] 번째 이름안에 옵션[i번째이름].
         if(pr_count > 1){
             maxuser = f.rsrm_suse[val].options[f.rsrm_suse[val].options.length-1].value;
             cntuser = parseInt(f.rsrm_suse[val].value);
         }
             // 박수 변경 시
             GetRoomFee(val, pr_count, obj);
     }    
    /*
    * Title   : 방 체크버튼 클릭 시
    * Comment :
    */
    function chkRoom(val1, val2, pr_count){
        var f = document.reserve;
        if(val2){
            //
            GetRoomFee(val1, pr_count);
        }else{
            if(pr_count > 1){
                document.all.rmFeeStr[val1].innerHTML = "<b>-</b>";
                f.rsrm_tfee[val1].value = 0;
            }else{
                document.all.rmFeeStr.innerHTML = '-';
                f.rsrm_tfee.value = 0;
            }
            //
            chkFeeSum(pr_count);
        }
    }
    /*
    * Title   : 박수 변경 시
    * Comment :
    */
    function GetRoomFee(val, pr_count, obj){
        var f = document.reserve;
 
        if(pr_count>1){
            var rt = f.rsrm_tfee[val];
            var rts = document.all.rmFeeStr[val];
            
                r_code = f.room_idx[val].value;
                r_baseamt = f.rsrm_baseamt[val].value;
                r_term = f.rsrm_term[val].value;
                r_suse = f.rsrm_suse[val].value;
                r_permin = f.rsrm_permin[val].value;
                r_minamt = f.rsrm_minamt[val].value;

                if (r_suse < r_permin) {
                	r_suse = r_permin;
                }
        }else{
            var rt = f.rsrm_tfee;
            var rts = document.all.rmFeeStr;

                r_code = f.room_idx.value;
                r_baseamt = f.rsrm_baseamt.value;
                r_term = f.rsrm_term.value;
                r_suse = f.rsrm_suse.value;
                r_permin = f.rsrm_permin.value;
                r_minamt = f.rsrm_minamt.value;
        }
        
        var roomamt, message;
       
        if (r_suse < r_permin) {
        	r_suse = r_permin;
        }
        
        roomamt = parseInt(r_baseamt) * parseInt(r_term) * parseInt(r_suse);
        message = roomamt;        
        rt.value = message; 
        rts.innerHTML = "<b><font color='#000'>" + FormatComma(message) + "원</font></b>";
        // 금액 계산
        chkFeeSum(pr_count);
        //
        changeCheckbox(obj);
        chkBind();
    }
    /*
    * Title   : 금액 계산
    * Comment :
    */
    function chkFeeSum(pr_count){
        var rfSum = 0;
        var f = document.reserve;
        if(pr_count > 1){
            for (i = 0; i  < pr_count; i++){
                rfSum += parseInt(f.rsrm_tfee[i].value);
            }
        }else{
            rfSum = parseInt(f.rsrm_tfee.value);
        }
        document.all.rvFeeStr.innerHTML = FormatComma(rfSum)+'원';
      //  rfSum += parseInt(f.rssv_rfee.value);
        document.all.FeeStr.innerHTML = FormatComma(rfSum)+'원';
    }
</script>
    <h1 class="reserve_header">
        ${s_ls_initroom[0].pstitle}<br>
        <span class="reserve_subTit">날짜,객실 선택</span>
    </h1>

    <!-- **************************************************
          Comment : 캘린더 include
         ************************************************** -->
    <!-- 캘린더-->
<div class="cont_section calender_section">
<form name="CFROM" method="get" action="rsv">
<input type="hidden" name="pension_code" value="${s_psidx}">
<input type="hidden" name="rsrm_date">
<input type="hidden" name="data_gb">
<input type="hidden" name="sel_date">
</form>

<c:set var="s_sel_date1" value="${s_sel_date}"/>
<fmt:parseDate value="${s_sel_date}"  pattern="yyyyMMdd" var="s_sel_date" />	
<fmt:formatDate value="${s_sel_date}" pattern="yyyy-MM-dd" var="l_sel_date" />

<script type="text/javascript">
    /*
    * Title   :
    * Comment :
    */
    function date_select(val, checkGb){
    	
      //  alert(val);
        f = document.CFROM
     //   f.pension_code.value=2;
        f.rsrm_date.value=val;
        f.sel_date.value=dateformat(val);
      //  alert(f.sel_date.value);
        f.data_gb.value=checkGb;
        f.submit(); 
    }

    function dateformat(val) {
    	var val1;
    	val1 = val.substring(0,4);
    	val1 += val.substring(5,7);
    	val1 += val.substring(8,10);
    	
    	return val1;
    }
    
    /*
    * Title   :
    * Comment :
    */
    function Beforemonth(val){
      
        f = document.CFROM
        f.rsrm_date.value="2";
        f.sel_date.value=val;
        f.data_gb.value=0;
        f.submit();
    }
    /*
    * Title   :
    * Comment :
    */
    function Nextmonth(val){
        // 선택된 +1월로 펜션일자별예약 조회 시 Count가 0이면
       // alert('val '+val);
       
        f = document.CFROM
        f.rsrm_date.value="2";
        f.sel_date.value=val;
        f.data_gb.value=0;
        f.submit();
    }
    /*
    * Title   :
    * Comment :
    */
    function drmonth(val){
        f = document.CFROM
        f.rsrm_date.value=val;
        f.submit();
    }
</script>

    <div class="reserve_section calender_sec01">
        <div class="calenderTit">
             <a href="javascript:Beforemonth('${s_p_month}${'01'}');"><img src="reserve_img/reser_01.gif" alt=""></a> 
			<fmt:parseDate value="${s_c_month}${'01'}"  pattern="yyyyMMdd" var="l_c_month" />	
			<fmt:formatDate value="${l_c_month}" pattern="yyyy년MM월" var="l_c_month" />   
            <span>${l_c_month}</span> 
        </div>

        <table class="calender_table term01">
    
        <colgroup>
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
        </colgroup>
        <thead>
            <tr>
                <th class="date_off_holiday">일</th>
                <th class="date_off">월</th>
                <th class="date_off">화</th>
                <th class="date_off">수</th>
                <th class="date_off">목</th>
                <th class="date_off">금</th>
                <th class="date_off">토</th>
            </tr>
        </thead>
      
        <tbody>
          <c:forEach  var="i" items="${s_ls_c_month}">
			<tr>
			<c:if test = "${i.d1==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d1>0}">
				<fmt:formatNumber value="${i.d1}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_holiday">${i.d1}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d1_rv==1}"> 
					<td class ="date_off_holiday" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d1}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d1_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d1}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="red_text" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d1}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d1_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d1}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="red_text" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d1}</a></td>	
					</c:if>
				</c:if>
			</c:if>		
				
			<c:if test = "${i.d2==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d2>0}">
				<fmt:formatNumber value="${i.d2}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d2}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d2_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d2}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d2_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d2}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d2}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d2_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d2}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d2}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d3==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d3>0}">
				<fmt:formatNumber value="${i.d3}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d3}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d3_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d3}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d3_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d3}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d3}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d3_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d3}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d3}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d4==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d4>0}">
				<fmt:formatNumber value="${i.d4}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d4}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d4_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d4}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d4_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d4}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d4}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d4_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d4}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d4}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d5==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d5>0}">
				<fmt:formatNumber value="${i.d5}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d5}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d5_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d5}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d5_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d5}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d5}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d5_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d5}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d5}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d6==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d6>0}">
				<fmt:formatNumber value="${i.d6}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d6}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d6_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d6}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d6_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d6}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d6}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d6_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d6}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d6}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d7==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d7>0}">
				<fmt:formatNumber value="${i.d7}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_c_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d7}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d7_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', 0);">${i.d7}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d7_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d7}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d7}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d7_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d7}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', 0);">${i.d7}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
            </tr>
		</c:forEach>
		</tbody>
    </table>
</div>
<!--// 캘린더 -->

    <div class="reserve_section calender_sec02">
        <div class="calenderTit">
 			<fmt:parseDate value="${s_n_month}${'01'}"  pattern="yyyyMMdd" var="l_n_month" />	
			<fmt:formatDate value="${l_n_month}" pattern="yyyy년MM월" var="l_n_month" />        
            	<span>${l_n_month}</span>
            		<a href="javascript:Nextmonth('${s_n_month}${'01'}');">
            			<img src="reserve_img/reser_02.gif"  class="arro_left">
            		</a>  
        </div>
        <table class="calender_sec calender_table term02 cal_last">
    
        <colgroup>
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
            <col width="14%">
        </colgroup>
        <thead>
            <tr>
                <th class="date_off_holiday">일</th>
                <th class="date_off">월</th>
                <th class="date_off">화</th>
                <th class="date_off">수</th>
                <th class="date_off">목</th>
                <th class="date_off">금</th>
                <th class="date_off">토</th>
            </tr>
        </thead>


        <tbody>
         	<c:forEach var="i" items="${s_ls_n_month}" >
			<tr>
			<c:if test = "${i.d1==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d1>0}">
				<fmt:formatNumber value="${i.d1}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_holiday">${i.d1}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d1_rv==1}"> 
					<td class ="date_off_holiday" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d1}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d1_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d1}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="red_text" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d1}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d1_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d1}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="red_text" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d1}</a></td>	
					</c:if>
				</c:if>
			</c:if>		
				
			<c:if test = "${i.d2==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d2>0}">
				<fmt:formatNumber value="${i.d2}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d2}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d2_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d2}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d2_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d2}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d2}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d2_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d2}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d2}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d3==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d3>0}">
				<fmt:formatNumber value="${i.d3}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d3}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d3_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d3}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d3_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d3}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d3}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d3_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d3}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d3}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d4==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d4>0}">
				<fmt:formatNumber value="${i.d4}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d4}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d4_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d4}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d4_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d4}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d4}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d4_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d4}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d4}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d5==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d5>0}">
				<fmt:formatNumber value="${i.d5}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d5}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d5_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d5}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d5_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d5}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d5}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d5_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d5}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d5}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d6==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d6>0}">
				<fmt:formatNumber value="${i.d6}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d6}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d6_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d6}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d6_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d6}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d6}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d6_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d6}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d6}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
			<c:if test = "${i.d7==0}"> <td class="cblank"></td> </c:if>
			<c:if test = "${i.d7>0}">
				<fmt:formatNumber value="${i.d7}"  pattern="00" var="l_d"/>
				<fmt:parseDate value="${s_n_month}${l_d}"  pattern="yyyyMMdd" var="l_d" />	
				<fmt:formatDate value="${l_d}" pattern="yyyy-MM-dd" var="l_d" />
				
			    <c:if test="${l_todate > l_d}"> 
			    	<td class="date_off_day">${i.d7}</td>
				</c:if>
				<c:if test="${l_todate < l_d && i.d7_rv==1}"> 
					<td class ="date_off_day" >
						 <a href="JavaScript:date_select('${l_d}', -1);">${i.d7}</a></td>					
				</c:if>
			    <c:if test="${l_todate < l_d && i.d7_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d7}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d7}</a></td>	
					</c:if>
				</c:if>			
			    <c:if test="${l_todate == l_d && i.d7_rv==0}"> 
				    <c:if test="${l_d == l_sel_date }"> 
						<td class ="date_on" style="color:#FFFFFF">
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d7}</a></td>	
					</c:if>
				    <c:if test="${l_d != l_sel_date }"> 
						<td class ="" >
							 <a href="JavaScript:date_select('${l_d}', -1);">${i.d7}</a></td>	
					</c:if>
				</c:if>
			</c:if>		    	
            </tr>
			</c:forEach>

		</tbody>
    </table>
</div>
<!--// 캘린더 -->

</div>
    <!-- 캘린더 설명 -->
    <div class="calDes_section">
        <div class="calender_des">
            <div class=" desBox selDate_box"></div><span class="selDate_text">선택일</span>
            <div class="desBox reserFinish_box"></div><span>예약완료</span>
        </div>
    </div>
    <!--// 캘린더 설명 -->

    <!-- 성수기 기간 -->
    <div class="price_list">
        <div class="ordinary_list">
            <ul class="depth1">
                <li>
                    <strong>극성수기</strong>
                    <ul class="depth2">
                        <li>없음</li>
                    </ul>
                </li>
                <li>
                    <strong>여름성수기</strong>
                    <ul class="depth2">
                        
                            <li>매년 7월1일~8월31일 || 12월1일~1월31일</li>
                            
                    </ul>
                </li>
                <li>
                    <strong>준성수기</strong>
                    <ul class="depth2">
                        
                        <li>없음</li>
                        
                    </ul>
                </li>
                <li>
                    <strong>겨울성수기</strong>
                    <ul class="depth2">
                        <li>없음</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="special_list">
            <ul class="depth1">
                <li>
                    <strong>주말요금</strong>
                    <ul class="depth2">
                        <li>
                        
                            토요일,
                        
                            공휴일 전날
                        </li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </div>
    <!--// 성수기 기간 -->

    <form name="reserve" method="post" >
        <input type=hidden name=pension_code value="${s_ls_initroom[0].psidx}">
        <input type=hidden name=pension_nm value="${s_ls_initroom[0].pstitle}">        
        <input type=hidden name=rsrm_date    value="${s_sel_date1}">

        <%-- <input type="hidden" name="rsrm_bfee" value="${s_ls_initroom[0].baseamt}"> --%>
	
        <!-- 객실정보 -->
        <table class="pension_reserveInfo_table">
            <colgroup>
                <col width="40px">
                <col width="12%">
                <col width="20%">
                <col width="10%">
                <col width="10%">
                <col width="86px">
                <col width="60px">
                <col width="11%">
                <col width="12%">
            </colgroup>
                
            <thead>
                <tr>
                    <th><input type="checkbox" name="" id="" class="reserve_checkbox" disabled="disabled"></th>
                    <th><span>예약상태</span></th>
                    <th><span>객실명</span></th>
                    <th><span>평수</span></th>
                    <th style="min-width: 28px;"><span>기준/최대</span></th>
                    <th><span>박수</span></th>
                    <th style="min-width: 28px;"><span>인원</span></th>
                    <th style="min-width: 47px"><span>요금안내</span></th>
                    <th style="min-width: 46px;"><span>이용금액</span></th>
                </tr>
            </thead>
            <tbody>
 	            <c:forEach items="${s_ls_initroom}" var="i" varStatus="sts">
                <tr id="roomTr">
                    <!-- 체크박스 -->
                    <td>
                        <input type="hidden" name="room_idx" value="${i.rmidx}">
						<input type="hidden" id="chkHidden" name="chkHidden" value="N">
                        <c:if test="${i.status==0}">
                        <input type="checkbox" class="reserve_checkbox" id="room_chk"  OnClick = "chkRoom(${sts.index}, this.checked, ${i.rmcnt});" name="room_chk" value="${sts.index}">
                        </c:if>
                        <c:if test="${i.status==1}">
                        	<input type="checkbox" class="reserve_checkbox" id="room_chk" name="room_chk"  disabled>
                   		</c:if>
                        <c:if test="${i.status==9}">
                        	<input type="checkbox" class="reserve_checkbox" id="room_chk" name="room_chk" disabled>
                   		</c:if>
                    </td>
                     <!-- 예약상태 -->
                    <td>
                        <input type="hidden" name="status" value="${i.status}">
	                        <c:if test="${i.status==0}">
	                        	<img src="reserve_img/icon_reserve_possible.gif" alt="예약가능 아이콘">
	                        </c:if>
	                        <c:if test="${i.status==1}">
                      			<span class="reserve_icon">  
                      				<img src="reserve_img/ico_reserve_finish.gif" alt="예약완료 아이콘">
                        		</span>
                        	</c:if>
	                        <c:if test="${i.status==9}">
                      			<span class="reserve_icon">  
                      				<img src="reserve_img/finish.PNG" alt="예약종료 아이콘">
                        		</span>
                        	</c:if>
                    </td>
                    <!-- 객실명 -->
                    <td>
                        <input type="hidden" name="room_nm" value="${i.rmtitle}">
                        <span class="reserve_pname">
                            ${i.rmtitle}
                        </span><br>
                    </td>
                    
                       <!-- 평수 -->
                    <td>
                        <input type="hidden"  value="${i.rmsize}">
                        <span>${i.rmsize}평</span>
                    </td>
                    
                    <!-- 기준/최대 -->
                    <td>
                        <input type="hidden" name="tot_person_num" >
						<input type="hidden" name="rsrm_permin" value="${i.rmpermin}">
                        ${i.rmpermin}/${i.rmpermax }
                         
                    </td>
                    
                    <!-- 박수 -->
                    <td>
                    <c:if test="${i.status==0}">
                   		 <select name="rsrm_term" class="date_selBox" OnChange="GetRoomFee(${sts.index},'${i.rmcnt}',this);">
                            <c:if test="${i.ava_night>=1}">
                            <option value="1" selected="selected">1박</option></c:if>
                            <c:if test="${i.ava_night>=2}">
                            <option value="2" >2박</option></c:if>
                            <c:if test="${i.ava_night>=3}">
                            <option value="3" >3박</option></c:if>
                            <c:if test="${i.ava_night>=4}">
                            <option value="4" >4박</option></c:if>
                            <c:if test="${i.ava_night>=5}">
                            <option value="5" >5박</option></c:if>
                            <c:if test="${i.ava_night>=6}">
                            <option value="6" >6박</option></c:if>
                         </select>
                    </c:if>
                    <c:if test="${i.status==1}">
                        <select name="rsrm_term" class="date_selBox">
                            <option value="없음">없음</option>
                        </select>
                     </c:if>
                    <c:if test="${i.status==9}">
                        <select name="rsrm_term" class="date_selBox">
                            <option value="없음" hidden="">불가</option>
                        </select>
                     </c:if>
                    </td>
                    
                    <!-- 인원 -->
                    <td>
                        <span class="peo_group"></span>
                       <c:if test="${i.status==0}"> 
                       		<select name="rsrm_suse" class="reserve_checkbox" OnChange="chkUser(${sts.index}, this, '${i.rmcnt}','${i.rmpermin}');" >
                            <c:if test="${i.rmpermax >= 1 || i.rmpermin >= 1}"> 
                            <option value="1" <c:if test="${i.rmpermin == 1}"> selected </c:if>>1</option></c:if>
                            <c:if test="${i.rmpermax >= 2 || i.rmpermin >= 2}"> 
                            <option value="2" <c:if test="${i.rmpermin == 2}"> selected </c:if>>2</option></c:if>
                            <c:if test="${i.rmpermax >= 3 || i.rmpermin >= 3}">
                            <option value="3" <c:if test="${i.rmpermin == 3}"> selected </c:if>>3</option></c:if>
                            <c:if test="${i.rmpermax >= 4|| i.rmpermin >= 4}">
                            <option value="4" <c:if test="${i.rmpermin == 4}"> selected </c:if>>4</option></c:if>
                            <c:if test="${i.rmpermax >= 5|| i.rmpermin >= 5}">
                            <option value="5" <c:if test="${i.rmpermin == 5}"> selected </c:if>>5</option></c:if>
                            <c:if test="${i.rmpermax >= 6 || i.rmpermin >= 6 }">
                            <option value="6" <c:if test="${i.rmpermin == 6}"> selected </c:if>>6</option></c:if>
                            <c:if test="${i.rmpermax >= 7|| i.rmpermin >= 7}">
                            <option value="7" <c:if test="${i.rmpermin == 7}"> selected </c:if>>7</option></c:if>
                            <c:if test="${i.rmpermax >= 8 || i.rmpermin >= 8}">
                            <option value="8" <c:if test="${i.rmpermin == 8}"> selected </c:if>>8</option></c:if>
                            <c:if test="${i.rmpermax >= 9 || i.rmpermin >= 9}">
                            <option value="9" <c:if test="${i.rmpermin == 9}"> selected </c:if>>9</option></c:if>
                            <c:if test="${i.rmpermax >= 10 || i.rmpermin >= 10}">
                            <option value="10" <c:if test="${i.rmpermin == 10}"> selected </c:if>>10</option></c:if>
                            <c:if test="${i.rmpermax >= 11 || i.rmpermin >= 11}">
                            <option value="11" <c:if test="${i.rmpermin == 11}"> selected </c:if>>11</option></c:if>
                            <c:if test="${i.rmpermax >= 12 || i.rmpermin >= 12}"> 
                            <option value="12" <c:if test="${i.rmpermin == 12}"> selected </c:if>>12</option></c:if>
                            <c:if test="${i.rmpermax >= 13 || i.rmpermin >= 13}">
                            <option value="13" <c:if test="${i.rmpermin == 13}"> selected </c:if>>13</option></c:if>
                            <c:if test="${i.rmpermax >= 14|| i.rmpermin >= 14}">
                            <option value="14" <c:if test="${i.rmpermin == 14}"> selected </c:if>>14</option></c:if>
                            <c:if test="${i.rmpermax >= 15|| i.rmpermin >= 15}">
                            <option value="15" <c:if test="${i.rmpermin == 15}"> selected </c:if>>15</option></c:if>
                            <c:if test="${i.rmpermax >= 16 || i.rmpermin >= 16 }">
                            <option value="16" <c:if test="${i.rmpermin == 16}"> selected </c:if>>16</option></c:if>
                            <c:if test="${i.rmpermax >= 17|| i.rmpermin >= 17}">
                            <option value="17" <c:if test="${i.rmpermin == 17}"> selected </c:if>>17</option></c:if>
                            <c:if test="${i.rmpermax >= 18 || i.rmpermin >= 18}">
                            <option value="18" <c:if test="${i.rmpermin == 18}"> selected </c:if>>18</option></c:if>
                            <c:if test="${i.rmpermax >= 19 || i.rmpermin >= 19}">
                            <option value="19" <c:if test="${i.rmpermin == 19}"> selected </c:if>>19</option></c:if>
                            <c:if test="${i.rmpermax >= 20 || i.rmpermin >= 20}">
                            <option value="20" <c:if test="${i.rmpermin == 20}"> selected </c:if>>20</option></c:if>
                            <c:if test="${i.rmpermax >= 21 || i.rmpermin >= 21}">
                            <option value="21" <c:if test="${i.rmpermin == 21}"> selected </c:if>>21</option></c:if>
                            <c:if test="${i.rmpermax >= 22 || i.rmpermin >= 22}"> 
                            <option value="22" <c:if test="${i.rmpermin == 22}"> selected </c:if>>22</option></c:if>
                            <c:if test="${i.rmpermax >= 23 || i.rmpermin >= 23}">
                            <option value="23" <c:if test="${i.rmpermin == 23}"> selected </c:if>>23</option></c:if>
                            <c:if test="${i.rmpermax >= 24|| i.rmpermin >= 24}">
                            <option value="24" <c:if test="${i.rmpermin == 24}"> selected </c:if>>24</option></c:if>
                            <c:if test="${i.rmpermax >= 25|| i.rmpermin >= 25}">
                            <option value="25" <c:if test="${i.rmpermin == 25}"> selected </c:if>>25</option></c:if>
                            <c:if test="${i.rmpermax >= 26 || i.rmpermin >= 26 }">
                            <option value="26" <c:if test="${i.rmpermin == 26}"> selected </c:if>>26</option></c:if>
                            <c:if test="${i.rmpermax >= 27|| i.rmpermin >= 27}">
                            <option value="27" <c:if test="${i.rmpermin == 27}"> selected </c:if>>27</option></c:if>
                            <c:if test="${i.rmpermax >= 28 || i.rmpermin >= 28}">
                            <option value="28" <c:if test="${i.rmpermin == 28}"> selected </c:if>>28</option></c:if>
                            <c:if test="${i.rmpermax >= 29 || i.rmpermin >= 29}">
                            <option value="29" <c:if test="${i.rmpermin == 29}"> selected </c:if>>29</option></c:if>
                            <c:if test="${i.rmpermax >= 30 || i.rmpermin >= 30}">
                            <option value="30" <c:if test="${i.rmpermin == 30}"> selected </c:if>>30</option></c:if>
                            </select>
                        </c:if>
                        <c:if test="${i.status==1}">
	                        <select name="rsrm_suse" class="reserve_checkbox">
	                            <option value="없음">-</option>
	                        </select>
                        </c:if>
                        <c:if test="${i.status==9}">
	                        <select name="rsrm_suse" class="reserve_checkbox" >
	                            <option value="없음">-</option>
	                        </select>
                        </c:if>
                        
                    </td>
                    
                    <!-- 요금안내 -->
                    <td>
                    <!-- <span style="text-align:center;color:#FFFFFF;font-size:8pt; font-family:'돋움','돋움체','Arial','Helvetica','sans-serif'; background-color:#FFFFFF;margin:0;padding-top:1px;padding-left:1px;padding-right:1px;">정</span><b><font color="#000"></b><strike><font color=#ec5463>80,000원</font></strike><br><img src='images/sale.gif' class='sale_ico'><b>49,000원</b></font> -->
				    <input type="hidden" name="rsrm_minamt" value="${i.min_amt}">
                    <span>${i.min_amt}원</span>                    
                    </td>
                    
                    <!-- 이용금액 -->
                    <td>
                    	<c:if test="${i.status==0}">
                        <span id="rmFeeStr"></span>
                        </c:if>
						<input type="hidden" name="rsrm_baseamt" value="${i.baseamt}">
                        <input type="hidden" name="rsrm_bfee" value="0">
                        <input type="hidden" name="rsrm_tfee" value="0">
                        <c:if test="${i.status==1}">
                        <span>-</span>
                        </c:if>
                    </td>
                  
                </tr>
                </c:forEach>
         
            </tbody>
        </table>
        <!--// 객실정보 -->

        <!-- 금액정보 -->
        <div class="pay_resultBox" style="text-align:right;">
            <span class="roomResult">객실 합계금액 :</span>
            <span id="rvFeeStr" class="room_priceTxt">0원</span>
            <br>
            
            <input type="hidden" name="scnt" value="">
            <strong class="roomResult">총 결제금액 :</strong><span id="FeeStr" class="total_priceTxt">0원</span>
        </div>
    <!--// 금액정보 -->

    </form>
    <!-- 하단버튼 -->
    <div class="btn_wrap">
        
        <!-- 비회원예약 버튼 -->
<!--         <a href="#" class="btn_com btn_nomem" onclick="alert('준비중입니다.'); return false;" >비회원예약</a>&nbsp; -->
        <c:if test="${not empty member }">
 <%--      	   <a href="JavaScript:log_check();" class="btn_com btn_mem">예약하기</a></c:if>
        <c:if test="${not empty member}"> --%>
     	   <a href="JavaScript:reserve(${s_ls_initroom[0].rmcnt});" class="btn_com btn_mem" >예약하기</a></c:if>
     	   
    </div>
    <!--// 하단버튼 -->
<%-- ${ls_initroom} --%>

    <!-- 결제전 주의사항 -->
    <div class="pay_notice">
        <ul class="payNotice_list">
            <li>당일 입금 확인을 위해 무통장 결제는 평일 오전9시~오후4시, 토요일 오전9시~오후12시(공휴일제외)까지만 가능합니다.</li>
            <li>우리펜션에서 운영하는 객실 예약현황은 99%일치하나 실시간 예약특성상 100% 일치할수 없습니다.</li>
            <li>경우에 따라 중복예약은 발생할 수 있으며 중복예약시 먼저 결제 된 예약건이 우선 예약됩니다</li>
            <li>우리펜션에 등록된 펜션은 펜션주가 직접 운영하는 펜션입니다.</li>
            <li>우리펜션은 예약 중개시스템만 운영하며 중복예약과 현장에서 일어난 일에 대해 일체의 책임을 지지 않습니다.</li>
            <li>객실요금은 기준인원에 대한 요금이며 인원 추가시 추가요금이 발생합니다.</li>
            <li>최대인원 이상은 추가될 수 없으며 입실이 불가합니다.</li>
            <li>미성년자의 혼숙은 절대 불가하며, 미성년자의 이용에 관한 상세한 사항은 관련 법령이 정하는 바에 따릅니다.</li>
						<li>미성년자의 펜션 이용과 3인 이상의 남녀 혼숙은 펜션 자체 규정에 따라 예약취소될 수 있습니다.</li>
            <li>사전 동의 없는 애완동물 입실 불가합니다.</li>
            <li>사진 및 광고 촬영 : 예약 전 우리펜션에 전화 문의 (1600-7818)</li>
        </ul>
    </div>
    <!--// 결제전 주의사항 -->
</body>
</html>