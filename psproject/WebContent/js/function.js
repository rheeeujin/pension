var Browser = {
	a : navigator.userAgent.toLowerCase()
}

Browser = {
	ie : /*@cc_on true || @*/ false,
	ie6 : Browser.a.indexOf('msie 6') != -1,
	ie7 : Browser.a.indexOf('msie 7') != -1,
	ie8 : Browser.a.indexOf('msie 8') != -1,
	opera : !!window.opera,
	safari : Browser.a.indexOf('safari') != -1,
	safari3 : Browser.a.indexOf('applewebkit/5') != -1,
	mac : Browser.a.indexOf('mac') != -1,
	chrome : Browser.a.indexOf('chrome') != -1,
	firefox : Browser.a.indexOf('firefox') != -1
}

Browser2 = (function(){
 var a = navigator.userAgent.toLowerCase();
 var b,v;

 if(a.indexOf("safari/") > -1) {
  b = "safari";
  var s = a.indexOf("version/");
  var l = a.indexOf(" ", s);
  v = a.substring(s+8, l);
 }
 if(a.indexOf("chrome/") > -1) {
  b = "chrome";
  var ver = /[ \/]([\w.]+)/.exec(a)||[];
  v = ver[1];
 }
 if(a.indexOf("firefox/") > -1) {
  b = "firefox";
  var ver = /(?:.*? rv:([\w.]+)|)/.exec(a)||[];
  v = ver[1];
 }
 if(a.indexOf("opera/") > -1) {
  b = "opera";
  var ver = /(?:.*version|)[ \/]([\w.]+)/.exec(a)||[];
  v = ver[1];
 }
 if((a.indexOf("msie") > -1) || (a.indexOf(".net") > -1)) {
  b = "msie";
  var ver = /(?:.*? rv:([\w.]+))?/.exec(a)||[];
  if(ver[1])
   v = ver[1];
  else{
   var s = a.indexOf("msie");
   var l = a.indexOf(".", s);
   v = a.substring(s+4, l);
  }
 }
 return { name: b || "", version: v || 0};
}()); 

//입력 유효성
function chkInput(inputname, prompt, min, max) {
  var formname = inputname.form.name;
  var inputvalue = inputname.value.toLowerCase();
  var cntChr=1;
  if (!min) min = 0;
  if (!max) max = Math.pow(10,10);

  if (inputvalue.search(/(\S+)/) == -1)
  {
    setMsgbox(prompt,inputname);
    return false;
  }

  if (inputvalue.length < min || inputvalue.length > max) {
    setMsgbox('입력한 값의 길이는 '+ min +'자이상 '+ max +'자이하 이어야 합니다.',inputname);
    return false;
  }
  return true;
}

//입력 유효성
function chkRadio(inputname, prompt) {
  var cntChr=0;
  if(inputname.length == undefined)
  {
	  if (inputname.checked)
	  	  cntChr += 1
  }else{
	  for (var i = 0; i < inputname.length; i++)
	  {
		if (inputname[i].checked)
			cntChr += 1
	  }
  }
  if (cntChr==0)
  {
	  if(inputname.length == undefined)
		  setMsgbox(prompt,inputname);
	  else
		  setMsgbox(prompt,inputname[0]);
      return false;
  }
  return true;
}

//전자우편 유효성
function chkInputMail(inputname, prompt, display) {
  var formname = inputname.form.name;
  var inputvalue = inputname.value.toLowerCase();
  if (!prompt) prompt = '형식에 맞치 않는 이메일주소 입니다.';

  if (inputvalue.search(/(\S+)@(\S+)\.(\S+)/) == -1)
  {
    setMsgbox(prompt,inputname);
    return false;
  }
  return true;
}

//입력비교
function chkInputComp(inputname, inputcomp, prompt) {
  var formname = inputname.form.name;
  if (inputname.value != inputcomp.value)
  {
    setMsgbox(prompt,inputname);
    return false;
  }

  return true;
}

function isAllowExt(obj, msg)
{
	var checkFlag = true;
	if (obj.value != "")
	{
		var arrExceptionExt, checkFlag, i, FilePath
		FilePath = obj.value.toLowerCase();
		arrExceptionExt = new Array("asp","aspx","html","htm")
		for(i=0;i<arrExceptionExt.length;i++)
		{
		    if (arrExceptionExt[i] == FilePath.substr(FilePath.lastIndexOf(".")+1))
		    {
		            alert(msg + "의 확장명 \"" + arrExceptionExt[i] + "\"은(는) 업로드 하실수 없는 파일입니다.\n다른파일을 선택해 주십시오.");
					obj.select();
		            checkFlag = false;
		            break;
		    }

		}
    }
	return checkFlag;
}

