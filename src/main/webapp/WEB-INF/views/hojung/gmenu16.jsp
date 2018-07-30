<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키즈카페 예약</title>
<c:url var="search_kinder" value="resources/hjcss/search_kinder.css"></c:url>
<link href="${search_kinder}" rel="stylesheet" type="text/css" />
<script type="text/javascript">


// //어린이집 목록 불러오기
// function selectKinders() {
// 	//int array send setting
// 	jQuery.ajaxSettings.traditional = true;
	
// 	$(".kinder_list").empty();
	
// 	var sigungucode=document.getElementById("sigungucode").value;
// 	var kinname=document.getElementById("kinname").value;	
	
// 	$.get("select_kinder_map",{"sigungucode":sigungucode, "kinname":kinname}, function(data, state) { 
// // 			alert(data);
// 		if (state == "success") {
// 			//성공한 경우
// // 			alert("GET 성공");
// 			if(data.length==0){
// 				$(".kinder_list").append("<p>검색 결과가 없습니다.</p>");
// 			}
			
// 			for (var i = 0; i < data.length; i++) {
// 				var homepage;
// 				if (data[i].kinhome.startsWith("http")) {
// 					homepage="<a href="+data[i].kinhome+" target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
// 				} else if (data[i].kinhome.startsWith("www.")||data[i].kinhome.startsWith("club.")||data[i].kinhome.startsWith("blog.")||data[i].kinhome.startsWith("cafe.")||(data[i].kinhome.endsWith(".kr")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".com")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".net")&&data[i].kinhome.indexOf("@")==-1)) {
// 					homepage="<a href='http://"+data[i].kinhome+"' target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
// 				} else {
// 					homepage="";
// 				}
// 				$(".kinder_list").append("<table><tr><td colspan='2'><span title="+data[i].kinname+" onclick=''><img alt='marker' class='marker' src='resources/images/map_markers/marker"+(i+1)+".png'>"+data[i].kinname+"</span>"+homepage+"</td></tr><tr><td colspan='2'>"+data[i].kinaddress+"</td></tr><tr><td colspan='2'>"+data[i].kinphone+"</td></tr><tr><td>유형 : "+data[i].kinkind+"</td><td>학급(반)수 : "+data[i].kinroom+"</td></tr><tr><td>현/정원 : "+data[i].kincurrent+"/"+data[i].kinmax+"</td><td>교직원수 : "+data[i].kinteacher+"</td></tr><tr height='7'><td colspan='2'><hr /></td></tr></table>");
// // 				$(".kinder_list").append("<tr><td>"+(i+1)+"</td><td>"+data[i].sido+"&nbsp;"+data[i].sigungu+"</td><td style='font-weight:bold;'><a title='자세히 보기' class='detail_kinder' onclick='detailkinder();'>"+data[i].kinname+"</a></td><td>"+data[i].kinkind+"</td><td>"+data[i].kinroom+"</td><td>"+data[i].kinmax+"</td><td>"+data[i].kincurrent+"</td><td>"+data[i].kinteacher+"</td><td>"+homepage+"</td></tr>")
				
// 			}
// 		} else {
// 			//실패한 경우
// 			alert("GET 실패");
// 		}
// 	});
// }

</script>
</head>
<body>

<!-- <div class="page_name"> -->
<!-- 	<h2>통합검색</h2><br> -->
<!-- 	<a href="search_keyword"><span class="sp4">검색으로 찾기</span></a> -->
<!-- 	<span class="sp3">지역별 찾기</span> -->
<!-- </div> -->
	
