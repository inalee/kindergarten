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
<script type="text/javascript">

//어린이집 목록 불러오기
function selectKinders() {
	//int array send setting
	jQuery.ajaxSettings.traditional = true;
	
	$(".kinder_list").empty();
	
	var sigungucode=document.getElementById("sigungucode").value;
	var kinname=document.getElementById("kinname").value;	
	
	$.get("select_kinder_map",{"sigungucode":sigungucode, "kinname":kinname}, function(data, state) { 
// 			alert(data);
		if (state == "success") {
			//성공한 경우
// 			alert("GET 성공");
			if(data.length==0){
				$(".kinder_list").append("<p>검색 결과가 없습니다.</p>");
			}
			
			for (var i = 0; i < data.length; i++) {
				var homepage;
				if (data[i].kinhome.startsWith("http")) {
					homepage="<a href="+data[i].kinhome+" target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
				} else if (data[i].kinhome.startsWith("www.")||data[i].kinhome.startsWith("club.")||data[i].kinhome.startsWith("blog.")||data[i].kinhome.startsWith("cafe.")||(data[i].kinhome.endsWith(".kr")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".com")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".net")&&data[i].kinhome.indexOf("@")==-1)) {
					homepage="<a href='http://"+data[i].kinhome+"' target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
				} else {
					homepage="";
				}
				$(".kinder_list").append("<table><tr><td colspan='2'><span title="+data[i].kinname+" onclick=''><img alt='marker' class='marker' src='resources/images/map_markers/marker"+(i+1)+".png'>"+data[i].kinname+"</span>"+homepage+"</td></tr><tr><td colspan='2'>"+data[i].kinaddress+"</td></tr><tr><td colspan='2'>"+data[i].kinphone+"</td></tr><tr><td>유형 : "+data[i].kinkind+"</td><td>학급(반)수 : "+data[i].kinroom+"</td></tr><tr><td>현/정원 : "+data[i].kincurrent+"/"+data[i].kinmax+"</td><td>교직원수 : "+data[i].kinteacher+"</td></tr><tr height='7'><td colspan='2'><hr /></td></tr></table>");
// 				$(".kinder_list").append("<tr><td>"+(i+1)+"</td><td>"+data[i].sido+"&nbsp;"+data[i].sigungu+"</td><td style='font-weight:bold;'><a title='자세히 보기' class='detail_kinder' onclick='detailkinder();'>"+data[i].kinname+"</a></td><td>"+data[i].kinkind+"</td><td>"+data[i].kinroom+"</td><td>"+data[i].kinmax+"</td><td>"+data[i].kincurrent+"</td><td>"+data[i].kinteacher+"</td><td>"+homepage+"</td></tr>")
				
			}
		} else {
			//실패한 경우
			alert("GET 실패");
		}
	});
}

</script>
</head>
<body>

<div class="page_name">
	<h2>통합검색</h2><br>
	<a href="search_keyword_gmenu"><span class="sp4">검색으로 찾기</span></a>
	<span class="sp3">지역별 찾기</span>
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
              <option value="1" selected="selected">강남구</option>
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
        <li class="basis"><button class="btn search_btn" type="button" onclick="selectKinders();">검색</button></li>
	</ul>
	
	<div class="search_result">
		<div class="kinder_list">
			<p>검색 결과가 없습니다.</p>
