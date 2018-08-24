<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키즈카페 예약</title>
<c:url var="kidscaferes" value="resources/hjcss/kidscaferes.css"></c:url>
<link href="${kidscaferes}" rel="stylesheet" type="text/css" />
<script type="text/javascript">

var disabledTime=[]; // 잔여석이 없는 시간
var selectedDate=null;
var selectedDateId=null; // 선택된 날짜
var selectedTime=[]; // 선택된 시간
var time1=null;
var time2=null;


$(function(){
	//현재달 달력 생성
	drawCalendar();
	
	//url 파라미터값 가져오기
	var getParameters = function (paramName) {
	    // 리턴값을 위한 변수 선언
	    var returnValue;

	    // 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
	    }
	};
	
	//date value 반영
	selectDate(getParameters('cfresdate'));
	
	//time value 반영
	selectTime(getParameters('starttime'));
	if(getParameters('starttime')!=getParameters('endtime')-1) {
		selectTime(getParameters('endtime')-1);
	}
	
	//인원수 반영
	document.getElementById("count1").value = getParameters('adults');
	document.getElementById("count2").value = getParameters('kids');

});


function drawCalendar(){
	var d = new Date();
	var thisMonth = d.getMonth()+1;
	if(thisMonth <10) thisMonth = "0" + thisMonth;
	var atmonth = d.getFullYear() + "." + thisMonth;
	var lastday = (new Date(new Date(d.getFullYear(), d.getMonth()+1, 0))).getDate();
	$("#thisMonth").empty();
	$(".calendar #date").empty();
	$("#thisMonth").append(atmonth);
	//alert(new Date(atmonth+"-1").getDay());
	var fdom = new Date(atmonth+"-1").getDay();
	for(var i=0; i<fdom; i++){
		$(".calendar #date").append("<li><span></span></li>");
	}
	for(var i=0; i<lastday; i++){
		var day;
		if(i<9) {
			day="0"+(i+1)
		} else {
			day = (i+1)
		}
		if((i+1)<d.getDate()) {
			$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+d.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
		} else {
			$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+d.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);'>"+(i+1)+"</span></li>");
		}

	}

}
	function drawPrevCalendar(){
		var today = new Date();
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 이전달
		var lastMonth = new Date ( new Date( d.getFullYear(), d.getMonth() , 1 ).setDate( new Date( d.getFullYear(), d.getMonth() , 1 ).getDate() - 1 ) );
		var thisMonth = lastMonth.getMonth()+1;
		if(thisMonth <10) thisMonth = "0" + thisMonth;
		var atmonth = lastMonth.getFullYear() + "." + thisMonth;
		var lastday = lastMonth.getDate();
		$("#thisMonth").empty();
		$(".calendar #date").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		for(var i=0; i<fdom; i++){
			$(".calendar #date").append("<li><span></span></li>");
		}
		for(var i=0; i<lastday; i++){
			var day;
			if(i<9) {
				day="0"+(i+1)
			} else {
				day = (i+1)
			}
			if(lastMonth.getFullYear()<today.getFullYear()) {
				$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
			} else if (lastMonth.getFullYear()>today.getFullYear()) {
				$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");
			} else {
				if(thisMonth<today.getMonth()+1) {
					$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
				} else if(thisMonth>today.getMonth()+1) {
					$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");				
				} else {
					if ((i+1)<today.getDate()) {
						$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
					} else {
						$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+lastMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");
					}
				}
			}
		}
		selectDate(selectedDateId);
	}
	function drawNextCalendar(){
		var today = new Date();
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 다음달
	 	var afterMonth = new Date(new Date(d.getFullYear(), d.getMonth()+2, 0) + 1);
		var thisMonth = afterMonth.getMonth()+1;
		if(thisMonth <10) thisMonth = "0" + thisMonth;
		var atmonth = afterMonth.getFullYear() + "." + thisMonth;
		$("#thisMonth").empty();
		$(".calendar #date").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		var lastday = afterMonth.getDate();
		for(var i=0; i<fdom; i++){
			$(".calendar #date").append("<li><span></span></li>");
		}
		for(var i=0; i<lastday; i++){
			var day;
			if(i<9) {
				day="0"+(i+1)
			} else {
				day = (i+1)
			}
			if(afterMonth.getFullYear()<today.getFullYear()) {
				$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
			} else if (afterMonth.getFullYear()>today.getFullYear()) {
				$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");
			} else {
				if(thisMonth<today.getMonth()+1) {
					$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
				} else if(thisMonth>today.getMonth()+1) {
					$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");
				} else {
					if ((i+1)<today.getDate()) {
						$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='n' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+">"+(i+1)+"</span></li>");
					} else {
						$(".calendar #date").append("<li id=day_"+(i+1)+"><span class='d' id="+afterMonth.getFullYear()+"-"+thisMonth+"-"+day+" onclick='selectDate(this.id);');\">"+(i+1)+"</span></li>");
					}
				}
			}
			
		}
		
		selectDate(selectedDateId);
	}
	
	// 선택된 날짜 css 변경 및 form에 추가
	function selectDate(day){
		
		var select = document.getElementById(day);
		if(!selectedDate || selectedDate != select) {
			//이전 선택 날짜 css 초기화
			if(selectedDate!=null) {
				selectedDate.style.backgroundColor="#ffffff";
				selectedDate.style.color="#333";
			} 
			select.style.backgroundColor="#95d5ff";
			select.style.color="#ffffff";
			selectedDateId = day;
			selectedDate = select;
			
			document.getElementById("res_date").value=day;
		}
		
	}
	
	// 선택된 시간 css 변경 및 form에 추가
	function selectTime(time) {
		if(!time1) { // 아무것도 선택되어 있지 않을 때
			time1=time;
			selectedTime.push(time1);
// 			alert("case1:"+time1+", "+time2)
// 			alert(selectedTime)
		} else if(time1 != null && !time2) { // 1개만 선택되어 있을 때
			if (time1 < time){
				time2=time;
				selectedTime=[]; // 초기화
				for (var i = time1; i < parseInt(time2)+1; i++) {  
					selectedTime.push(i);
				}
			} else if (time1 > time) {
				time2=time;
				selectedTime=[]; // 초기화
				for (var i = time2; i < parseInt(time1)+1; i++) {  
					selectedTime.push(i);
				}
			} else if (time1 == time) {
				// css 초기화
				for ( var t in selectedTime) {
					document.getElementById(selectedTime[t]).style.backgroundColor="#ffffff";
					document.getElementById(selectedTime[t]).style.color="#000000";
				}
				selectedTime=[]; // 초기화
				time1=null; // 초기화
			}
		} else { // 2개 모두 선택되어 있을 때
			// css 초기화
			for ( var t in selectedTime) {
				document.getElementById(selectedTime[t]).style.backgroundColor="#ffffff";
				document.getElementById(selectedTime[t]).style.color="#000000";
			}
			selectedTime=[]; // 초기화
			time1=time; time2=null;
			selectedTime.push(time1);
		}
		
		var disabled=null; // 예약 불가능 판별 변수
		// 예약 불가능 시간대 판별
		for ( var t in selectedTime) {
// 			alert(disabledTime)
// 			alert(t+", "+disabledTime.indexOf(t))
			if(disabledTime.indexOf(selectedTime[t])!=-1) {
				alert("예약 불가능한 시간이 포함되어 있습니다. 다시 선택하여 주세요.");
				disabled=true;
				time2=null;
				selectedTime=[]; // 초기화
				selectedTime.push(time1);
				break;
			} 
		}
		
		// 예약이 가능한 상태이면
		if(disabled!=true) {
			// selectedTime 배열이 비어있을 때
			if(selectedTime.length==0) {
				document.getElementById("res_time").value = "";
			// selectedTime 배열에 값이 존재할 때
			} else {
				for ( var t in selectedTime) {
					document.getElementById(selectedTime[t]).style.backgroundColor="#95d5ff";
					document.getElementById(selectedTime[t]).style.color="#ffffff";
				}
				// form에 추가
				var res_time = selectedTime[0]+":00 ~ "+selectedTime.slice(-1)[0]+":59"
				document.getElementById("res_time").value = res_time;
			}
			
		}
	}
	
	//성인 인원수 +,- 함수
	var count1 = 2;
	function plus1() {
		if (count1 < 10) {
			count1++;
			document.getElementById("count1").value = count1;
		}
	}
	function minus1() {
		if (count1 > 0) {
			count1--;
			document.getElementById("count1").value = count1;
		}
	}

	// 어린이 인원수 +,- 함수
	var count2 = 3;
	function plus2() {
		if (count2 < 15) {
			count2++;
			document.getElementById("count2").value = count2;
		}
	}
	function minus2() {
		if (count2 > 0) {
			count2--;
			document.getElementById("count2").value = count2;
		}
	}
	
	
	// disabledTime 저장 함수
	function pushDisabledTime(time) {
// 		alert(time)
		disabledTime.push(time);
// 		alert(disabledTime)
	}
	
	
	var myVar;

	function loadFunction() {
	    myVar = setTimeout(showPage, 3000);
	}

	function showPage() {
	  document.getElementById("loader").style.display = "none";
	  document.getElementById("contents").style.display = "block";
	}

