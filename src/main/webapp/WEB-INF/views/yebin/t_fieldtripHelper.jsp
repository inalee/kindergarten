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
<c:url var="images" value="resources/images/"></c:url>
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

.btForselection {
    background-color: #2196f3; /* blue */
    border: none;
    color: white;
    padding: 3px 5px;
    border-radius : 5px;
    text-align: center;
    text-decoration: none;
/*     display: inline-block; */
/*     margin-top : 30px; */
    font-size: 12px;
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

.btlikes {
	text-align: center;
	font-style: inherit;
	border: 0.5px;
	width: 40px;
	background-color: white;
	color: #FAFAFA;
	font-size: 17px;
	
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

<!-- 1. 체험학습 분류 -->
  <div id="step1" class="w3-container step">
  	<p class="headline">Q. ${tlogin.memname} 선생님, 어떤 체험학습을 알아볼까요?</p>
  <hr style="border: 2px solid lightgray;"/>
	<p><label class="explainLabel">대분류</label><select class="select" id="cateMain"><option>---대분류---</option></select></p>
		
	<div class="checkContainer">
  		<ul id="radioBundle"></ul>
	</div>
    <br/>
    <button type="button" class="btNext" data-num=1 id="loadAreacodebt">다음</button>
  </div>
  
  <script>
// 1. 체험학습 분류 - 몽고DB에 저장된 program-category 가져오기 
$(function() {
		$.ajax({
			url: '/kinder/getProgramCategory',
			type: 'get',
			dataType: 'json',
			success: function(data) {
			
				var tempArr = [];
				for(var i = 0; i < data.length; i++){
					if(tempArr.length == 0){
						tempArr.push(data[i].catemain);
						$('#cateMain').append("<option>"+data[i].catemain+"</option>")
					}else{
						var dupliFlag = true;
						for (var j = 0; j < tempArr.length; j++){
							if(tempArr[j] == data[i].catemain){
								dupliFlag = false;
								break;
						}
					}
						if(dupliFlag){
						tempArr.push(data[i].catemain);
						$('#cateMain').append("<option>"+data[i].catemain+"</option>")
						}
				}
			}
			}
		})
})

// 1. 체험학습 분류 - 몽고DB에 저장된 program-category catesub 불러오기
$(function() {
	$('#cateMain').change(function() { 
		$.ajax({
			url: '/kinder/getProgramCategory',
			type: 'get',
			dataType: 'json',
			success: function(data) {
				$('#radioBundle').empty();
				
				for (var i in data){
					if(data[i].catemain == $('#cateMain').val()){
						$('#radioBundle').append("<li><input type='radio' id='"+i+"-option' name='selector' value='"+data[i].catesub+"-"+data[i].catemain+"' required>"+
						"<label for='"+i+"-option' class='title'>"+data[i].catesub+"</label><div class='check'></div></li>")
					}
				}
			}
		})
	})
})
</script>	
 
  
<!-- 2. 지역/날짜/인원 선택 -->
  <div id="step2" class="w3-container step">
    <p class="headline">Q. 지역/날짜/인원을 선택해주세요.</p>
 	 <hr style="border: 2px solid lightgray;"/>
 	 
 	<p><label class="explainLabel">지역</label><select class="select" id="zone" required><option>---지역---</option></select></p>
 	<p><label class="explainLabel">도시</label><select class="select" id="city" required><option>---도시---</option></select></p>
 	<p><label class="explainLabel">일정</label><input type="month" class="select" id="month" value="2018-08"></p>
 	<p><label class="explainLabel">학급</label><select class="select" id="class"><option>---선택---</option></select></p>
 	<p><label class="explainLabel">인원</label><select class="select" id="person" disabled></select></p>
    <button type="button" class="btNext" data-num=2 id="searchbt">검색</button>
  </div>
  <script>


// 2. 지역/날짜/인원 선택 - 몽고DB에 저장된 areacode 가져오고 / Mysql에 저장된 담당 선생님 반 이름/인원 가져오기
  $(function() {
  	$('#loadAreacodebt').on('click', function() { 
  		$.ajax({
  			url: '/kinder/getAreacode',
  			type: 'get',
  			dataType: 'json',
  			success: function(data) {
  			
  				var tempArr = [];
  				for(var i = 0; i < data.length; i++){
  					if(tempArr.length == 0){
  						tempArr.push(data[i].zone);
  						$('#zone').append("<option>"+data[i].zone+"</option>")
  					}else{
  						var dupliFlag = true;
  						for (var j = 0; j < tempArr.length; j++){
  							if(tempArr[j] == data[i].zone){
  								dupliFlag = false;
  								break;
  						}
  					}
  						if(dupliFlag){
  						tempArr.push(data[i].zone);
  						$('#zone').append("<option>"+data[i].zone+"</option>")
  						}
  				}
  			}
  				
  			}
  		})
  		
  		//Mysql에 저장된 담당 선생님 반 이름/인원 가져오기
  		$.ajax({
  			url: '/kinder/postCountingkids',
  			type: 'POST',
  			dataType: 'json',
  			success: function(data) {
  				$.each(data, function(index, item) {
  					if(item.clname == null){
  						alert('아직 선생님 담당 학급이 없습니다.')
  					}else{
  						$("#class").append("<option>"+item.clname+"</option>")
  	  					$("#class").change(function() {
  	  						if(item.clname == $('#class').val()){
  	  							$("#person").append("<option>"+item.numOfkids+"</option>")
  	  		  					}else{
  	  		  						$("#person").empty();
  	  		  					}	
  						})
  					}
  					
  					
				})	
			}
  		})
  		
  		
  		
  	})
  })

  // 2. 지역/날짜/인원 선택 - 로딩 후 city 선택지 가져오기 
  $(function() {
  	$('#zone').change(function() { 
  		$.ajax({
  			url: '/kinder/getAreacode',
  			type: 'get',
  			dataType: 'json',
  			success: function(data) {
  				$('#city').empty();
  				$('#city').append("<option>---도시---</option>")
  				for (var i in data){
  					if(data[i].zone == $('#zone').val()){
  						$('#city').append("<option>"+data[i].city+"</option>")
  					}
  				}		
  			}
  		})
  })
  })
  </script>

	
<!-- 3. 체험학습 검색 -->
  <div id="step3" class="w3-container step">
    <p class="headline">A. 체험학습 검색 결과 : 관심있는 장소를 모두 고른 뒤 [다음] 버튼을 눌러주세요.
    	<br><button type="button" class="btNext" data-num=3 id="selection">다음</button></p>
 	 <hr style="border: 2px solid lightgray;"/>
 	 	<ul id="noSearchedData"></ul>
<!-- 		<div class="square"> -->
<!-- 			<div class="spin"></div> -->
<!-- 			<p>Loading..</p> -->
<!-- 		</div> -->
	
		<ul id="uldata" style="margin-left: 3%; padding-bottom: 3%"></ul>

	
	<script>
	// 3. 체험학습 검색 - 조건에 맞춰 검색데이터 불러오는 ajax
	$(function() {
		$("#searchbt").on('click', function() {
			$(".square").remove();
			$("#uldata").empty();
			$("#noSearchedData").empty();
			$("#step3").append("<ul id='noSearchedData'></ul><div class='square'><div class='spin'></div><p>Loading..</p></div>")
			$.ajax({
				url: '/kinder/getSerchedResult',
				type: 'get',
				data: {
					term : $('input[type=radio][name=selector]:checked').val(),
					zone : $('#zone').val() == "---지역---" ? "지역없음" : $('#zone').val(),
					city : $('#city').val() == "---도시---" ? "도시없음" : $('#city').val(),
					date : $('#month').val(),
					person : $('#person').val() == "" ? "인원없음" : $('#person').val()
				},
				dataType: 'json',
				success: function(data) {
						
					if(!data || data =="" || data == null ||data ==" " || data =="[]"){
						$(".square").remove();
						$("#uldata").empty();
						$("#noSearchedData").empty();
						$("#noSearchedData").append("<p class='headline' id='searchagain' style='margin: 0 auto;'> 조건에 맞는 장소가 없습니다.. ㅠ.ㅠ </p>")
						$("#noSearchedData").append("<button type='button' class='btNext' data-num=2 id='seachagain'>조건 다시설정하기</button>")
						$('#seachagain').on('click', function(event) {
							openStep(event, 'step2', 'id2');
						})
					}else{
						$(".square").remove();
						$("#noSearchedData").empty();
						$("#uldata").empty();
						
						for(var i=0; i < data.length; i++){
							$("#uldata").append("<table id ='table"+i+"' frame='void' border='1' border-style='solid' border-width='3px' style='width:33%; height: 600px; float: left; padding: 0.5%; border-radius: 4px'>"
							+ "<tr><td id='title"+i+"' colspan='2' style='font-weight: bold; font-size: 17px; background-color: #ffeb3b;'>"+data[i].title+"</td></tr>"
							+ "<tr><td colspan='2' style='font-weight: bold;'><img src="+data[i].thumbnail_url+"></td></tr>"
							+ "<tr><td style='font-weight: bold; background-color: lightgray;'>관심등록</td>"
							+ "<td><button class='btlikes' id='btlikes"+i+"' type='button' data-id= '1' onclick='toggle_bt(likes"+i+")'>"
							+ "<img src='${images}yebin-click-before.jpg' id='likes"+i+"'></button></td></tr>"
// 							+ "<tr><td style='font-weight: bold; width: 20%; background-color: lightgray;'>웹사이트</td><td><a href='"+data[i].website+"' target='_blank' style='color: blue'>홈페이지 방문하기</a></td></tr>"
							+ "<tr><td style='font-weight: bold; background-color: lightgray;'>주소</td><td>"+data[i].address+"</td></tr>"
							+ "<tr><td style='font-weight: bold; background-color: lightgray;'>모집기간</td><td>"+(data[i].apply_date_start == "" ? "-" : (data[i].apply_date_start + "~" + data[i].apply_date_end))+"</td></tr>"
							+ "<tr><td style='font-weight: bold; background-color: lightgray;'>운영기간</td><td>"+(data[i].do_date_start == "" ? "-" : (data[i].do_date_start + "~" + data[i].do_date_end))+"</td></tr>"
// 							+ "<tr><td style='font-weight: bold; background-color: lightgray;'>모집정원</td><td>"+(data[i].apply_count == "" ? "-" : data[i].apply_count)+"</td></tr>"
							+ "</table>") 
					}
						
					}
				}
		})	
	})		
	})	
	
	
	// 3. 체험학습 검색 - 관심 등록 버튼 토글
	var posts= [];
	var tableTags=[];
	var saveAllData= [];
	
	var j = 0;
	function toggle_bt(img_id) {
		var obj = img_id;
		var stick = Number($(obj).closest("button").data('id'));
		var tableid = '#' + $(obj).closest("table").attr("id");
		var idForJq = '#'+ $(obj).closest("button").attr("id");
		var getTitle = '#' + $(tableid).find("td").attr("id");
		j = j + stick;
		if (!obj) return;
		if (j % 2 != 0) {
			obj.src = "${images}yebin-click-after.jpg";
			posts.push($(getTitle).text());
			tableTags.push($(tableid).text());
			alert(tableTags)
			$(idForJq).data('id', 0); 
			j = 0;
		} else {
			obj.src = "${images}yebin-click-before.jpg";
			if($.inArray($(getTitle).text(), posts) != -1){
				posts.splice(posts.indexOf($(getTitle).text()),1);	
				tableTags.splice(tableTags.indexOf($(tableid).text()));
				$(idForJq).data('id', 1); 
				alert(tableTags)
			}
		}
		}
	
	</script>
  </div>
<!-- 4. 체험학습 후보지 저장  -->
  <div id="step4" class="w3-container step">
  <p class="headline">Q. ${tlogin.memname} 선생님께서 선택한 체험학습 프로그램은 아래와 같아요.</p>
 	 <hr style="border: 2px solid lightgray;"/>
  <ul id="selectedPg" style="margin-left: 0%; padding-bottom: 3%">
  </ul>
    <button type="button" class="btNext" data-num=4 id='saveList'>저장 후 검색</button>
  </div>
  
  <script>
  // 4. 체험학습 후보지 저장
  $('#selection').on('click', function() {
	  $("#selectedPg").empty();
	  $("#selectedPg").append("<table id='selectedTable' frame='void' border='1' width= 40% border-style='solid' border-width='3px'"
			  + "style='margin: 0 auto; text-align: left; vertical-align: middle;'></table>")
			  
	setTimeout(function() {
		  $("#selectedPg").append("<p style='font-size: 30px;'>선택하신 후보지가 맞나요? <br/> [저장 후 검색]을 눌러 세부 검색을 진행합니다."+"</p>")
	      $("#selectedPg").append("<p style='font-size: 20px; color: blue;'>저장 된 후보지는 다음 체험학습지 선정 시 유용히 활용됩니다."+"</p>")
	 	  $("#selectedTable").append("<tr><td style='text-align: center; background-color: #ffeb3b; font-size: 25px'>관심있게 본 프로그램 목록[총 "+posts.length+"개]</td></tr>")
	  for(var i in posts){
		    $("#selectedTable").append("<tr></br><td class= 'keywordAll' id='keyword"+i+"' style='font-size: 18px;'>"+posts[i]+"</td></tr>")
	  }	 
		 }, 1000);
})

// jQuery.ajaxSettings.traditional = true;

// 	$(function() {
// 		$("#saveList").on('click', function() {
// 			$(posts).each(
// 					)
			
			
// 			$.ajax({
// 				url : '/kinder/postSaveList',
// 				type : 'post',
// 				data : {
// 					keywords: posts // 배열로 보냄
// 				}
// 			})
// 		})
// 	})

  
//   // 4. 체험학습 후보지 저장
//   $('#selection').on('click', function() {
// 	  $("#selectedPg").empty();
// 	  $("#selectedPg").append("<table id='selectedTable' frame='void' width= 40% border-style='solid' border-width='3px'"
// 			  + "style='margin: 0 auto; text-align:left; vertical-align: middle;'></table>")
			  
// 	setTimeout(function() {
// // 	  $("#selectedPg").append("<p style='font-size: 30px; color: blue;'>[여기어때?] 버튼을 누르시면 인터넷에서 정보를 더 검색합니다."+"</p>")
// 	  $("#selectedPg").append("<p style='font-size: 30px;'>선생님께서 선택하신 후보지가 맞나요? <br/> 확인 후 [다음]을 눌러 세부 검색을 진행합니다."+"</p>")
// 		  $("#selectedTable").append("<tr><td colspan=2, style='text-align: center; background-color: #ffeb3b; font-size: 25px'>관심있게 본 프로그램 목록[총 "+posts.length+"개]</td></tr>")
// 	  for(var i in posts){
// 		    $("#selectedTable").append("<tr></br><td id='keyword"+i+"' style='font-size: 15px;'>"+posts[i] 
// 		    +"</td><td style ='text-align:right;'><button class='btForselection' id='btForselection"+i+"' onclick='searchAbtIt(btForselection"+i+", keyword"+i+")'>여기어때?</button></td></tr>")
// 	  }	 
// 		 }, 1000);
// // 	$("#selectedTable").append(tableTags);
// // +(Number(i)+1)+"." keyword에 들어갔던 번호
	
// })

// function searchAbtIt(buttonId, keywordId) {
// 	var btid = buttonId;
// 	var keyid = keywordId;
// // 	alert($(btid).attr('id'));
// // 	alert($(keyid).text());
	
// 	$.ajax({
// 		url: '/kinder/getSearch',
// 		type: 'get',
// 		dataType: 'json',
// 		data: {
// 			keyword : $(keyid).text()
// 		},
// 		success: function(data){
// 			document.write(data.items[0].title);
// 			document.write(data.items[0].link);
// 		}
	
// 	})
// }

  </script>
  
  
  
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
</script>

</body>
</html>
