<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어린이집 찾기</title>
<c:url var="search_kinder" value="resources/hjcss/search_kinder.css"></c:url>
<link href="${search_kinder}" rel="stylesheet" type="text/css" />
<c:url var="board" value="resources/hjcss/board.css"></c:url>
<link href="${board}" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

//슬라이더 오버랩 방지, input 숫자를 슬라이더 위치의 숫자로 업데이트, 색 업데이트
function updateHeadcountLabels() {
    //avoids slider overlap
    var sliders = document.querySelectorAll(".kinder_search .headcount-slider input");
    var val1 = parseInt(sliders[0].value);
    var val2 = parseInt(sliders[1].value);
    if (val1 >= val2) {
        sliders[0].value = val2 - 1;
        return;
    }
    if (val2 <= val1) {
        sliders[1].value = val1 + 1;
        return;
    }
    
    document.getElementById("capacity_min").value=val1;
    document.getElementById("capacity_max").value=val2;    
    
    //adds color when a range is selected
    if (val1 > 0 || val2 < 299) {
        sliders[0].style.background = sliders[1].style.background = "-webkit-gradient(linear, 0 0,100% 0, color-stop(0, #c0c0c0), color-stop(" + (val1 / 300) + ", #c0c0c0),color-stop(" + (val1 / 300) + ", #80bfff), color-stop(" + (val2 / 300) + ", #80bfff), color-stop(" + (val2 / 300) + ", #c0c0c0))";
    } else {
        sliders[0].style.background = sliders[1].style.background = '';
    }
}

//슬라이더 오버랩 방지, 슬라이더 위치를 input으로 받은 숫자로 업데이트, 색 업데이트
function updateSlider() {
	var sliders = document.querySelectorAll(".kinder_search .headcount-slider input");
	
// 	if(document.getElementById("min").value>=document.getElementById("max")) {
// 		document.getElementById("min").value=0;
// 		document.getElementById("max").value=300;
// 	}
	
	sliders[0].value=document.getElementById("capacity_min").value;
	sliders[1].value=document.getElementById("capacity_max").value;

	var val1 = parseInt(sliders[0].value);
    var val2 = parseInt(sliders[1].value);
    if (val1 >= val2) {
        sliders[0].value = val2 - 1;
        return;
    }
    if (val2 <= val1) {
        sliders[1].value = val1 + 1;
        return;
    }
	if (val1 > 0 || val2 < 299) {
        sliders[0].style.background = sliders[1].style.background = "-webkit-gradient(linear, 0 0,100% 0, color-stop(0, #c0c0c0), color-stop(" + (val1 / 300) + ", #c0c0c0),color-stop(" + (val1 / 300) + ", #80bfff), color-stop(" + (val2 / 300) + ", #80bfff), color-stop(" + (val2 / 300) + ", #c0c0c0))";
    } else {
        sliders[0].style.background = sliders[1].style.background = '';
    }
}

//어린이집 목록 불러오기
function selectKinders() {
	//int array send setting
	jQuery.ajaxSettings.traditional = true;
	
	$("#tbody").empty();
	$("#search_cnt").empty();
	
	var sigungucode=document.getElementById("sigungucode").value;
	var kinname=document.getElementById("kinname").value;
	
	var kinkind_lists = [];
	$("input[id='kinkind']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
	 kinkind_lists.push($(this).val());
	});
	
	var vacancy, kinshuttle;
	if ($("input[id='vacancy']").prop('checked')) {
		vacancy=1; //vacancy checked
    } else {vacancy=0;}
	if ($("input[id='kinshuttle']").prop('checked')) {
		kinshuttle=1; //kinshuttle checked
    } else {kinshuttle=0;}
	
	var kinmax = [];
	kinmax[0]=document.getElementById("capacity_min").value;
	kinmax[1]=document.getElementById("capacity_max").value;
	
	
	$.get("select_kinder_kw",{"sigungucode":sigungucode, "kinname":kinname, "kinkind_lists":kinkind_lists, "vacancy":vacancy, "kinshuttle":kinshuttle, "kinmax":kinmax}, function(data, state) { 
// 			alert(data);
		if (state == "success") {
			//성공한 경우
// 			alert("GET 성공");
			
			$("#search_cnt").append("총 "+data.length+"개의 어린이집이 검색되었습니다.");
			
			for (var i = 0; i < data.length; i++) {
				var homepage;
				if (data[i].kinhome.startsWith("http")) {
					homepage="<a href="+data[i].kinhome+" target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg1' src='resources/images/homepage.png'></a>";
				} else if (data[i].kinhome.startsWith("www.")||data[i].kinhome.startsWith("club.")||data[i].kinhome.startsWith("blog.")||data[i].kinhome.startsWith("cafe.")||(data[i].kinhome.endsWith(".kr")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".com")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".net")&&data[i].kinhome.indexOf("@")==-1)) {
					homepage="<a href='http://"+data[i].kinhome+"' target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg1' src='resources/images/homepage.png'></a>";
				} else {
					homepage=data[i].kinhome;
				}
				$("#tbody").append("<tr><td>"+(i+1)+"</td><td>"+data[i].sido+"&nbsp;"+data[i].sigungu+"</td><td style='font-weight:bold;'><a title='자세히 보기' class='detail_kinder' onclick='detailkinder("+data[i].kincode2+");'>"+data[i].kinname+"</a></td><td>"+data[i].kinkind+"</td><td>"+data[i].kinroom+"</td><td>"+data[i].kinmax+"</td><td>"+data[i].kincurrent+"</td><td>"+data[i].kinteacher+"</td><td>"+homepage+"</td></tr>")
				
			}
		} else {
			//실패한 경우
			alert("GET 실패");
		}
	});
}

