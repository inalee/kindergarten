<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<c:url var="tab" value="resources/css/yebin-tab.css"></c:url>
<c:url var="step" value="https://www.w3schools.com/w3css/4/w3.css"></c:url>
<c:url var="radio" value="resources/css/yebin-radiobox.css"></c:url>
<c:url var="loading" value="resources/css/yebin-loading.css"></c:url>
<link href="${radio}" rel="stylesheet" type="text/css"/>
<link href="${calendar}" rel="stylesheet" type="text/css" />
<link href="${tab}" rel="stylesheet" type="text/css" />
<link href="${step}" rel="stylesheet" type="text/css"/>
<link href="${radio}" rel="stylesheet" type="text/css"/>
<link href="${loading}" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
body{
  margin-top: 0px;
  font-family: 'Jeju Gothic', serif;
  line-height: 1.6
}

.w3-container{
display:none;
text-align: center;
}

.headline{
font-size: 30px;
text-align: center;
color: black;
margin-top: 30px;
}

.btNext {
    background-color: #2196f3; /* blue */
    border: none;
    color: white;
    padding: 13px 32px;
    border-radius : 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-top : 30px;
    font-size: 20px;
}

.explainLabel {
    background-color: #ffeb3b; /* yellow */
    border: none;
    color: black;
    padding: 12px 32px;
    border-radius : 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin : 10px;
    font-size: 20px;
}

.select {
    width: 30%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}


</style>
</head>

<body>

<div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:200px">
  <h3 class="w3-bar-item" style="font-weight: bold;">[Step]</h3>
  <button class="w3-bar-item w3-button tablink" id="id1" onclick="openStep(event, 'step1', 'id1')">1. 체험학습 분류</button>
  <button class="w3-bar-item w3-button tablink" id="id2" onclick="openStep(event, 'step2', 'id2')" disabled="disabled">2. 지역/날짜/인원 선택</button>
  <button class="w3-bar-item w3-button tablink" id="id3" onclick="openStep(event, 'step3', 'id3')" disabled="disabled">3. 체험학습 검색</button>
  <button class="w3-bar-item w3-button tablink" id="id4" onclick="openStep(event, 'step4', 'id4')" disabled="disabled">4. 체험학습 후보지 저장</button>
  <button class="w3-bar-item w3-button tablink" id="id5" onclick="openStep(event, 'step5', 'id5')" disabled="disabled">5. 후보지 줄이기</button>
  <button class="w3-bar-item w3-button tablink" id="id6" onclick="openStep(event, 'step6', 'id6')" disabled="disabled">6. 주변 관광지 찾기</button>
  <button class="w3-bar-item w3-button tablink" id="id7" onclick="openStep(event, 'step7', 'id7')" disabled="disabled">7. 체험학습 준비물 체크</button>
  <button class="w3-bar-item w3-button tablink" id="id8" onclick="openStep(event, 'step8', 'id8')" disabled="disabled">8. 원장님 승인 받기</button>
  <button class="w3-bar-item w3-button tablink" id="id9" onclick="openStep(event, 'step9', 'id9')" disabled="disabled">9. 체험학습 동의서 작성</button>
  <button class="w3-bar-item w3-button tablink" id="id10" onclick="openStep(event, 'step10', 'id10')" disabled="disabled">10. 일정 등록</button>
  <button class="w3-bar-item w3-button tablink" onclick="openStep(event, 'step11')">완료!</button>
  </div>

<div style="margin-left:130px">
<!--   <div class="w3-padding" style="font-size: 30px; text-align: center; margin-top: 30px;">000 선생님을 위한,<br/><a style="font-size: 40px">체험학습 도우미 프로그램</a></div> -->

<!-- Step 1 -->
  <div id="step1" class="w3-container step">
  	<p class="headline">Q. ${tlogin.memname} 선생님, 어떤 체험학습을 알아볼까요?</p>
  <hr style="border: 2px solid lightgray;"/>
<div class="checkContainer">	
  <ul>
  
  <li>
    <input type="radio" id="a-option" name="selector" value="체험시설">
    <label for="a-option" class="title">체험시설</label>
    <div class="check"></div>
  </li>
  
  <li>
    <input type="radio" id="b-option" name="selector" value="전시-공연시설">
    <label for="b-option" class="title">전시/공연시설</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="c-option" name="selector" value="문화재-역사">
    <label for="c-option" class="title">문화재/역사</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="d-option" name="selector" value="자연">
    <label for="d-option" class="title">자연</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="e-option" name="selector" value="관공서">
    <label for="e-option" class="title">관공서</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="f-option" name="selector" value="안전-의료-복지시설">
    <label for="f-option" class="title">안전/의료/복지시설</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="g-option" name="selector" value="연구시설">
    <label for="g-option" class="title">연구시설</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="h-option" name="selector">
    <label for="h-option" class="title">전체</label>
    <div class="check"></div>
  </li>
  