<!-- <div class="kinder_search">	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             -->
<!-- 	<ul> -->
<!-- 		<li class="basis"><p>시도</p> -->
<!-- 			<select title="시도 선택"> -->
<!--               <option disabled="disabled">== 선택 ==</option> -->
<!--               <option value="" selected="selected">서울특별시</option> -->
<!--             </select> -->
<!-- 		</li> -->
<!-- 		<li class="basis"><p>시군구</p> -->
<!-- 			<select title="시군구 선택" id="sigungucode"> -->
<!--               <option disabled="disabled">== 선택 ==</option> -->
<!--               <option value="1" selected="selected">강남구</option> -->
<!--               <option value="2">강동구</option> -->
<!--               <option value="3">강북구</option> -->
<!--               <option value="4">강서구</option> -->
<!--               <option value="5">관악구</option> -->
<!--               <option value="6">광진구</option> -->
<!--               <option value="7">구로구</option> -->
<!--               <option value="8">금천구</option> -->
<!--               <option value="9">노원구</option> -->
<!--               <option value="10">도봉구</option> -->
<!--               <option value="11">동대문구</option> -->
<!--               <option value="12">동작구</option> -->
<!--               <option value="13">마포구</option> -->
<!--               <option value="14">서대문구</option> -->
<!--               <option value="15">서초구</option> -->
<!--               <option value="16">성동구</option> -->
<!--               <option value="17">성북구</option> -->
<!--               <option value="18">송파구</option> -->
<!--               <option value="19">양천구</option> -->
<!--               <option value="20">영등포구</option> -->
<!--               <option value="21">용산구</option> -->
<!--               <option value="22">은평구</option> -->
<!--               <option value="23">종로구</option> -->
<!--               <option value="24">중구</option> -->
<!--               <option value="25">중랑구</option> -->
<!--             </select> -->
<!-- 		</li> -->
<!-- 		<li class="basis"> -->
<!--           <input type="search" id="kinname" title="어린이집명을 입력하세요." placeholder="기관명" style="padding: 0;"/> -->
<!--         </li><br> -->
<!--         <li class="basis"><button class="btn search_btn" type="button" onclick="selectKinders();">검색</button></li> -->
<!-- 	</ul> -->
	
<!-- 	<div class="search_result"> -->
<!-- 		<div class="kinder_list"> -->
<!-- 			<p>검색 결과가 없습니다.</p> -->
<!-- <!-- 			<table><tr onclick=""><td colspan="2"><img alt="marker" class="marker" src="resources/images/map_markers/marker1.png"> 어린이집명(홈피)</td></tr><tr><td colspan="2">주소</td></tr><tr><td colspan="2">전화번호</td></tr><tr><td>유형</td><td>학급(반)수</td></tr><tr><td>정현원</td><td>교직원수</td></tr>	<tr height="7"><td colspan="2"><hr /></td></tr></table>   --> -->
<!-- 			<table> -->
<!-- 				<tr><td colspan="2"><span title="" onclick="kinnameClick1();"><img alt="marker" class="marker" src="resources/images/map_markers/marker1.png">어린이집명</span>(홈피)</td></tr> -->
<!-- 				<tr><td colspan="2">주소</td></tr> -->
<!-- 				<tr><td colspan="2">전화번호</td></tr> -->
<!-- 				<tr><td>유형</td><td>학급(반)수</td></tr> -->
<!-- 				<tr><td>정현원</td><td>교직원수</td></tr> -->
<!-- 				<tr height="7"> -->
<!-- 	                <td colspan="2"><hr /></td> -->
<!-- 	            </tr> -->
<!-- 	        </table>     -->
<!-- 	        <table> -->
<!-- 				<tr><td colspan="2"><span title="" onclick="kinnameClick2();"><img alt="marker" class="marker" src="resources/images/map_markers/marker2.png">어린이집명</span>(홈피)</td></tr> -->
<!-- 				<tr><td colspan="2">주소</td></tr> -->
<!-- 				<tr><td colspan="2">전화번호</td></tr> -->
<!-- 				<tr><td>유형</td><td>학급(반)수</td></tr> -->
<!-- 				<tr><td>정현원</td><td>교직원수</td></tr> -->
<!-- 				<tr height="7"> -->
<!-- 	                <td colspan="2"><hr /></td> -->
<!-- 	            </tr> -->
<!-- 			</table> -->
			
<!-- 		</div> -->
		
<!-- 		<div id="map"></div> -->

<!-- 	</div> -->
<!-- </div> -->


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ddb1ae3987ac8ed2fa4826d70124a52&libraries=services"></script>
<script>

	
// var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
// mapOption = {
//     center: new daum.maps.LatLng(37.499700, 127.030300), // 지도의 중심좌표
//     level: 3 // 지도의 확대 레벨
// };

// //지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
// var map = new daum.maps.Map(mapContainer, mapOption);

// var geocoder = new daum.maps.services.Geocoder(); // 좌표계 변환 객체를 생성합니다
// wtmX = 186610.12737100000  ; // 변환할 WTM X 좌표 입니다
// wtmY = 448330.15263500000  ; // 변환할 WTM Y 좌표 입니다

// //WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
// geocoder.transCoord(wtmX, wtmY, transCoordCB, {
// input_coord: daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
// output_coord: daum.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
// });

// //좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
// function transCoordCB(result, status) {

// // 정상적으로 검색이 완료됐으면 
// if (status === daum.maps.services.Status.OK) {

//     // 마커를 변환된 위치에 표시합니다
//     var marker = new daum.maps.Marker({
//         position: new daum.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
//         map: map // 마커를 표시할 지도객체입니다
//     })
// }
// }


</script>
</body>
</html>