//어린이집 자세히 보기 팝업창
function detailkinder(kincode){
	
	var popUrl = "http://info.childcare.go.kr/info/pnis/search/preview/SummaryInfoSlPu.jsp?flag=YJ&STCODE_POP="+kincode;	//팝업창에 출력될 페이지 URL
	var popOption = "width=810, height=940 top=50 left=300";    //팝업창 옵션(optoin)
	window.open(popUrl,"",popOption);	

}
</script>
</head>
<body>

<div class="page_name">
	<h2>통합검색</h2><br>
	<span class="sp1">검색으로 찾기</span>
	<a href="search_map"><span class="sp2">지역별 찾기</span></a>
</div>

<div class="kinder_search">	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	<ul>
		<li class="basis"><p>시도</p>
			<select title="시도 선택">
              <option disabled="disabled">== 선택 ==</option>
              <option value="" selected="selected">서울특별시</option>
            </select>
		</li>
		<li class="basis"><p>시군구</p>
			<select title="시군구 선택" id="sigungucode">
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
		<li class="basis">
          <input type="search" id="kinname" title="어린이집명을 입력하세요." placeholder="기관명" style="padding: 0;"/>
        </li><br>
        <li class="basis">
          <details>
          	<summary>상세검색 <button class="btn search_btn" type="button" onclick="selectKinders();">검색</button></summary>
          	<ul>
          		<li><i class="arrow right"></i>&nbsp;&nbsp;설립유형 : 
          			<label class="container">가정<input type="checkbox" id="kinkind" value="1"><span class="checkmark"></span></label>
          			<label class="container">국공립<input type="checkbox" id="kinkind" value="2"><span class="checkmark"></span></label>
          			<label class="container">민간<input type="checkbox" id="kinkind" value="3"><span class="checkmark"></span></label>
          			<label class="container">법인·단체 등<input type="checkbox" id="kinkind" value="4"><span class="checkmark"></span></label>
          			<label class="container">사회복지법인<input type="checkbox" id="kinkind" value="5"><span class="checkmark"></span></label>
          			<label class="container">직장<input type="checkbox" id="kinkind" value="6"><span class="checkmark"></span></label>
          			<label class="container">협동<input type="checkbox" id="kinkind" value="7"><span class="checkmark"></span></label>
          		</li>
          		<li>
          			<span><i class="arrow right"></i>&nbsp;&nbsp;<label class="container">잔여석이 있는 어린이집만 검색<input type="checkbox" id="vacancy" value="1"><span class="checkmark"></span></label></span>
          			<span style="margin-left: 100px;"><i class="arrow right"></i>&nbsp;&nbsp;<label class="container">통학차량을 운영하는 어린이집만 검색<input type="checkbox" id="kinshuttle" value="1"><span class="checkmark"></span></label></span>
          		</li>
          		<li><i class="arrow right"></i>&nbsp;&nbsp;정원 : &nbsp;&nbsp;
          			<div class="headcount-slider">
						<input value="0" min="0" max="300" step="0.5" type="range" oninput="updateHeadcountLabels()" class="slider" >
						<input value="300" min="0" max="300" step="0.5" type="range" oninput="updateHeadcountLabels()" class="slider" >
					</div>
					&nbsp;&nbsp;<input type="number" id="capacity_min" value="0" min="0" onchange="updateSlider()">명 ~
					<input type="number" id="capacity_max" value="300" max="300" onchange="updateSlider()">명
          		</li>
          		<li>

          		</li>

          	</ul>
          </details>
        </li>
	</ul>
</div>

<div>
	<h5 id="search_cnt"></h5>
	<table class="sub_news" border="1" cellspacing="0"
		summary="통합검색 리스트">
		<caption>통합검색 리스트</caption>
		<colgroup>
			<col width="60">
			<col width="200">
			<col>
			<col width="90">
			<col width="70">
			<col width="70">
			<col width="70">
			<col width="70">
			<col width="150">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">지역</th>
				<th scope="col">어린이집명</th>
				<th scope="col">설립유형</th>
				<th scope="col">학급(반)수</th>
				<th scope="col">정원</th>
				<th scope="col">현원</th>
				<th scope="col">교직원수</th>
				<th scope="col">홈페이지</th>
			</tr>
		</thead>
		<tbody id="tbody">
<!-- 			<tr><td>번호</td><td>지역</td><td><a title="자세히 보기" class="detail_kinder" onclick="detailkinder();">어린이집명</a></td> -->
<!-- 			<td>설립유형</td><td>학급(반)수</td><td>정원</td><td>현원</td><td>교직원수</td> -->
<!-- 			<td><img alt="홈페이지" class="homepageimg" src="resources/images/homepage.png"></td></tr> -->
		</tbody>
	</table>
</div>


</body>
</html>