</script>
</head>
<!-- <body onload="loadFunction()" style="margin:0;"> -->
<body style="margin:0;">

<!-- 로딩 중 이미지 -->
<!-- <div id="loader"></div> -->

<!-- 실제 콘텐츠 -->
<!-- <div style="display:none;" id="contents" class="animate-bottom"> -->
<div id="contents" class="animate-bottom">

<div id="wrap">
	<div id="kidscafe_detail">
		<div id="kidscafe_photo">
			<c:if test="${kidscafe.cfimg==null || kidscafe.cfimg==''}">
				<c:set var="cfimg" value="resources/images/noimage.gif"></c:set>
			</c:if>
			<c:if test="${kidscafe.cfimg!=null && kidscafe.cfimg!=''}">
				<c:set var="cfimg" value="${kidscafe.cfimg}"></c:set>
			</c:if>
			<img alt="kidscafe_photo" class="kcimage" src="${cfimg}">
		</div>
		<ul class="ul_detail">
			<li><span class="li_detail">카페명</span><span style="width: 80%; float: right; font-size: 17px; font-weight: bold;">${kidscafe.cfname}</span></li>
			<li><span class="li_detail">주소</span><span style="width: 80%; float: right; word-break: break-all;">${kidscafe.address}</span></li>
			<li><span class="li_detail">전화번호</span>${hm.cfphone}
				<c:if test="${hm.cfphone==null || hm.cfphone==''}">
					${kidscafe.cfphone}
					<c:if test="${kidscafe.cfphone==null || kidscafe.cfphone==''}">-</c:if>
				</c:if>
			</li>
			<li><span class="li_detail" style="margin-right: 23px;">홈페이지</span>
				<span style="width: 80%; float: right;">
					<a href="${hm.homepage}" target="_blank" style="text-decoration: none; color: green; word-break: break-all;">${hm.homepage}</a>
				</span>
				<c:if test="${hm.homepage==null || hm.homepage==''}">-</c:if>
			</li>
			<li><span class="li_detail">이용시간</span>${kidscafe.cfopen}시 ~ ${kidscafe.cfclose}시</li>
			<li><span class="li_detail" style="margin-right: 23px;">이용정보</span><span style="width: 80%; float: right;">${hm.info}</span>
				<c:if test="${hm.info==null || hm.info==''}">-</c:if>
			</li>
			<li><span class="li_detail">가격정보	</span>
				<span style="width: 80%; float: right;">
				<table>
					<c:forEach items="${price}" var="i">
					<tr><td>${i.key}</td><td style="padding-left: 2px; padding-right: 2px;">-----------</td><td>${i.value}</td></tr>
					</c:forEach>
				</table>
				</span>
			</li>
			<hr>
			<li><span class="li_detail">상세설명</span></li>
			<li style="padding: 10px 10px;"><span style="white-space:pre-wrap;">${hm.description}</span>
				<c:if test="${hm.description==null || hm.description==''}">-</c:if>
			</li>
			<hr>
			<li><span class="li_detail">찾아가는 길</span></li>
			<li>지도</li>
			<li>주변 지하철역</li>
			<li>주변 버스정류장</li>
			<hr>
			<li><span class="li_detail">블로그·카페 리뷰</span></li>
			<li>리뷰</li>
			<li>리뷰</li>
			<li>리뷰</li>
		</ul>

	</div>

	<div id="kidscafe_res">
	
		<div style="height: 560px; border-bottom: 1px solid #bbbbbb;"> <!-- background-color:#F9FBFA;???? -->
			<!-- 년도, 월 -->
			<div class="month">
				<div class="inblock">
					<a href="javascript:drawPrevCalendar()" class="btn_left vam"><img src="http://image.ethefaceshop.com/tfsshopWebSrc/images/btn/btn_left_9.png" alt="전달"></a>
					<span class="num" id="thisMonth"></span>
					<a href="javascript:drawNextCalendar()" class="btn_right vam"><img src="http://image.ethefaceshop.com/tfsshopWebSrc/images/btn/btn_right_9.png" alt="다음달"></a>
				</div>
			</div>
			<!-- 달력 -->		
			<div class="calendar">
				<ul>
					<li>일</li><li>월</li><li>화</li><li>수</li><li>목</li><li>금</li><li>토</li>
				</ul>
				<ul id="date">
	
				</ul>
			</div>
			<div class="legend">
				<span id="select">&nbsp;</span>선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="disabled">&nbsp;</span>불가
			</div>
		</div>
		
		<ul class="ul_detail">
			<li><span class="li_detail">날짜</span><input type="text" id="res_date" disabled="disabled" value=""></li>
			<hr>
			<li><span class="li_detail">시간</span><input type="text" id="res_time" disabled="disabled" value=""></li>
			<li><span class="li_detail" style="font-size: 15px; display: inline-block; margin-top: 10px;">오전</span>
				<span style="display: inline-block; width: 400px; float: right;">
				<c:forEach var="i" begin="${kidscafe.cfopen}" end="11" step="1">
					<c:if test="${ressum.containsKey(i)}"><c:set var="p" value="${ressum.get(i)}"></c:set></c:if>
					<c:if test="${!ressum.containsKey(i)}"><c:set var="p" value="0"></c:set></c:if>
					<c:if test="${kidscafe.numperhour==p}">
						<button class="btn_time" id="${i}" value="${i}" type="button"  disabled="disabled" title="인원초과입니다.">${i}:00<br><p>${p}/${kidscafe.numperhour}</p></button>
						<script type="text/javascript">pushDisabledTime('${i}');</script>
					</c:if>
					<c:if test="${kidscafe.numperhour!=p}">
						<button class="btn_time" id="${i}" value="${i}" type="button" onclick="selectTime(this.id);">${i}:00<br><p>${p}/${kidscafe.numperhour}</p></button>
					</c:if>
				</c:forEach>
