<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


function del_enroll(pencode){
	
	if (confirm("신청을 취소하시겠습니까?") == true){   
		$.post("del_enroll", {encode: pencode}, function(result){
			alert("신청이 취소되었습니다.");
			location.reload();
	    });
	
	}else{   
	    return;
	}
	
}

function uploadfile(data){

	var popUrl = "upload?encode="+data;	//팝업창에 출력될 페이지 URL

	var popOption = "width=650, height=150";    //팝업창 옵션(optoin)

	window.open(popUrl,"",popOption);

}


$(document).ready(function() {
	  
	  var $wrapper = $('.tab-wrapper'),
	      $allTabs = $wrapper.find('.tab-content > div'),
	      $tabMenu = $wrapper.find('.tab-menu li'),
	      $line = $('<div class="line"></div>').appendTo($tabMenu);
	  
	  $allTabs.not(':first-of-type').hide();  
	  $tabMenu.filter(':first-of-type').find(':first').width('100%')
	  
	  $tabMenu.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $allTabs.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $tabMenu.on('click', function() {
	    
	    var dataTab = $(this).data('tab'),
	        $getWrapper = $(this).closest($wrapper);
	    
	    $getWrapper.find($tabMenu).removeClass('active');
	    $(this).addClass('active');
	    
	    $getWrapper.find('.line').width(0);
	    $(this).find($line).animate({'width':'100%'}, 'fast');
	    $getWrapper.find($allTabs).hide();
	    $getWrapper.find($allTabs).filter('[data-tab='+dataTab+']').show();
	  });

	});//end ready
</script>
<style>
#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
}


.tab-wrapper {
	width: 95%;
  margin: 60px auto;
 margin-top: 50px;

}

.tab-menu li {
	
  position:relative;
  background-color: #fff;
  color:#bcbcbc;
  display: inline-block;
  padding: 20px 40px;
  width: 100px;
  text-align: center;
  cursor:pointer;
  z-index:0;
 border: thin solid #bcbcbc;

}

.tab-menu li:hover {
  color:#464646;
}

.tab-menu li.active {
  color:#191919;
  opacity: 1;
}

.tab-menu li.active:hover {
  color:#464646;
}

.tab-content>div {

  box-sizing:border-box;
  width:100%;
	margin-top: 50px;
  min-height:200px;

}

.line {
  position:absolute;
  width: 0;
  height: 7px;
  background-color: #FFE70A;
  top: 0;
  left: 0;
}




.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 95%;
 	font-size:11pt;
 	margin: auto; 
 	position: relative;
 	background-color: #fff;

}

#mychild th{
 border-top: double #464646;
background-color: #f5f5f5;
}


#mychild th, #mychild td {
    padding: 20px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    
}

#mychild tr:hover {
background-color:#f5f5f5;
}


h2{
padding-left: 50px;
}


#discript_2{
font-size: 17px;

padding: 25px;
margin: auto;
position: relative;
width: 85%;
 border: thin solid #bcbcbc;

}
#discript_2 ul{
margin-left: 300px;
}

#discript_2 li{
list-style: square;
}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
	opacity: 0.8;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.button3 {
    background-color: #f44336;
    color: white; 
    border: 2px solid #f44336;
}

.button3:hover {
    background-color: white;
    color: black;
}

.button2 {
    background-color: #008CBA;
    color: white; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: white;
    color: black;
}

#progress{

margin: auto;
margin-top: 20px;
position: relative;
float: none;
}

