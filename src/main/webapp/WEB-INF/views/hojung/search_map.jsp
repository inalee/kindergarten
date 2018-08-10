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
			<p>검색 조건을 입력해주세요.</p>			
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
	
	
	//어린이집 목록 불러오기
	function selectKinders() {
		//int array send setting
		jQuery.ajaxSettings.traditional = true;
		
		$(".kinder_list").empty();
		
		var sigungucode=document.getElementById("sigungucode").value;
		var kinname=document.getElementById("kinname").value;	
		
		$.get("select_kinder_map",{"sigungucode":sigungucode, "kinname":kinname}, function(data, state) { 
//	 			alert(data);
			if (state == "success") {
				//성공한 경우
//	 			alert("GET 성공");
				if(data.length==0){
					$(".kinder_list").append("<p>검색 결과가 없습니다.</p>");
				}
					
					infowindow.close(map, selectedMarker); // 윈도인포우 닫기
					removeMarkers(); // 지도 위의 마커를 모두 제거
					bounds = new daum.maps.LatLngBounds(); // 지도 범위를 재설정하기 위한 새로운 bounds
					
	 				for (var i = 0; i < data.length; i++) {
// 					for (var i = 0; i < 10; i++) {
	
						var homepage;
						if (data[i].kinhome.startsWith("http")) {
							homepage="<a href="+data[i].kinhome+" target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
						} else if (data[i].kinhome.startsWith("www.")||data[i].kinhome.startsWith("club.")||data[i].kinhome.startsWith("blog.")||data[i].kinhome.startsWith("cafe.")||(data[i].kinhome.endsWith(".kr")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".com")&&data[i].kinhome.indexOf("@")==-1)||(data[i].kinhome.endsWith(".net")&&data[i].kinhome.indexOf("@")==-1)) {
							homepage="<a href='http://"+data[i].kinhome+"' target='_blank' title='"+data[i].kinhome+"'><img alt='홈페이지' class='homepageimg2' src='resources/images/homepage.png'></a>";
						} else {
							homepage="";
						}
	 					$(".kinder_list").append("<table><tr><td colspan='2'><span title="+data[i].kinname+" onclick=\"kinnameClick("+(i+1)+", "+data[i].kinla+", "+data[i].kinlo+", \'"+data[i].kinname+"\', \'"+data[i].kinaddress+"\', \'"+data[i].kinphone+"\', \'"+data[i].kinhome+"\', \'"+data[i].kincode2+"\')\"><img alt='marker' class='marker' src='resources/images/map_markers/marker"+(i+1)+".png'>"+data[i].kinname+"</span>"+homepage+"</td></tr><tr><td colspan='2'>"+data[i].kinaddress+"</td></tr><tr><td colspan='2'>"+data[i].kinphone+"</td></tr><tr><td>유형 : "+data[i].kinkind+"</td><td>학급(반)수 : "+data[i].kinroom+"</td></tr><tr><td>현/정원 : "+data[i].kincurrent+"/"+data[i].kinmax+"</td><td>교직원수 : "+data[i].kinteacher+"</td></tr><tr height='7'><td colspan='2'><hr /></td></tr></table>");
	 					
						// 마커를 생성하고 지도에 표시
				        makeMarkers(i+1, data[i].kinla, data[i].kinlo, bounds, data[i].kinname, data[i].kinaddress, data[i].kinphone, data[i].kinhome, data[i].kincode2);
						
					}
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정
		    	    map.setBounds(bounds);
				
			} else {
				//실패한 경우
				alert("GET 실패");
			}
		});
	}
	
		
		
	var originalImage = []; // originalImage를 담을 배열
	var overImage = []; // overImage를 담을 배열
	var marker = []; // marker를 담을 배열
	selectedMarker = null; // 클릭한 마커를 담을 변수
	
	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new daum.maps.InfoWindow({
	    content : '<div style="padding:5px;"></div>' // 인포윈도우에 표시할 내용
	});
	
	function makeMarkers(num, la, lo, bounds, kinname, kinaddress, kinphone, kinhome, kincode2) {
		
		var info_homepage;
		
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
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(new daum.maps.LatLng(la, lo));

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		daum.maps.event.addListener(marker[num], 'click', function() {
			
			if (kinhome.startsWith("http")) {
				info_homepage="<a href="+kinhome+" target='_blank'>"+kinhome+"</a>";
			} else if (kinhome.startsWith("www.")||kinhome.startsWith("club.")||kinhome.startsWith("blog.")||kinhome.startsWith("cafe.")||(kinhome.endsWith(".kr")&&kinhome.indexOf("@")==-1)||(kinhome.endsWith(".com")&&kinhome.indexOf("@")==-1)||(kinhome.endsWith(".net")&&kinhome.indexOf("@")==-1)) {
				info_homepage="<a href=\'http://"+kinhome+"\' target='_blank'>"+kinhome+"</a>";
			} else {
				info_homepage= kinhome;
			}

			// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
	        if (!selectedMarker || selectedMarker != marker[num]) {
	        	// selectedMarker의 인포윈도우를 닫는다
	            infowindow.close(map, selectedMarker);
	         	// 마커 위에 표시할 인포윈도우의 content 변경
	            infowindow = new daum.maps.InfoWindow({
	        	    content : '<div style="padding:5px;"><div class="content"><ul><li><img alt="marker" class="marker" src="resources/images/map_markers/marker'+num+'.png"><a class="detail_kinder" onclick="detailkinder('+kincode2+');">'+kinname+'</a></li><hr/><li>'+kinaddress+'</li><li>'+kinphone+'</li><li>'+info_homepage+'</li><li><button type="button" onclick="detailkinder('+kincode2+');">상세보기&nbsp;<i class="arrow right"></i>&nbsp;</button></li></ul></div></div>' // 인포윈도우에 표시할 내용
	        	});
	            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
	            infowindow.open(map, marker[num]);
	         	// 지도 중심을 이동 시킵니다
	    	    map.panTo(new daum.maps.LatLng(la, lo));
	        }
	        // 클릭된 마커를 현재 클릭된 마커 객체로 설정한다
	        selectedMarker = marker[num];
		});
		
		// 마커에 mouseover 이벤트를 등록한다
		daum.maps.event.addListener(marker[num], 'mouseover', function() {
	        marker[num].setImage(overImage[num]);		
		});

		// 마커에 mouseout 이벤트 등록
		daum.maps.event.addListener(marker[num], 'mouseout', function() {
	        marker[num].setImage(originalImage[num]);
		});
	}
	
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarkers() {
		for ( var i = 1; i < marker.length; i++ ) {
			marker[i].setMap(null);
	    }   
		marker = [];
	}
	
	
	//kinname 클릭 함수
	function kinnameClick(num, la, lo, kinname, kinaddress, kinphone, kinhome, kincode2) {
		
		var info_homepage;
		
		if (kinhome.startsWith("http")) {
			info_homepage="<a href="+kinhome+" target='_blank'>"+kinhome+"</a>";
		} else if (kinhome.startsWith("www.")||kinhome.startsWith("club.")||kinhome.startsWith("blog.")||kinhome.startsWith("cafe.")||(kinhome.endsWith(".kr")&&kinhome.indexOf("@")==-1)||(kinhome.endsWith(".com")&&kinhome.indexOf("@")==-1)||(kinhome.endsWith(".net")&&kinhome.indexOf("@")==-1)) {
			info_homepage="<a href=\'http://"+kinhome+"\' target='_blank'>"+kinhome+"</a>";
		} else {
			info_homepage= kinhome;
		}
		
		// 클릭된 마커가 없거나 selectedMarker가 클릭된 마커가 아니면
        if (!selectedMarker || selectedMarker != marker[num]) {
        	// selectedMarker의 인포윈도우를 닫는다
            infowindow.close(map, selectedMarker);         	
         	// 마커 위에 표시할 인포윈도우의 content 변경
            infowindow = new daum.maps.InfoWindow({
        	    content : '<div style="padding:5px;"><div class="content"><ul><li><img alt="marker" class="marker" src="resources/images/map_markers/marker'+num+'.png"><a class="detail_kinder" onclick="detailkinder('+kincode2+');">'+kinname+'</a></li><hr/><li>'+kinaddress+'</li><li>'+kinphone+'</li><li>'+info_homepage+'</li><li><button type="button" onclick="detailkinder('+kincode2+');">상세보기&nbsp;<i class="arrow right"></i>&nbsp;</button></li></ul></div></div>' // 인포윈도우에 표시할 내용
        	});
            // 현재 클릭된 마커의 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker[num]);
        	// 지도 중심을 이동 시킵니다
    	    map.panTo(new daum.maps.LatLng(la, lo));
        }
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정한다
        selectedMarker = marker[num];
	}
	
	
	//어린이집 자세히 보기 팝업창
	function detailkinder(kincode){
		
		var popUrl = "http://info.childcare.go.kr/info/pnis/search/preview/SummaryInfoSlPu.jsp?flag=YJ&STCODE_POP="+kincode;	//팝업창에 출력될 페이지 URL
		var popOption = "width=810, height=940 top=50 left=300";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);	

	}	


</script>
</body>
</html>