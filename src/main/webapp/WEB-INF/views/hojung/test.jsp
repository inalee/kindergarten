<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키즈카페 리스트</title>
<c:url var="kidscafelist" value="resources/hjcss/kidscafelist.css"></c:url>
<link href="${kidscafelist}" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="kidscafe_search">	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	<div style="height: 50px;"></div>
	<div class="search_result">
		<div class="kidscafe_list">
			<div class="listMap">
				<c:forEach items="${kidscafe_list}" var="kidscafe" varStatus="status">
					<c:if test="${kidscafe.cfphone==''}">
						<c:set var="cfphone" value="상세페이지 참조"></c:set>
					</c:if>
					<c:if test="${kidscafe.cfphone!=''}">
						<c:set var="cfphone" value="${kidscafe.cfphone}"></c:set>
					</c:if>
					
					<fmt:formatDate value="${kidscafe.cfpermit}"  var="cfpermit" pattern="yyyy-MM-dd"/>
					<table onmouseover="kidscafeOver(${status.count}, '${kidscafe.cfname}');" onmouseout="kidscafeOut(${status.count});" onclick="kidscafeRespage(${kidscafe.cfcode});">
						<tr><td rowspan="7"><img alt="noimage" class="noimage" src="resources/images/noimage.gif"></td></tr>
						<tr><td colspan="2"><img alt="marker" class="marker" src="resources/images/map_markers/marker${status.count}.png">${kidscafe.cfname}</td></tr>
						<tr><td colspan="2">${kidscafe.address}</td></tr>
						<tr><td>전화번호 : ${cfphone}</td><td>운영시간 : ${kidscafe.cfopen}시 ~ ${kidscafe.cfclose}시</td></tr>
						<tr><td>면적 : ${kidscafe.cfarea}</td><td>인가일자 : ${cfpermit}</td></tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr><td colspan="2">&nbsp;</td></tr>
			        </table>
				</c:forEach>	
			</div>
			<!-- 페이징 -->
			<div class="paginationMap">
				<ul>
				
				</ul>
			</div>        
		</div>
		
		<div id="map"></div>
		
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ddb1ae3987ac8ed2fa4826d70124a52&libraries=services"></script>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.499569, 127.029332), //지도의 중심좌표.
		level: 4, //지도의 레벨(확대, 축소 정도)
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
	
	
	
	$(document).ready(function(){
		
// 		console.log('${kidscafe_list}')
//  	console.log('${kidscafe_list_json}')
 		// kidscafe_list의 json화
 		var data = JSON.parse('${kidscafe_list_json}'); //검색된 데이터 저장
//  		console.log(data);
 		var pagination = []; //페이지 배열
 		var currentPage = 1; //현재 페이지
 		
 		$(".listMap").empty();
		$(".paginationMap ul").empty();
// 		infowindow.close(map, selectedMarker); // 윈도인포우 닫기
		removeMarkers(); // 지도 위의 마커를 모두 제거
 		
 		if(data.length==0){
			$(".kidscafe_list").append("<p>검색 결과가 없습니다.</p>");
		}
		
 		// 페이지 배열에 넣기
		for (var i = 1; i <= ((data.length-1)/10)+1; i++) {
			pagination.push(i);
		}
		
		if(data.length!=0) {
			// 1페이지로 초기화
			goPage(1);
		}
 		
//  		var bounds = new daum.maps.LatLngBounds(); // 지도 범위를 재설정하기 위한 새로운 bounds
			
// 		for (var i = 0; i < data.length; i++) {
// 			// 마커를 생성하고 지도에 표시
// 			makeMarkers(i+1, data[i].coordinatex, data[i].coordinatey, bounds, data[i].cfname);
// 		}
	});
	

	var originalImage = []; // originalImage를 담을 배열
	var overImage = []; // overImage를 담을 배열
	var marker = []; // marker를 담을 배열
	selectedMarker = null; // 클릭한 마커를 담을 변수
	selectedNum = null; // 클릭한 마커의 인덱스를 담을 변수
	
	// 커스텀 오버레이
	var overlay, overlay_semi;
	// 커스텀 오버레이의 content
	var content, content_semi;
	
	var geocoder = new daum.maps.services.Geocoder(); // 좌표계 변환 객체를 생성합니다
	
	function makeMarkers(num, coordinatex, coordinatey, bounds, cfname) {
		
		var la, lo;// 위도, 경도
	
		// WTM 좌표를 WGS84 좌표계의 좌표로 변환 후 지도에 표시
		geocoder.transCoord(coordinatex, coordinatey, transCoordCB, {
		    input_coord: daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
		    output_coord: daum.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
		});
	    
		// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
		function transCoordCB(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		    if (status === daum.maps.services.Status.OK) {
		    	la = result[0].y;
		    	lo = result[0].x;
		    	
			 	// 마커 이미지를 생성한다
				originalImage[num] = new daum.maps.MarkerImage("resources/images/map_markers/marker"+num+".png", new daum.maps.Size(70, 53));
				overImage[num] = new daum.maps.MarkerImage("resources/images/map_markers/marker"+num+".png", new daum.maps.Size(90, 66));

				//지도에 마커를 생성하고 표시한다
				marker[num] = new daum.maps.Marker({
				    position: new daum.maps.LatLng(la, lo), // 마커의 좌표
				    draggable : false, // 마커를 드래그 불가능하도록 설정한다
				    image : originalImage[num], // 마커의 이미지
				    map: map // 마커를 표시할 지도 객체
				});
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가
		         bounds.extend(new daum.maps.LatLng(la, lo));

				// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
				daum.maps.event.addListener(marker[num], 'click', function() {

					// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
			        if (!selectedMarker || selectedMarker != marker[num]) {
			        	// selectedMarker가 있다면
			        	if(selectedMarker) {
			        		// selectedMarker의 커스텀오버레이를 닫는다
			        		overlay.setMap(null);
				            // selectedMarker의 이미지를 기본 이미지로 바꾼다
				            selectedMarker.setImage(originalImage[selectedNum]);
			        	}
			        	
			            // 현재 마커의 overlay_semi를 닫는다
			            overlay_semi.setMap(null);
			         	// 마커 위에 표시할 커스텀 오버레이의 content 변경
				    	 content = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + 
				            '            키즈카페 이름' + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img alt="noimage" class="noimage" src="resources/images/noimage.gif" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">주소</div>' + 
				            '                <div class="jibun ellipsis">세부사항</div>' + 
				            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';
				            
				        // 마커 위에 커스텀오버레이를 표시
			        	overlay = new daum.maps.CustomOverlay({
			        	    content: content,
			        	    map: map,
			        	    position: marker[num].getPosition()       
			        	});
			        	// 현재 클릭된 마커의 커스텀오버레이를 지도에 표시한다
			        	overlay.setMap(map);
			         	// 지도 중심을 이동 시킵니다
			    	    map.panTo(new daum.maps.LatLng(la, lo));
			    	 	// 클릭된 마커를 현재 클릭된 마커 객체로 설정한다
				        selectedMarker = marker[num];
			    	 	selectedNum = num;
			        }
				});
				
				// 마커에 mouseover 이벤트를 등록한다
				daum.maps.event.addListener(marker[num], 'mouseover', function() {
					kidscafeOver(num, cfname);
				});

				// 마커에 mouseout 이벤트 등록
				daum.maps.event.addListener(marker[num], 'mouseout', function() {
					kidscafeOut(num);
				});
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정
			    map.setBounds(bounds);
		    } else {
		    	alert("좌표 변환 실패");
		    }
		}
	}
	
	//table, maker onmouseover 함수
	function kidscafeOver(num, cfname) {
		
		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
	     if (!selectedMarker || selectedMarker != marker[num]) {
	    	 marker[num].setImage(overImage[num]);
	    	 
	    	// 마커 위에 표시할 커스텀 오버레이의 content_semi 변경
	    	 content_semi = '<div class="wrap_semi">' + 
	            '    <div class="info_semi">' + 
	            '        <div class="body_semi">'+cfname+'</div>' + 
	            '    </div>' +    
	            '</div>';
	            
	        // 마커 위에 커스텀오버레이를 표시
        	overlay_semi = new daum.maps.CustomOverlay({
        	    content: content_semi,
        	    map: map,
        	    position: marker[num].getPosition()       
        	});
	        
        	// 현재 mouseover된 마커의 커스텀오버레이를 지도에 표시한다
        	overlay_semi.setMap(map);
	         
	     }
	}
	
	//table, maker onmouseout 함수
	function kidscafeOut(num) {
		
		 // 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
	     if (!selectedMarker || selectedMarker != marker[num]) {
	    	 marker[num].setImage(originalImage[num]);
	    	// mouseout된 커스텀오버레이를 닫는다
	    	 overlay_semi.setMap(null);   
	     }
	}
	
	
	//table onclick 함수
	function kidscafeRespage(cfcode) {
		location.href="cafereservation?cfcode="+cfcode;
	}

	// 커스텀 오버레이 닫기
	function closeOverlay() {
	    overlay.setMap(null);     
	 	// selectedMarker의 이미지를 기본 이미지로 바꾼다
        selectedMarker.setImage(originalImage[selectedNum]);
	 	// selectedMarker 초기화
        selectedMarker = null;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarkers() {
		for ( var i = 0; i < marker.length; i++ ) {
			marker[i].setMap(null);
	    }   
		marker = [];
	}
	
	
	//페이징 함수
	function goPage(page) {
// 		infowindow.close(map, selectedMarker); // 윈도인포우 닫기
		removeMarkers(); // 지도 위의 마커를 모두 제거
		
		currentPage = page;
		
		var startPage = parseInt((currentPage-1)/5)*5+1;
		var endPage = parseInt((currentPage-1)/5)*5+5;
		if(endPage>pagination.slice(-1)[0]) {
			endPage = pagination.slice(-1)[0]
		}
		
		$(".paginationMap ul").empty();
		
		// 첫번째 페이지 아닐 때
		if(currentPage!=1) {
			$(".paginationMap ul").append("<li class='pageFunc' onclick='prevPage()'>&laquo;</li>");
		}
		for (var i = startPage; i <= endPage; i++) {
			if(i==currentPage){
				$(".paginationMap ul").append("<li id='"+i+"' class='active' onclick='goPage(this.id)'>"+i+"</li>");
			} else {
				$(".paginationMap ul").append("<li id='"+i+"' onclick='goPage(this.id)'>"+i+"</li>");
			}
		}
		// 마지막 페이지 아닐 때
		if(currentPage!=pagination.slice(-1)[0]) {
			$(".paginationMap ul").append("<li class='pageFunc' onclick='nextPage()'>&raquo;</li>");
		}
		
		// 데이터 append
		var startIndex = parseInt(currentPage-1)*10;
		var endIndex = parseInt(currentPage)*10-1;
		if(endIndex >= data .length) {
			endIndex = data.length-1;
		}
// 	 	alert(startIndex+", "+endIndex)
		$(".listMap").empty();
		
		bounds = new daum.maps.LatLngBounds(); // 지도 범위를 재설정하기 위한 새로운 bounds

		for (var i = startIndex; i <= endIndex; i++) {

			// 결과 목록 생성
			
			// 마커를 생성하고 지도에 표시
			makeMarkers(i%10, data[i].coordinatex, data[i].coordinatey, bounds, data[i].cfname);
		}
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정
	    map.setBounds(bounds);
		
		//스크롤 맨 위로 
		$(".kidscafe_list").scrollTop(0);
	}

	// 이전 페이지
	function prevPage() {
		goPage(parseInt(currentPage)-1);
	}

	// 다음 페이지
	function nextPage() {
		goPage(parseInt(currentPage)+1);
	}
	

</script>
</body>
</html>