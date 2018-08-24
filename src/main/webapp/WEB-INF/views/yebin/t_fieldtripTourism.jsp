<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f223662ebf0e3a3b6c8816122c75d43&libraries=services,clusterer,drawing"></script>
<c:url var="tab" value="resources/css/yebin-tab.css"></c:url>
<c:url var="step" value="https://www.w3schools.com/w3css/4/w3.css"></c:url>
<c:url var="radio" value="resources/css/yebin-radiobox.css"></c:url>
<c:url var="loading" value="resources/css/yebin-loading.css"></c:url>
<c:url var="images" value="resources/images/"></c:url>
<link href="${radio}" rel="stylesheet" type="text/css"/>
<link href="${calendar}" rel="stylesheet" type="text/css" />
<link href="${tab}" rel="stylesheet" type="text/css" />
<link href="${step}" rel="stylesheet" type="text/css"/>
<link href="${radio}" rel="stylesheet" type="text/css"/>
<link href="${loading}" rel="stylesheet" type="text/css"/>
</head>
<style>
body{
  margin-top: 0px;
  font-family: 'Jeju Gothic', serif;
  line-height: 1.6;
  text-align: center;
}

h4{
  font-family: 'Jeju Gothic', serif;
}

.answerNo{background-color: #2196f3; border: none; color: white; padding: 5px 12px; border-radius : 10px;text-align: center;font-size: 15px;}
.answerYes{background-color: #2196f3; border: none; color: white; padding: 5px 12px; border-radius : 10px;text-align: center;font-size: 15px;}

.btInfoOpen{
	border: none;
	width: 100%;
	background-color: #f9f9f9;
}

.desti{
 margin: auto;
 margin-top: 10px;
/*  width: %; */
 height:100px;
 padding: 10px;
 color: gray;
 border-color: #ffeb3b;
 border: 3px solid;
}

.desti td{
 border: 10px;
 font-size: 100%;
 width:200px;
}

.destiImg{
	height: 100px;

}

</style>
<body>

<!-- 	<div> -->
<!-- 	<form> -->
<!-- 	<input type="text" id="keyword" value="암사동" style=''> -->
<!-- 	<button type="button" onclick="btn()" id='button'>검색</button> -->
<!-- 	</form></div> -->

<p></p>
	
<!-- 	<hr style="border: 2px solid lightgray;"/> -->
<!-- 	<p style='font-size: 20px;'>Q.이 단계만 거치면 코스 선정이 모두 완료됩니다!<br>관광지 목록이나 지도의 Marker를 눌러 관광지를 선택하세요.</p> -->
	<label style="font-size: 30px; text-align: center; width: 100%; background-color: #ffeb3b; margin-top: 20px; padding: 10px">체험학습 코스 선정하기</label>
	<div style="margin-top:20px; margin: auto; width: 100%; float: none; text-align: center;"><table class='desti' ><tr id='containCont'></tr></table></div>
	<p></p>
	<div style='margin-left: 19%;'>
	<div id="list" style="float:left; text-align: center; margin: 0 auto; height:400px;">
	<div style="height: 10%; background-color: #ffeb3b; padding-top: 4px; font-size: 20px">주변 관광지 목록
	</div>
	<div style='height: 90%; overflow: auto;'><table id="listTable" style="width: 300px; margin: 0 auto;"></table>
	</div>
	</div>
	<div id="map" style=" float:left; width: 50%; height: 400px;">
	</div>
	</div>
	

	<script>
	// 장소 초기화
	var infowindow = new daum.maps.InfoWindow({zIndex : 1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3// 지도의 확대 레벨
	};

	// 지도 생성    
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	var geocoder = new daum.maps.services.Geocoder();
	
	var keyword = "${keyword}";
// 	  	alert(keyword);
		var x;
		var y;

		


	//받은 주소로 지도 검색
		geocoder.addressSearch(keyword, function(result, status) {
			
		

							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {
								new daum.maps.LatLng(result[0].y, result[0].x);
								y = result[0].y;
								x = result[0].x;

								var imageSrc = "${images}yebin-icon-home2.png";
								var imageSize = new daum.maps.Size(37,50);
								var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
								
								var marker = new daum.maps.Marker({
									map : map,
									position : new daum.maps.LatLng(y, x),
									image : markerImage
								});
							
								infowindow.setContent("<div style='width:150px; color: #2196f3; font-size:20px; text-align:center;'>체험학습 장소</div>");
								infowindow.open(map,marker);
								
								// 마커에 클릭이벤트를 등록합니다
								daum.maps.event.addListener(marker,'click',function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent("<div style='width:150px; color: #2196f3; font-size:20px; text-align:center;'>체험학습 장소</div>");
								infowindow.open(map,marker);
								});
								
								// 키워드로 장소를 검색합니다
								ps.keywordSearch(keyword +' 관광', placesSearchCB);

								// 키워드 검색 완료 시 호출되는 콜백함수 입니다
								
								function placesSearchCB(data, status, pagination) {
									
									if (status === daum.maps.services.Status.OK) {
										// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										// LatLngBounds 객체에 좌표를 추가합니다
										var bounds = new daum.maps.LatLngBounds();
										$(".desti tr").append("<td id='desti1'><img class='destiImg'src='${images}yebin-icon-home2.png'><p><label>"+keyword+"</label></td>");			
										
										for (var i = 0; i < data.length; i++) {
											displayMarker(data[i]);
											bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
											$("#listTable").append("<tr><td><button class= 'btInfoOpen' id='btInfoOpen"+data[i].id+"'>"+data[i].place_name+"</button></td></tr>")
											map.setBounds(bounds);
									
										}
										// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
										 
									} else if (status === daum.maps.services.Status.ZERO_RESULT) {
								        alert('주변 관광지 검색 결과가 존재하지 않습니다.');
								        $(".desti tr").append("<td id='desti1'><img class='destiImg'src='${images}yebin-icon-home2.png'><p><label>"+keyword+"</label></td>");			
								        return;

								    } else if (status === daum.maps.services.Status.ERROR) {
								    	  $(".desti tr").append("<td id='desti1'><img class='destiImg'src='${images}yebin-icon-home2.png'><p><label>"+keyword+"</label></td>");			
								        alert('주변 관광지 검색 결과를 받던 중 오류가 발생했습니다.');
								        return;

								    }
								}
								
								
								var imageSrc = "${images}yebin-icon-search.png";
								var imageSize = new daum.maps.Size(25,33);
								var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

								// 지도에 마커를 표시하는 함수입니다
								function displayMarker(place) {
									
									console.log(place)
									
									var infoWin = '#btInfoOpen'+place.id;
									
									$(function() {
									$(infoWin).on('click', function() {
										daum.maps.event.trigger(marker, 'click');
									})	
								})
									
									
									
									
									// 마커를 생성하고 지도에 표시합니다
									var marker = new daum.maps.Marker({
										map : map,
										position : new daum.maps.LatLng(place.y, place.x),
										image : markerImage
									});
									
									// 맵 클릭 시 인포 윈도우 닫기
									 daum.maps.event.addListener(map, 'click', function() {
										        // 마커 위에 인포윈도우를 표시합니다
										        infowindow.close();
							         });
								
									// 마커에 클릭이벤트를 등록합니다
									daum.maps.event.addListener(marker, 'click', function() {
									// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
// 									var iwContent = '<div style="height: 100px;">'+place.place_name+'관심 항목으로 지정하시겠습니까? <button class=\'answerYes\' onclick=\'placeMark('+place.x+','+place.y+','+place.id+')\'>네</button><button class=\'answerNo\' onclick=\'infoClose()\'>아니오</button></div>';
									
									var iwContent = '<div style="height: 170px; padding:5px; width: 250px"><table style="text-align: center; width: 240px"><tr style="background-color: #ffeb3b"><td>'+place.place_name+'</td></tr><tr><td style=\'font-size: 10px;\'>'+place.category_name+'</td></tr><tr style="color:blue"><td style=\'font-size: 15px;\'><button style=\'border:none;\' onclick=\'openUrl(\"'+place.place_url+'\")\'>상세 정보 보기</button></td></tr><tr><td style=\'font-size: 13px;\'>견학코스로 추가 할까요?</td></tr><tr><td><button class=\'answerYes\' onclick=\'placeMark('+place.x+','+place.y+','+place.id+',\"'+place.place_name+'\",\"'+place.address_name+'\",\"'+place.place_url+'\"'+')\'>네</button>&nbsp;<button class=\'answerNo\' onclick=\'infoClose()\'>아니오</button></td></tr></table></div>'
									infowindow.setContent(iwContent);
									infowindow.open(map,marker);
									});
						
								}
									
							} else if (status === daum.maps.services.Status.ZERO_RESULT) {
						        alert('주변 관광지 검색 결과가 존재하지 않습니다.');
						        $(".desti tr").append("<td id='desti1'><img class='destiImg'src='${images}yebin-icon-home2.png'><p><label>"+keyword+"</label></td>");			
						        return;

						    } else if (status === daum.maps.services.Status.ERROR) {
						    	  $(".desti tr").append("<td id='desti1'><img class='destiImg'src='${images}yebin-icon-home2.png'><p><label>"+keyword+"</label></td>");			
						        alert('주변 관광지 검색 결과를 받던 중 오류가 발생했습니다.');
						        return;

						    }
							
							
						});
		

	var tourInfo = [];
	
	//관광지 설정
	function placeMark(x, y, id, placeName, placeAddr, placeUrl) {
		infoClose();
	 	
		//마커 이미지 설정
		var imageSrc = "${images}yebin-icon-like2.png";
		var imageSize = new daum.maps.Size(37,50);
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		
		//마커 생성
		var marker = new daum.maps.Marker({
			map : map,
			position : new daum.maps.LatLng(y, x),
			image : markerImage
		});
		$(function() {
			$("#containCont").append("<td id='desti1'><img class='destiImg' src='${images}yebin-icon-like2.png'><p><label>"+placeName+"</label></td>");			
			//json형태로 배열에 정보 집어넣기
			tourInfo.push("{'placeName' : '"+placeName+"', 'placeAddr' : '"+placeAddr+"', 'placeUrl' : '"+placeUrl+"'}");
			console.log(tourInfo);
		})
		
// 		//맵에 마커 찍기
// 		displayMarker(marker);
	
	}
	
	//선택한 info윈도우 열기
	function infoOpen() {
		daum.maps.event.trigger(marker, 'click');
	}
	
	//열려있는 info윈도우 닫기
	function infoClose(){
		daum.maps.event.trigger(map, 'click');
	}
	
	//팝업으로 블로그 확인하기
	function openUrl(url){
		var popUrl = url;	//팝업창에 출력될 페이지 URL
		var popOption = "width=900, height="+ screen.height;    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
	
	//DB에 저장 후 다음 단계로 넘어가기
	$(function() {
		window.parent.$("#ifmom").on('click', function() {
			
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url:'/kinder/saveCourse',
				type:'post',
				data: {
					tourCourse : tourInfo
						}
			})
			
			$(function(){
				window.parent.openStep(event, 'step7', 'id7');
				window.parent.$('#id7').attr('disabled', false);

		})
	})
	});
	
	</script>
	
</body>

</html>