<!-- 			<table><tr onclick=""><td colspan="2"><img alt="marker" class="marker" src="resources/images/map_markers/marker1.png"> 어린이집명(홈피)</td></tr><tr><td colspan="2">주소</td></tr><tr><td colspan="2">전화번호</td></tr><tr><td>유형</td><td>학급(반)수</td></tr><tr><td>정현원</td><td>교직원수</td></tr>	<tr height="7"><td colspan="2"><hr /></td></tr></table>   -->
			<table>
				<tr><td colspan="2"><span title="" onclick="kinnameClick1();"><img alt="marker" class="marker" src="resources/images/map_markers/marker1.png">어린이집명</span>(홈피)</td></tr>
				<tr><td colspan="2">주소</td></tr>
				<tr><td colspan="2">전화번호</td></tr>
				<tr><td>유형</td><td>학급(반)수</td></tr>
				<tr><td>정현원</td><td>교직원수</td></tr>
				<tr height="7">
	                <td colspan="2"><hr /></td>
	            </tr>
	        </table>    
	        <table>
				<tr><td colspan="2"><span title="" onclick="kinnameClick2();"><img alt="marker" class="marker" src="resources/images/map_markers/marker2.png">어린이집명</span>(홈피)</td></tr>
				<tr><td colspan="2">주소</td></tr>
				<tr><td colspan="2">전화번호</td></tr>
				<tr><td>유형</td><td>학급(반)수</td></tr>
				<tr><td>정현원</td><td>교직원수</td></tr>
				<tr height="7">
	                <td colspan="2"><hr /></td>
	            </tr>
			</table>
			
		</div>
		
		<div id="map"></div>

	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ddb1ae3987ac8ed2fa4826d70124a52"></script>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.499569, 127.029332), //지도의 중심좌표.
		level: 3, //지도의 레벨(확대, 축소 정도)
		mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	};
	
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	
	
	
	
	
	
	
	
	
	selectedMarker = null; // 클릭한 마커를 담을 변수

	// 마커 이미지를 생성한다 ========>배열??
	var originalImage1 = new daum.maps.MarkerImage("resources/images/map_markers/marker1.png", new daum.maps.Size(70, 53));
	var overImage1 = new daum.maps.MarkerImage("resources/images/map_markers/marker1.png", new daum.maps.Size(90, 66));

	//지도에 마커를 생성하고 표시한다 ========>배열??
	var marker1 = new daum.maps.Marker({
	    position: new daum.maps.LatLng(37.499569, 127.029332), // 마커의 좌표
	    draggable : false, // 마커를 드래그 불가능하도록 설정한다
	    image : originalImage1, // 마커의 이미지
	    map: map // 마커를 표시할 지도 객체
	});
	
	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new daum.maps.InfoWindow({
	    content : '<div style="padding:5px;"></div>' // 인포윈도우에 표시할 내용
	});

	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	daum.maps.event.addListener(marker1, 'click', function() {

		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
        if (!selectedMarker || selectedMarker != marker1) {
        	// selectedMarker의 인포윈도우를 닫는다
            infowindow.close(map, selectedMarker);
         	// 마커 위에 표시할 인포윈도우의 content 변경
            infowindow = new daum.maps.InfoWindow({
        	    content : '<div style="padding:5px;">인포윈도우1 :D</div>' // 인포윈도우에 표시할 내용
        	});
            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker1);
         	// 지도 중심을 이동 시킵니다
    	    map.panTo(new daum.maps.LatLng(37.499569, 127.029332));
        }
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정한다
        selectedMarker = marker1;
	});
	
	// 마커에 mouseover 이벤트를 등록한다
	daum.maps.event.addListener(marker1, 'mouseover', function() {
        marker1.setImage(overImage1);		
	});

	// 마커에 mouseout 이벤트 등록
	daum.maps.event.addListener(marker1, 'mouseout', function() {
        marker1.setImage(originalImage1);
	});
	
	

	
	
	
	

	
	// 마커 이미지를 생성한다
	var originalImage2 = new daum.maps.MarkerImage("resources/images/map_markers/marker2.png", new daum.maps.Size(70, 53));
	var overImage2 = new daum.maps.MarkerImage("resources/images/map_markers/marker2.png", new daum.maps.Size(90, 66));

	//지도에 마커를 생성하고 표시한다
	var marker2 = new daum.maps.Marker({
	    position: new daum.maps.LatLng(37.499700, 127.030300), // 마커의 좌표
	    draggable : false, // 마커를 드래그 불가능하도록 설정한다
	    image : originalImage2, // 마커의 이미지
	    map: map // 마커를 표시할 지도 객체
	});
	
	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	daum.maps.event.addListener(marker2, 'click', function() {
		
		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
        if (!selectedMarker || selectedMarker != marker2) {
        	// selectedMarker의 인포윈도우를 닫는다
            infowindow.close(map, selectedMarker);
         	// 마커 위에 표시할 인포윈도우의 content 변경
            infowindow = new daum.maps.InfoWindow({
        	    content : '<div style="padding:5px;">인포윈도우2 :D</div>' // 인포윈도우에 표시할 내용
        	});
            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker2);
         	// 지도 중심을 이동 시킵니다
    	    map.panTo(new daum.maps.LatLng(37.499700, 127.030300));
        }
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker2;
	});
	
	// 마커에 mouseover 이벤트를 등록한다
	daum.maps.event.addListener(marker2, 'mouseover', function() {
        marker2.setImage(overImage2);		
	});

	// 마커에 mouseout 이벤트 등록
	daum.maps.event.addListener(marker2, 'mouseout', function() {
        marker2.setImage(originalImage2);
	});
	
	
	
	//kinname 클릭 함수
	function kinnameClick1() {
		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
        if (!selectedMarker || selectedMarker != marker1) {
        	// selectedMarker의 인포윈도우를 닫는다
            infowindow.close(map, selectedMarker);         	
         	// 마커 위에 표시할 인포윈도우의 content 변경
            infowindow = new daum.maps.InfoWindow({
        	    content : '<div style="padding:5px;">인포윈도우1 :D</div>' // 인포윈도우에 표시할 내용
        	});
            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker1);
        	// 지도 중심을 이동 시킵니다
    	    map.panTo(new daum.maps.LatLng(37.499569, 127.029332));
        }
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정한다
        selectedMarker = marker1;
	}
	
	//kinname 클릭 함수
	function kinnameClick2() {
		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
        if (!selectedMarker || selectedMarker != marker2) {
        	// selectedMarker의 인포윈도우를 닫는다
            infowindow.close(map, selectedMarker);
         	// 마커 위에 표시할 인포윈도우의 content 변경
            infowindow = new daum.maps.InfoWindow({
        	    content : '<div style="padding:5px;">인포윈도우2 :D</div>' // 인포윈도우에 표시할 내용
        	});
            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker2);
         	// 지도 중심을 이동 시킵니다
    	    map.panTo(new daum.maps.LatLng(37.499700, 127.030300));
        }
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker2;
	}
	

</script>
</body>
</html>