<!-- 				<button class="btn_time" id="10" value="10" type="button" onclick="selectTime(this.id);">10:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="11" value="11" type="button" onclick="selectTime(this.id);">11:00<br><p>12/20</p></button> -->
				</span>
			</li>
			<li><span class="li_detail" style="font-size: 15px; display: inline-block; padding-top: 8px;">오후</span>
				<span style="display: inline-block; width: 400px; float: right;">
				<c:forEach var="i" begin="12" end="${kidscafe.cfclose-1}" step="1">
					<c:if test="${ressum.containsKey(i)}"><c:set var="p" value="${ressum.get(i)}"></c:set></c:if>
					<c:if test="${!ressum.containsKey(i)}"><c:set var="p" value="0"></c:set></c:if>
					<c:if test="${kidscafe.numperhour==p}">
						<button class="btn_time" id="${i}" value="${i}" type="button"  disabled="disabled" title="인원초과입니다.">${i}:00<br><p>${p}/${kidscafe.numperhour}</p></button>
					</c:if>
					<c:if test="${kidscafe.numperhour!=p}">
						<button class="btn_time" id="${i}" value="${i}" type="button" onclick="selectTime(this.id);">${i}:00<br><p>${p}/${kidscafe.numperhour}</p></button>
					</c:if>
				</c:forEach>