function img_check(obj, msg)
{
	if (obj.value != "")
	{
	  if(obj.value.match(/(.jpg|.jpeg|.gif|.png|.JPG|.JPEG|.GIF|.PNG)/)) {
		return true;
	  }else{
		alert(msg + '은(는) 이미지 파일만 선택해 주십시오.')
		obj.select();
		return false;
	  }
	}
	return true;
}

//메세지상자
function setMsgbox(prompt, inputname) {
  alert(prompt);
  inputname.focus();
}

function chkEnter() {
  if (event.keyCode==13) document.LoginForm.submit();
}

function chkNumber()
{
	if(((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 45 || event.keyCode == 46){
		event.returnValue = true;
	}else{
		event.returnValue = false;
	}
}

function chkHangul()
{
	if((event.keyCode < 12592) || (event.keyCode > 12687)) event.returnValue = false;
}

function OpenWin(popwidth,popheight,popname,popurl,scroll,positiontop,positionleft)
{
	if (scroll!="NO")
	{
		scroll = "YES";
	}
	if (positionleft == undefined)
	{
		positionleft=(screen.width)?(screen.width-popwidth)/2:100;
	}
	if (positiontop == undefined)
	{
		positiontop=(screen.height)?(screen.height-popheight)/2:100;
	}

	var popup = window.open(popurl,popname,'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+scroll+',resizable=0,top='+positiontop+',left='+positionleft+',copyhistory=0,width='+popwidth+',height='+popheight);
	if (popup) {
		popup.focus();
	}
}

function OpenWin2(popwidth,popheight,popname,popurl)
{

	var strAppVersion = navigator.appVersion;
	if (strAppVersion.indexOf('MSIE') != -1 && strAppVersion.substr(strAppVersion.indexOf('MSIE')+5,1) > 4) {
		winstyle = "dialogWidth:"+popwidth+"px; dialogHeight:"+popheight+"px; center:yes; help:no; resizable:no; scroll:yes; status:no; ";
		window.showModalDialog(popurl,window,winstyle);
	}
	else {
		LeftPosition=(screen.width)?(screen.width-popwidth)/2:100;
		TopPosition=(screen.height)?(screen.height-popheight)/2:100;
		var popup =window.open(popurl,popname,'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=YES,resizable=0,top='+TopPosition+',left='+LeftPosition+',copyhistory=0,width='+popwidth+',height='+popheight);
		popup.focus();
	}
}

function Search_Post(val)
{
	OpenWin(450,530,'post','/woori_scm/allskill/iframe/popup_post.asp?obj='+val,"NO")
}

function chkFileSize(path)
{
	var appVersion = parseFloat(navigator.appVersion.split("MSIE")[1]);

	if(appVersion >= 7){
		return parseInt(0);
	}else{
		var img = new Image();
		img.dynsrc = path;
		return parseInt(img.fileSize);
	}
}

function cboSelect(obj,val)
{
  var f = document.FORM1;
  for (var i = 0; i < f.elements[obj].length; i++) {
    if (val == f.elements[obj].options[i].value) f.elements[obj].options[i].selected = true;
  }
}

function cboRadio(obj,val)
{
  var f = document.FORM1;
  for (var i = 0; i < f.elements[obj].length; i++) {
    if (val == f.elements[obj][i].value) f.elements[obj][i].checked = true;
  }
}

function cboCheckbox(obj,val)
{
  var f = document.FORM1;
  if (f.elements[obj].length == undefined)
  {
	 f.elements[obj].checked = false;
	 if (val == f.elements[obj].value) f.elements[obj].checked = true;
  }else{
	  var k = val.split(",");
	  for (var i = 0; i < f.elements[obj].length; i++)
	  {
		  f.elements[obj][i].checked = false;
		  for (var j = 0; j < k.length; j++)
		  {
			if (k[j].trim() == f.elements[obj][i].value)
				f.elements[obj][i].checked = true;
		  }
	  }
  }
}

String.prototype.trim = function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}


function GetCode(){
	var x="";

	if(LineNum==0) return x;
	if(number_change(f.rowcount.value)==1)
		x=tr1.value;
	else{
		if(number_change(f.rowcount.value)>1)
			x=tr1(LineNum-1).value;
	}

	return x;
}

function GetCodeLineNum(n){
	var x="";
	if(number_change(f.rowcount.value)==1)
		x=tr1.value;
	else{
		if(number_change(f.rowcount.value)>1)
			x=tr1(n).value;
	}

	return x;
}

function number_change(val) {
	return Number(strnumber(val));
}

function strnumber(val) {
	var c;
	var s="";

	val = val.toString();
	p=val.substring(0);
	if(val.charAt(0)=='0'){
		if(val.length>1){
			if(val.charAt(1)!=".")
				p=val.substring(1);
		}
	}

	var l=p.length;
	for(var i=0;i<l;i++){
		c=p.charAt(i);
		if(c==".")
			s=s+c;
		if(c=="-")
			s=s+c;
		if(c>="0" && c<= "9")
			s=s+c;
	}

	return s;
}

function chkSearch(val)
{
	var f = document.FORM1;
	f.encoding = "application/x-www-form-urlencoded";
	f.srch_sort.value = val;
	f.target="_self";
	f.action=location.pathname;
	f.submit();
}

function iframeSize(iframeName, iframeMin) {


    document.getElementById(iframeName).style.height = 300;
    var iHeight = eval(iframeName).document.body.scrollHeight;
    if (Browser.ie || Browser.ie6 || Browser.ie7 || Browser.ie8) {
        if (iHeight < iframeMin)
            iHeight = iframeMin;
    }
    document.getElementById(iframeName).style.height = iHeight;
}

function tobe_iframeSize(iframeName, iframeMin) {




    var obj = document.getElementById(iframeName);
    var objDoc = obj.contentWindow || obj.contentDocument;
    var height = objDoc.myHeight();
    $("#" + iframeName).css("height", height + "px");
    //alert(height);

   // objDoc.tableResize(836);
}



function iframeSize2(iframeName,iframeMin)
{

		document.getElementById(iframeName).style.height = 1000;
		var iHeight = eval(iframeName).document.body.scrollHeight;
		if (iHeight < iframeMin)
			iHeight = iframeMin;
		document.getElementById(iframeName).style.height = iHeight+450;
}

// 이미지 사이즈 고정
function resizeImgSub(img,wid,hei)
{
	var imgTemp = new Image();
	imgTemp.src = img.src;
	if(imgTemp.width > wid && imgTemp.height > hei)
	{
		if (imgTemp.width/wid > imgTemp.height/hei)
		{
			imgTemp.height=(wid/imgTemp.width)*imgTemp.height;
			imgTemp.width=wid;
		}else{
			imgTemp.width=(hei/imgTemp.height)*imgTemp.width;
			imgTemp.height=hei;
		}
	}else if(imgTemp.width > wid)
	{
		imgTemp.height=(wid/imgTemp.width)*imgTemp.height;
		imgTemp.width=wid;
	}else if(imgTemp.height > hei)
	{
		imgTemp.width=(hei/imgTemp.height)*imgTemp.width;
		imgTemp.height=hei;
	}

	img.visibleImgObj.width = imgTemp.width;
	img.visibleImgObj.height = imgTemp.height;

}

function resizeImg(imgObj,imgWid,imgHei)
{
	var imgOriginal = new Image();
	imgOriginal.visibleImgObj = imgObj;
	imgOriginal.onload = function() { resizeImgSub(this,imgWid,imgHei); }
	imgOriginal.src = imgObj.src;
}

function MakeHttpObject()
{
	  try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}     //IE6
	  try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {}  //IE5.5
	  try { return new XMLHttpRequest(  ); } catch(e) {}                          //IE7, Firefox
	  return null;
}

function getXmlDom() {
	var xmlDomProgIDs = ["MSXML2.DOMDocument.6.0",
						"MSXML2.DOMDocument.5.0",
						"MSXML2.DOMDocument.4.0",
						"MSXML2.DOMDocument.3.0",
						"MSXML2.DOMDocument",
						"Microsoft.XmlDom"];

	for(var i = 0; i < xmlDomProgIDs.length; i++) {
		try {
			var xmlDom = new ActiveXObject(xmlDomProgIDs[i]);
			return xmlDom;
		} catch(e) {
			// 무시
		}
	}
	// throw new "MSXML 이 설치되어 있지 않습니다!";
}

function commaInput(obj) {
	var aPlus = Array(107, 187);
	var ar=Array(35,36,37,39,13,16,9,110);
	var	n=window.event.keyCode;
	if(n==8){
		window.event.keyCode=n;
		obj.value=FormatComma(obj.value);
		return;
	}

	for(var i=0;i<ar.length;i++){
		if(n==ar[i]){
			window.event.keyCode=n;
			return ;
		}
	}

	//107: 숫자패드의 +, 187: Shift+=
	if ((n == 107) || (n == 187)){
		window.event.keyCode = 0;
		var Value = obj.value;
		Value = Value + "000";
		obj.value=FormatComma(Value);
		return;
	}

	obj.value=FormatComma(obj.value);
}

function FormatComma(s){
	var i;
	var temps;
	var rs;
	var n;
	var bminus=false;

	if(s=="")
		return ""
	var temps=strnumber(s);

	if(temps.substring(0,1)=="-"){
		bminus=true;
		l=temps.length;
		temps=temps.substring(1,l);
	}

	while(1){
		i=temps.indexOf(",");
		if(i!=-1)
			temps=temps.replace(",","");
		else
			break;
	}
	r="";
	l=temps.length;
	i=temps.indexOf(".");

	temps1="";
	if(i!=-1){
		temps1=temps.substring(i+1);
		temps=temps.substring(0,i);
		rs=getComma(temps)+"." +temps1;

		if(bminus==false)
			return rs;
		else
			return "-" + rs;
	}
	else{
		rs=getComma(temps);
		if(bminus==false)
			return rs;
		else
			return "-" + rs;
	}
}

function getComma(obj){
	var temps=obj;
	var	n=temps.length;
	var rs;

	if(n<4)
		return obj;
	else
		rs=temps.substring(n-3);

	temps=temps.substring(0,n-3);

	while(1){
		n=temps.length;
		if(n>3){
			rs= temps.substring(n-3)+ ","+ rs;
			temps=temps.substring(0,n-3);
		}
		else{
			return temps + "," + rs;
		}
	}
}

function number_onblur(obj) {
	obj.value=FormatComma(obj.value);
}

function number_change(val) {
	return Number(strnumber(val));
}

function strnumber(val) {
	var c;
	var s="";

	val = val.toString();
	p=val.substring(0);
	if(val.charAt(0)=='0'){
		if(val.length>1){
			if(val.charAt(1)!=".")
				p=val.substring(1);
		}
	}

	var l=p.length;
	for(var i=0;i<l;i++){
		c=p.charAt(i);
		if(c==".")
			s=s+c;
		if(c=="-")
			s=s+c;
		if(c>="0" && c<= "9")
			s=s+c;
	}

	return s;
}

function number_onfocus(obj) {
	return;
	//obj.value=number_change(obj.value);
	//obj.select();
}

//------입력폼의 값을 숫자로 변경 -----
function CheckNumber(obj)
{
	if(!isNaN(Number(obj.value)))
		commaInput(obj);
}

//------입력박스 엔터입력시 자동 포커스 이동 -----
function MoveNext(obj,val) {
  var f = document.FORM1;
  var move = false;
  if (val!="13")
	var ev=window.event.keyCode;
  if(ev==13||val=="13"){
	  for (var i=0; i<f.length; i++) {
		if (!(f[i].type=='radio'||f[i].type=='checkbox'||f[i].type=='hidden'||f[i].type=='submit'||f[i].type=='button'||f[i].readOnly||f[i].disabled))
		{
			if (move)
			{
				f[i].focus();
				break;
			}
			if(f[i]==obj)
				move = true
		}
	  }
  }
}
var colorobj;
function changeColor(obj)
{
	if(colorobj != undefined)
		clearColor();
	obj.style.background="#FFF4DA";
	colorobj = obj;
}

function clearColor(){
 	colorobj.style.background="#FFFFFF";
 }

 function SelAllCheck()
{
	var f = document.FORM1;
	if(f.chk == undefined)
	{
		return;
	}else{
		if(f.chk.length == undefined)
		{
			(f.chkAll.checked) ? (f.chk.checked=true) : (f.chk.checked=false);
		}else{
			for(i=0;i<f.chk.length;i++)
			{
				(f.chkAll.checked) ? (f.chk[i].checked=true) : (f.chk[i].checked=false);
			}
		}
	}
}







function tobe_zzim(pension_code, pension_name) {

    var data = { pension_code: pension_code };
    var opts = {
        type: "post"
		, url: "/pension/tobe_zzim.asp"
        , data: data
		, beforeSend: function () {
		}
		, success: function (data) {
		    if (data == "1") {  //찜 성공
		        alert("찜 하셨습니다~^^");

		    }
		    else if (data == "2") {  // 이미 찜했다
		        alert("선택하신 펜션은 이미 찜!! 해 놓으셨어요~~ ^^");
		    }
		    else if (data == "3") {  // 로그인안했따.
		        var msg = "펜션 찜 기능은 회원전용 메뉴입니다.\r\n로그인을 해주세요"
		        alert(msg);
		    }

		}
		, error: function (data, status, err) {
		}
		, complete: function () {
		}
    };
    $.ajax(opts);

}







function RefreshImage(id) {
    var td = $("#" + id).parent();

    var img = "<img src='/community/captcha.asp' id='" + id + "' aaa='aaa' />";

    var result = Math.floor(Math.random() * 1000) + 1;



    $("#" + id).attr("src", "");
    $("#" + id).attr("src", "/community/captcha.asp?result=" + result);
}




//사진 업로드시 파라미터 지정
function makeFileUploadParam() {
    var obj = {};
    var boardType = $("#boardType").val();
    obj["boardType"] + boardType;
    var paramStr = $.param(obj);
    return paramStr;
}




function param(obj) {

    obj = obj || {};
    var array = [];
    for (var item in obj) {
        array[array.length] = item + "=" + obj[item]
    }

    return array.join("&");
}


//파라미터 유지하기
function getParams() {
    var url = document.location.href;
    var parameters = url.split("?")[1];
    var queryString = {};

    if (parameters == null) {
        parameters = "";
    }

    var paramArr = parameters.split("&") || [];
    for (var i = 0; i < paramArr.length; i++) {
        var pair = paramArr[i];
        if (!pair) return;
        var parts = pair.split("=");
        if (parts[0] && parts[1]) {
            queryString[parts[0]] = parts[1]
        }
    }

    return queryString;
}







function viewReserveCalendar(obj) {
    var pension_code = (obj || {})["pension_code"] || "";
    var rsrm_date = (obj || {})["rsrm_date"] || "";
    if (pension_code) {
        window.open('/pension/tobe_all_calendar.asp?rsrm_date=' + rsrm_date + '&pension_code='
    + pension_code + '', 'rsv_condition', 'width=916, height=1000, scrollbars=yes');
    }



}








//글쓰기시 펜션명 검색 select box 시작
var pensionSelectListOptions = null;
function pensionNameFilter(txtFilter) {


         var val = $("#" + txtFilter).val();
         var name = val || ""
         var td = $("#" + txtFilter).parents("td");
         var ul = $("ul", td);
         var li = $("li", ul);
         li.each(function () {
             var pension_name = $(this).html();
             if (pension_name.toString().indexOf(name) == -1) {
                 $(this).hide();
             }
             else {
                 $(this).show();
             }
         });

         if (pensionSelectListOptions) {
             penNameFilter_process(txtFilter);
         }
         else {
             var data = {};
             var opts = {
                 type: "post"
            , data: data
            , url: "/community/tobe_pen_name_search.asp"
            , success: function (data) {
                var options = $(data);

                pensionSelectListOptions = options;
                penNameFilter_process(txtFilter);

            }
            , error: function (data, status, err) {
            }
            , complete: function () {
            }
             };
             $.ajax(opts);
         }
     }

     function penNameFilter_process(txtFilter) {

         var val = $("#" + txtFilter).val();
         var name = val || "";

         var td = $("#" + txtFilter).parents("td");

         var pensionSelectListOptions_new = [];
         pensionSelectListOptions.each(function () {
             var pension_name = $(this).text();
             if (pension_name.toString().indexOf(name) > -1) {
                 var tempVal = $(this).val();
                 var tempOption = "<option value='" + tempVal + "'>" + pension_name + "</option>";
                 pensionSelectListOptions_new[pensionSelectListOptions_new.length] = tempOption;
             }
         });


         var selectId = $("select", td).attr("id");
         var selectName = $("select", td).attr("name");

         $(".dropdown", td).replaceWith("<select class='dropdown' id='" + selectId + "' name='" + selectName + "'>"
         + pensionSelectListOptions_new.join("") + "</select>");
         easydropdownForSelector(selectId);
     }


     //easydropdown 플러그인을 개별로 적용하기
     function easydropdownForSelector(selector) {
         $.easyDropDownSelector = "#" + selector;
         delete EasyDropDownInitInstances[selector];
         EasyDropDownInit();
     }

	/*=========================================================================
       Title    : 파일다운
       Return   :
       Param    : [1]폴더경로, [2]파일명
       Tutorial :
    =========================================================================*/
	function download () {
		var args = arguments;
		var fpath = args[0];
		var fname = args[1];

		fpath = encodeURIComponent(args[0]);
		fname = encodeURIComponent(args[1]);
		location.href = "/common/download.asp?fpath="+fpath+"&fname="+fname;
	}

	/*=========================================================================
       Title    : 페이지 이동
       Return   :
       Param    : [1]폴더경로, [2]파일명
       Tutorial :
    =========================================================================*/
	function goPage (url) {
		location.href = url;
	}


	/*=========================================================================
		Title     : 이벤트 키코드 값 문자로 변경
		Return    : String
		Tutorial  : keyCodeToChar()
	=========================================================================*/
	function keyCodeToChar() {
		var result;
		try {
			var e = event;
			var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;

			return String.fromCharCode(event.keyCode);
		}
		catch (e) { return e; }
	}


	/*=========================================================================
	  Title    : Cloud Server Session 공유 위한 자동 인증 체크 후 리턴 페이지 이동
	  Return   :
	  Tutorial :
	  	syncSession({
			sitecode: '<%=use_site_code%>',
			mid: '<%=Session("m_id")%>',
			returl: '<%=URLEncode("/community/tobe_photo_write.asp")%>',
			isauth: true
		})
	=========================================================================*/
	function syncSession (params) {
		var url = "/sync_session.asp?site_code="+params.sitecode+"&m_id="+params.mid+"&returl="+escape(params.returl);

		if (params.isauth == true && (params.mid == undefined || params.mid == "") ) {
			alert("로그인 후 등록해주세요.");
			return;
		};

		if (params.target==undefined && params.target!="") {
			document.location.href = url;
		} else {
			eval(params.target).document.location.href = url;
		};
	}

/*-- 지정한 레이어를 투명하게 만든다. --------------------------------------------*/
/*	o : 투명 레이어를 표시할 object의 id (object 영역에만 투명 레이어 표시)
		생략시 화면 전체에 레이어 표시
*/
function disable_screen(o)
{
	if(o==undefined || o==null) {
		var w = $(document).width();
		var h = $(document).height();

		if(document.getElementById('_hidden_view_frame')==null) { $("<div id='_hidden_view_frame'></div>").appendTo('body'); }
	} else {
		$('#'+o).css('position', 'relative');
		var w = $('#'+o).width();
		var h = $('#'+o).height();

		//if(h<200) { $('#'+o).height(100); h=200; }

		if(document.getElementById('_hidden_view_frame')==null) { $("<div id='_hidden_view_frame'></div>").appendTo($('#'+o)); }
	}
	$("#_hidden_view_frame").css({
		'position':'absolute',
		'left':'0px', 'top':'0px',
		'width':w+'px', 'height':h+'px',
		'background':'#000',
		'zIndex':'10'
	}).css('opacity',0.2);
}

/*-- 투명 레이어를 제거한다. --------------------------------------------*/
function enable_screen() {
	$('#_hidden_view_frame').remove();
}

/*-- 날짜 유효성 검사. --------------------------------------------*/
function isValidDate(param) {
	try
	{
		param = param.replace(/-/g,'');

		// 자리수가 맞지않을때
		if( isNaN(param) || param.length!=8 ) {
			return false;
		}
		 
		var year = Number(param.substring(0, 4));
		var month = Number(param.substring(4, 6));
		var day = Number(param.substring(6, 8));

		var dd = day / 0;

		 
		if( month<1 || month>12 ) {
			return false;
		}
		 
		var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		var maxDay = maxDaysInMonth[month-1];
		 
		// 윤년 체크
		if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
			maxDay = 29;
		}
		 
		if( day<=0 || day>maxDay ) {
			return false;
		}
		return true;

	} catch (err) {
		return false;
	}                       
}