</ul>
</div>
    <br/>
    <button type="button" class="btNext" data-num=1>다음</button>
  </div>
  
  
<!-- Step 2 -->
  <div id="step2" class="w3-container step">
    <p class="headline">Q. 지역/날짜/인원을 선택해주세요.</p>
 	 <hr style="border: 2px solid lightgray;"/>
 	 
 	<p><label class="explainLabel">지역</label><select class="select" id="zone">
 	<option>강원</option></select></p>
 	<p><label class="explainLabel">도시</label><select class="select" id="city"><option>강동구</option></select></p>
 	<p><label class="explainLabel">일정</label><input type="month" class="select" id="month" value="2018-08"></p>
 	<p><label class="explainLabel">인원</label><select class="select" id="person"><option>30명</option></select></p>
 	 
 	 
    <button type="button" class="btNext" data-num=2 id="searchbt">검색!</button>
  </div>

	

  <div id="step3" class="w3-container step">
    <p class="headline">A. 체험학습 검색 결과</p>
 	 <hr style="border: 2px solid lightgray;"/>
		<div class="square">
			<div class="spin"></div>
			<p>Loading..</p>
		</div>
		
		<ul id="uldata"></ul>
	<button type="button" class="btNext" data-num=3>다음</button>
 	 <!-- 검색 조건 받아서 컨트롤러 작동시키기 -->
  </div>

  <div id="step4" class="w3-container step">
    <button type="button" class="btNext" data-num=4>다음</button>
  </div>
  <div id="step5" class="w3-container step">
    <button type="button" class="btNext" data-num=5>다음</button>
  </div>
  <div id="step6" class="w3-container step">
  <button type="button" class="btNext" data-num=6>다음</button>
  </div>
  <div id="step7" class="w3-container step">
  <button type="button" class="btNext" data-num=7>다음</button>
  </div>
  <div id="step8" class="w3-container step">
  <button type="button" class="btNext" data-num=8>다음</button>
  </div>
  <div id="step9" class="w3-container step">
  <button type="button" class="btNext" data-num=9>다음</button>
  </div>
  <div id="step10" class="w3-container step">
  <button type="button" class="btNext" data-num=10>다음</button>
  </div>

</div>

<script>

//다음 버튼으로 탭 이동시키는 함수
$(function() {
	$('.btNext').on('click', function() { 
		var count = Number(this.getAttribute('data-num'))+1;
// 		alert(count)
		for(var i = 0; i < count; i++){
			var doc = "#"+document.getElementsByClassName("tablink")[i].id
			$(doc).trigger('click');
			$(doc).attr('disabled', false);
		}
})
})

function openStep(evt, step, id) {
  var i, x, tablinks;
  x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-yellow", ""); 
  }
  document.getElementById(step).style.display = "block";
  document.getElementById(id).className +=" w3-yellow";
  
//   evt.currentTarget.className += " w3-yellow";
//   console.log(evt.currentTarget.className);
}



//몽고DB에 저장된 areacode 가져와서 뿌리는 ajax 
$(function() {
	$.ajax({
		
	})
})

//조건에 맞춰 검색데이터 불러오는 ajax
$(function() {
	$("#searchbt").on('click', function() {
		$.ajax({
			url: '/kinder/getSerchedResult',
			type: 'get',
			data: {
				term : $('input[type=radio][name=selector]:checked').val(),
				zone : $('#zone').val(),
				city : $('#city').val(),
				date : new Date($('#month').val()),
				person : $('#person').val()
			},
			dataType: 'json',
			success: function(data) {
				$(".square").remove();
				$("#uldata").append("<p class='headline'>Q. 관심있는 장소 골라보세요. </p>")
				for(var i=0; i < data.length; i++){
				$("#uldata").append("<li>"+data[i].title+"</li>");		
				$("#uldata").append("<li><img src="+data[i].thumbnail_url+"></li>");		
				$("#uldata").append("<li> 등록일: "+data[i].post_date+"</li>");	
				$("#uldata").append("<li> 주소:"+data[i].address+"</li>");	
				$("#uldata").append("<li> 웹사이트:"+data[i].website+"</li>");	
				}
			}
	})
	
})
		
})	

</script>

</body>
</html>