<!-- 				<button class="btn_time" id="12" value="12" onclick="selectTime(this.id);">12:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="13" value="13" onclick="selectTime(this.id);">13:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="14" value="14" onclick="selectTime(this.id);">14:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="15" value="15" onclick="selectTime(this.id);">15:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="16" value="16" onclick="selectTime(this.id);">16:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="17" value="17" disabled="disabled" title="인원초과입니다. ">17:00<br><p>20/20</p></button> -->
<!-- 				<button class="btn_time" id="18" value="18" disabled="disabled" title="인원초과입니다.">18:00<br><p>20/20</p></button> -->
<!-- 				<button class="btn_time" id="19" value="19" onclick="selectTime(this.id);">19:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="20" value="20" onclick="selectTime(this.id);">20:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="21" value="21" onclick="selectTime(this.id);">21:00<br><p>12/20</p></button> -->
<!-- 				<button class="btn_time" id="22" value="22" onclick="selectTime(this.id);">22:00<br><p>12/20</p></button> -->
				</span>
			</li>
			<hr>
			<li><span class="li_detail">인원</span>
				<div style="display: inline-block; width: 200px; float: right;">
				<span style="display: inline-block; float: right; margin: 0 10px 10px 0;">
					<span style="font-size: 15px; margin-right: 25px;">성인</span> 
					<button type="button" class="minus" onclick="minus1();"></button>
		          	<input type="number" value="0" class="count" id="count1" name="adults" >
				    <button type="button" class="plus" onclick="plus1();"></button><br>
				</span>
				<span style="display: inline-block; float: right; margin: 0 10px 10px 0;">
					<span style="font-size: 15px; margin-right: 10px;">어린이</span> 
					<button type="button" class="minus" onclick="minus2();"></button>
		          	<input type="number" value="0" class="count" id="count2" name="kids">
				    <button type="button" class="plus" onclick="plus2();"></button>
				</span>
				</div>
			</li>
			<hr>
			<li><span class="li_detail">이용자 약관 동의</span></li>
			<li><div class="clause"><p>
				&lt;개인정보 수집 동의&gt;<br><br>
				1. 수집항목 : [필수] 이름, 연락처, 주소(배송, 방문 등 필요한 경우에 한함) [선택] 이메일주소<br><br>
				2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 키즈카페 예약 이용 후 리뷰작성에 따른 포인트 지급 및 관련 안내<br><br>
				3. 보관기간<br><br>
				- 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관<br><br>
				- 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함<br><br>
				4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.
			</p></div></li>
			<li><label class="container"><input type="checkbox" id="kinkind"><span class="checkmark"></span>동의합니다.</label></li>
			<li><div class="clause"><p>
				&lt;개인정보 제공 동의&gt;<br><br>
				1. 개인정보를 제공받는 자 : 킨더가든<br><br>
				2. 제공하는 개인정보 항목 : [필수] 킨더가든 아이디, 이름, 연락처, 성별, 연령대, 주소(배송, 방문 등 필요한 경우에 한함) [선택] 이메일 주소 <br><br>
				3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 분석과 통계에 따른 혜택 및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 기록보존<br><br>
				4.개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 킨더가든 회원탈퇴 시 또는 위 개인정보 이용목적 달성 시 까지 이용합니다.<br><br>
				5.동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br><br>
			</p></div></li>
			<li><label class="container"><input type="checkbox" id="kinkind"><span class="checkmark"></span>동의합니다.</label></li>
			<hr>
			<li><button id="btn_res"><span>예 약 하 기</span></button></li>
		</ul>
	</div>
</div>

</div>

</body>
</html>