.stepBar {
  position: relative;
  list-style: none;
  margin: 0 0 1em;
  padding: 0;
  text-align: center;
  width: 100%;
  overflow: hidden;
  *zoom: 1;
}
.stepBar .step {
  position: relative;
  float: left;
  display: inline-block;
  line-height: 40px;
  padding: 0 40px 0 20px;

  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.stepBar .step:before, .stepBar .step:after {
  position: absolute;
  left: -15px;
  display: block;
  content: '';
  background-color: white;
  border-left: 4px solid #FFF;
  width: 20px;
  height: 20px;
}
.stepBar .step:after {
  top: 0;
  -moz-transform: skew(30deg);
  -ms-transform: skew(30deg);
  -webkit-transform: skew(30deg);
  transform: skew(30deg);
}
.stepBar .step:before {
  bottom: 0;
  -moz-transform: skew(-30deg);
  -ms-transform: skew(-30deg);
  -webkit-transform: skew(-30deg);
  transform: skew(-30deg);
}
.stepBar .step:first-child {
  -moz-border-radius-topleft: 4px;
  -webkit-border-top-left-radius: 4px;
  border-top-left-radius: 4px;
  -moz-border-radius-bottomleft: 4px;
  -webkit-border-bottom-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.stepBar .step:first-child:before, .stepBar .step:first-child:after {
  content: none;
}
.stepBar .step:last-child {
  -moz-border-radius-topright: 4px;
  -webkit-border-top-right-radius: 4px;
  border-top-right-radius: 4px;
  -moz-border-radius-bottomright: 4px;
  -webkit-border-bottom-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.stepBar .step.current {

}
.stepBar .step.current:before, .stepBar .step.current:after {
 
}

.stepBar.step5 .step {
  width: 25%;
}


</style>
</head>
<body>
<div id="headdiv">
<h2>┃ 입소대기 신청현황</h2>
<br>
<div id="discript_2">
<img src="https://library.sfsu.edu/sites/default/files/alert_300.gif" style="float: left; height: 220px; margin-left: 20px;">
<ul>
<li><b>입소대기 신청수 제한</b></li>
<p>-재원중인 아동: 2곳까지 입소대기 신청 가능</p>
<p>-미재원중인 아동: 3곳까지 입소대기 신청 가능</p>
<li><b>같은 어린이집에 중복 대기 신청 불가</b></li>
<br>
<li><b>정해진 기일 이내에 입소 대기 순위 관련 서류를 제출하지 않을 시, 자동으로 입소 대기가 취소됩니다.</b></li>
</ul>
<br>
<h4 style="margin-left: 10px; margin-top: 20px; ">※입소 신청 후 승인 절차</h4>
<div id="progress">
<ol class="stepBar step5">
<li class="step current" style="background-color: #FAF4C0;">(추가)대기</li>
<li class="step" style="background-color: #FFFF90;">자료제출</li>
<li class="step current" style="background-color: #FFFF5A;">(추가)대기확정</li>
<li class="step" style="background-color: #FFE400;">입소완료</li>
</ol>
 <p style="font-size: 13px; ">대기: 해당 어린이집의 현원이 다 차지 않아 입소 자리가 남은 경우
 <br>추가 대기: 해당 어린이집의 입소 자리가 남지 않아 추가 대기가 필요한 경우</p>
</div>
</div>

<div class="tab-wrapper">
  
  <ul class="tab-menu">
    <li class="active">전체보기</li>
    <li>대기현황</li>
    <li>완료현황</li>
    <li>취소현황</li>
  </ul>
	
  <div class="tab-content">
    <div>
      <table id="mychild">
  <tr>

	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
	<th>신청일</th>
    <th>상태</th>    
   
  </tr>

<c:forEach items="${wait1}" var="i">
 <fmt:formatDate var="date_re" value="${i.enlog}" pattern="yyyy-MM-dd" />
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td>${date_re}</td>
    <td>${i.status}</td>
  </tr>
</c:forEach>
</table>
</div>
    <div>
          <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
	<th>입소순번</th>
	<th>우선순위 배점</th>
    <th>상태</th> 
    <th>자료제출기한</th>      
    <th>-</th>        
  </tr>

<c:forEach items="${wait2}" var="i">
<fmt:parseNumber var="ranking" value="${i.rank}" integerOnly="true" />
<fmt:formatDate var="date_re2" value="${i.enlog}" pattern="yyyy-MM-dd HH:mm:ss" />
  <tr>
  	<form>
	<input type="hidden" id="encode" name="encode" value="${i.encode}">
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td> ${ranking}번째 / ${i.number}명</td>
    <td>${i.crank}</td>
    <td>${i.status}</td>
    <td>${date_re2}</td>
 	<c:choose>
 	<c:when test="${i.status eq '대기' or i.status eq '추가대기'}">
 	<td><button type="button" class="button button2" onclick="uploadfile(encode.value)">자료제출</button><br>
    <button class="button button3" type="button" onclick="del_enroll(encode.value)">신청취소</button></td>
 	</c:when>
 	<c:otherwise>
 	<td><button class="button button3" type="button" onclick="del_enroll(encode.value)">신청취소</button></td>
 	</c:otherwise>
 	</c:choose>
 	</form>
  </tr>

</c:forEach>
</table>
 
    </div>
       <div>
 <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
    <th>상태</th>    
   
  </tr>

<c:forEach items="${wait5}" var="i">
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td>${i.status}</td>
  </tr>
</c:forEach>
</table>
   </div>
   
   
       <div>
 <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
    <th>취소 사유</th>    
   
  </tr>

<c:forEach items="${wait3}" var="i">
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td style="color: red;">${i.status}</td>
  </tr>
</c:forEach>

</table>
    
   </div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->
</div>


</body>
</html>