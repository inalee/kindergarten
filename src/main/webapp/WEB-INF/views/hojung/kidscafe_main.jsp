<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키즈카페 예약</title>

<c:url var="kidscafemain" value="resources/hjcss/kidscafemain.css"></c:url>
<link href="${kidscafemain}" rel="stylesheet" type="text/css" />
<c:url var="backgroundTransition" value="resources/hjcss/backgroundTransition.css"></c:url>
<link href="${backgroundTransition}" rel="stylesheet" type="text/css" />

</head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<c:url var="backgroundTransition" value="resources/hjjs/backgroundTransition.js"></c:url>
<script type="text/javascript" src="${backgroundTransition}"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: 'resources/images/kidscafe1.jpg' },
			  { src: 'resources/images/kidscafe2.jpg' },
			  { src: 'resources/images/kidscafe3.jpg' },
			  { src: 'resources/images/kidscafe4.jpg' },
			  { src: 'resources/images/kidscafe5.jpg' },
			  { src: 'resources/images/kidscafe6.jpg' },
			  { src: 'resources/images/kidscafe7.jpg' },
			  { src: 'resources/images/kidscafe8.jpg' }
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  });

	
	//달력 vlaue, min 오늘날짜로 초기화
	  Date.prototype.toDateInputValue = (function() {
		    var local = new Date(this);
		    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
		    return local.toJSON().slice(0,10);
		});
	  $('#cfresdate').val(new Date().toDateInputValue());
	  document.getElementById('cfresdate').min = new Date().toDateInputValue();
	  
	  
	  // cfresnum에 인원수 반영
	  document.getElementById("cfresnum").value = "성인 "
			+ document.getElementById("count1").value + "명, 어린이 "
			+ document.getElementById("count2").value + "명";

  });
  

	//성인 인원수 +,- 함수
	var count1 = 0;
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
	var count2 = 0;
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

	//personnum show and hide
	function personnumSandH() {
		if ($("#personnum").css("display") == "none") {
			$('#personnum').show();
		} else {
			document.getElementById("cfresnum").value = "성인 "
					+ document.getElementById("count1").value + "명, 어린이 "
					+ document.getElementById("count2").value + "명";
			$('#personnum').hide();
		}

	}

	//personnum hide
	function personnumHide() {
		document.getElementById("cfresnum").value = "성인 "
				+ document.getElementById("count1").value + "명, 어린이 "
				+ document.getElementById("count2").value + "명";
		$('#personnum').hide();
	}

	//starttime에 따른 endtime 설정
	function possibleEndtime() {
		starttime = Number(document.getElementById("starttime").value) + 1;

		$('#endtime').empty();

		for (var i = starttime; i < 23; i++) {
			var option = $("<option value="+i+">" + i + "</option>");
			$('#endtime').append(option);
		}
	}
</script>
<body>
   <div class="backgroundTransition">
<!--        <div class="content"> -->
<!--        </div> -->
	<div class="page">
	  <div class="form">
	  <img alt='logo' src='resources/images/kidscafe_logo.png' style='width: 300px; margin-bottom: 15px;'>
		<form action="kidscafe" method="get">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
			<ul>
				<li class="basis"><p>시도</p>
					<select class="si" title="시도 선택">
		              <option disabled="disabled">== 선택 ==</option>
		              <option value="" selected="selected">서울특별시</option>
		            </select>
				</li>
				<li class="basis"><p>시군구</p>
					<select class="si" title="시군구 선택" id="sigungucode" name="sigungucode">
		              <option disabled="disabled">== 선택 ==</option>
		              <option value="0" selected="selected">전체</option>
		              <option value="1">강남구</option>
		              <option value="2">강동구</option>
		              <option value="3">강북구</option>
		              <option value="4">강서구</option>
		              <option value="5">관악구</option>
		              <option value="6">광진구</option>
		              <option value="7">구로구</option>
		              <option value="8">금천구</option>
		              <option value="9">노원구</option>
		              <option value="10">도봉구</option>
		              <option value="11">동대문구</option>
		              <option value="12">동작구</option>
		              <option value="13">마포구</option>
		              <option value="14">서대문구</option>
		              <option value="15">서초구</option>
		              <option value="16">성동구</option>
		              <option value="17">성북구</option>
		              <option value="18">송파구</option>
		              <option value="19">양천구</option>
		              <option value="20">영등포구</option>
		              <option value="21">용산구</option>
		              <option value="22">은평구</option>
		              <option value="23">종로구</option>
		              <option value="24">중구</option>
		              <option value="25">중랑구</option>
		            </select>
				</li>
				<li class="basis"><p>키즈카페명</p>
		          <input type="search" id="cfname" name="cfname" title="키즈카페명을 입력하세요." placeholder="카페명"/>
		        </li>
		        <li class="basis"><p>날짜</p>
		          <input type="date" id="cfresdate" name="cfresdate" title="날짜를 선택하세요."/>
		        </li>
		        <li class="basis"><p>시작시간</p>
		          <select class="time" id="starttime" name="starttime" title="시작시간을 선택하세요." onchange="possibleEndtime()">
		          	<c:forEach begin="09" end="21" var="i">
		          		<option value="${i}">${i}</option>
		          	</c:forEach>
		          </select>
		          <span>시부터</span>
		        </li>
		        <li class="basis"><p>종료시간</p>
		          <select class="time" id="endtime" name="endtime" title="종료시간을 선택하세요.">
		          	<c:forEach begin="10" end="22" var="i">
		          		<option value="${i}">${i}</option>
		          	</c:forEach>
		          </select>
		          <span>시까지</span>
		        </li>
		        <li class="basis"><p>인원</p>
		          <input type="button" id="cfresnum" title="인원수를 선택하세요." value="성인 0명, 어린이 0명" onclick="personnumSandH();"/>
		          <div id="personnum">
		          	<table id="pnum">
		          		<tr>
		          			<td>성인</td>
		          			<td>
		          				<button type="button" class="minus" onclick="minus1();"></button>
					          	<input type="number" value="0" class="count" id="count1" name="adults" >
							    <button type="button" class="plus" onclick="plus1();"></button>
		          			</td>
		          		</tr>
		          		<tr>
		          			<td>어린이</td>
		          			<td>
		          				<button type="button" class="minus" onclick="minus2();"></button>
					          	<input type="number" value="0" class="count" id="count2" name="kids" >
							    <button type="button" class="plus" onclick="plus2();"></button>
		          			</td>
		          		</tr>
		          		<tr>
		          			<td colspan="2"><p onclick="personnumHide();">확인</p></td>
		          		</tr>
		          	</table>
		          </div>
		        </li>
		        <li class="basis">
		        	<button class="btn search_btn">검색</button>
		        </li>
			</ul>
	    </form>
	  </div>
	</div>
   </div>
</body>
</html>