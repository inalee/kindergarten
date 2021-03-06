<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


function file_down(pencode,refile){

	if(refile==''){
		alert("등록된 자료가 없습니다.");	
		}else{
			location.href = "down_file?encode="+pencode;
		}

}


function file_down2(prencode,refile){

	if(refile==''){
	alert("등록된 자료가 없습니다.");	
	}else{
		location.href = "down_file2?re_encode="+prencode;
	}

}


function fin_enroll(pkincode,pccode){

	
	alert("해당 아동의 입소를 확정하시겠습니까?");
	
	$.post("final_enroll", {ccode:pccode,kincode:pkincode}, function(result){
		alert("입소가 완료되었습니다.");
		location.reload();
    });
	
	
}



function fin_enroll2(prencode,pccode,pkincode){

	
	alert("해당 아동의 입소를 확정하시겠습니까?");
	$.post("final_enroll2", {re_encode:prencode,ccode:pccode,kincode:pkincode}, function(result){
		alert("입소가 완료되었습니다.");
		location.reload();
    });
	
	
}

function mod_stat(pencode,pstatcode){
		alert("상태를 변경하시겠습니까?");
		
		$.post("status_modify", {encode:pencode,statcode:pstatcode}, function(result){
			alert("변경이 완료되었습니다.");
			location.reload();
	    });

	}

function mod_stat2(prencode){
	alert("해당 아동의 정기모집 등록을 취소하시겠습니까?");
	
	$.post("status_modify2", {re_encode:prencode}, function(result){
		alert("취소가 완료되었습니다.");
		location.reload();
    });

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
body{
font-family: 'Jeju Gothic', sans-serif;	
}

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
  background-color: #ABDDFF;
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
 	font-size:12pt;
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

.button4 {
    background-color: #FFBB00;
    color: white; 
    border: 2px solid #FFBB00;
}

.button4:hover {
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
<h2>┃ 입소대기신청 관리</h2> 
<br>
<div id="discript_2">
<img src="http://www.clker.com/cliparts/a/K/l/k/C/w/light-blue-warning-sign-md.png" style="float: left; height: 170px; margin-left: 20px;">
<ul>
<li>제출된 자료를 꼼꼼히 검토해주세요.</li><br>
<li>부적절한 자료를 제출하였거나, 자료 제출 기간이 넘어간 신청건에 대해서는 취소처리가 가능합니다.</li>
<br>
<li>입소대기승인관리 부주의로 인해 발생한 손해 및 사고의 책임은 모두 담당 직원에게 있습니다.</li><br>
<li style="color: red;"><b>정기모집은 공고 게시 이후 한달 이내로 입소 처리를 완료해야 합니다.</b></li>
</ul>
<br>
<h4 style="margin-left: 10px; margin-top: 20px; ">※입소 신청 후 승인 절차</h4>
<div id="progress">
<ol class="stepBar step5">
<li class="step current" style="background-color: #D0ECFF;">(추가)대기</li>
<li class="step" style="background-color: #7DCBFF;">자료제출</li>
<li class="step current" style="background-color: #4DB8FF;">(추가)대기확정</li>
<li class="step" style="background-color: #15A2FF;">입소완료</li>
</ol>
 <p style="font-size: 13px; ">대기: 해당 어린이집의 현원이 다 차지 않아 입소 자리가 남은 경우
 <br>추가 대기: 해당 어린이집의 입소 자리가 남지 않아 추가 대기가 필요한 경우</p>
</div>
</div>
<div class="tab-wrapper">
  
  <ul class="tab-menu">
    <li class="active">수시모집현황</li>
    <li>정기모집현황</li>
    <li>완료현황</li>
    <li>취소현황</li>
  </ul>

  <div class="tab-content">

    <div>
    <form>
<table id="mychild">
  <tr>
  	<th>입소순번</th>
	<th>번호</th>
    <th>아동 이름</th>
    <th>입소희망일</th>
	<th>우선순위 배점</th>
    <th>상태</th> 
    <th>자료제출기한</th>      
    <th>자료확인</th>   
	<th>-</th>      
  </tr>
  <c:forEach items="${kinlist}" var="i">
  <fmt:parseNumber var="ranking" value="${i.ROWNUM}" integerOnly="true" />
  <fmt:formatDate var="date_re2" value="${i.en}" pattern="yyyy-MM-dd HH:mm:ss" />
<tr>
	<form>
	<input type="hidden" id="encode" name="encode" value="${i.encode}">
	<input type="hidden" id="enfile" name="enfile" value="${i.enfile}">
	<td>${ranking}번</td>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.hopedate}</td>
    <td>${i.crank}</td>
    <td>${i.status}</td>
    <td>${date_re2}</td>
    <td><button type="button" class="button button2" onclick="file_down(${i.encode},enfile.value)">보기</button><br></td>
    <c:choose>
    <c:when test="${i.status eq '대기확정'}">
    <td><button class="button button4" type="button" onclick="fin_enroll(${teacher.kincode},${i.ccode})">입소확정</button></td>
    </c:when>
    <c:otherwise>
       <td><select name="statcode" id="statcode" style="height: 25px;">
    <option value="3">대기확정</option>
    <option value="4">추가대기확정</option>
    <option value="6">자료 미제출</option>
    </select>
    <button class="button button3" type="button" onclick="mod_stat(encode.value,statcode.value)">변경</button></td>
    </c:otherwise>
	</c:choose>
    </form>
  </tr>
</c:forEach>
</table>
 </form>
    </div>
           <div>
           <p style="font-size: 15px;">※ 정기 모집 공고 게시일로부터 한달 이내에 입소처리를 완료해주세요.</p>
          <table id="mychild">
  <tr>
  	<th>공고 번호</th>
	<th>신청 번호</th>
	<th>게시일</th>
    <th>아동 이름</th>
    <th>입소희망일</th>
    <th>상태</th> 
    <th>자료제출기한</th>    
    <th>자료확인</th>  
    <th>-</th>        
  </tr>

<c:forEach items="${regular_list}" var="i">
<fmt:formatDate var="date_re3" value="${i.redate}" pattern="yyyy-MM-dd" />
<fmt:formatDate var="date_re2" value="${i.enlog}" pattern="yyyy-MM-dd HH:mm:ss" />
  <tr>
	<form>
	<input type="hidden" id="encode" name="re_encode" value="${i.re_encode}">
		<input type="hidden" id="refile" name="refile" value="${i.refile}">
	<td>${i.recode}</td>
    <td>${i.re_encode}</td>
    <td>${date_re3}</td>
	<td>${i.cname}</td>
    <td>${i.rehopedate}</td>
    <td>${i.restate}</td>
    <td>${date_re2}</td>
    <td><button type="button" class="button button2" onclick="file_down2(${i.re_encode},refile.value)">보기</button><br></td>
    <td><button class="button button4" type="button" onclick="fin_enroll2(${i.re_encode},${i.ccode},${i.kincode})">입소확정</button><br>
    <button class="button button3" type="button" onclick="mod_stat2(${i.re_encode})">입소취소</button></td>
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
    <th>우선순위 배점</th>
    <th>입소희망일</th>
    <th>상태</th>    
    <th>구분</th>
  </tr>

<c:forEach items="${kinlist2}" var="i">
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.crank}점</td>
    <td>${i.hopedate}</td>
    <td>${i.status}</td>
    <td>수시모집</td>
  </tr>
</c:forEach>
<c:forEach items="${regular_list2}" var="g">
  <tr>
    <td>${g.re_encode}</td>
	<td>${g.cname}</td>
    <td>-</td>
    <td>${g.rehopedate}</td>
    <td>${g.restate}</td>
    <td>정기모집</td>
  </tr>
</c:forEach>
</table>
   </div>
   
   
       <div>
 <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>우선순위 배점</th>
    <th>입소희망일</th>
    <th>취소 사유</th>    
    <th>구분</th>
  </tr>

<c:forEach items="${kinlist3}" var="i">
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.crank}점</td>
    <td>${i.hopedate}</td>
    <td style="color: red;">${i.status}</td>
    <td>수시모집</td>
  </tr>
</c:forEach>

<c:forEach items="${regular_list3}" var="g">
  <tr>
    <td>${g.re_encode}</td>
	<td>${g.cname}</td>
    <td>-</td>
    <td>${g.rehopedate}</td>
    <td style="color: red;">${g.restate}</td>
    <td>정기모집</td>
  </tr>
</c:forEach>
</table>
   </div>
  </div><!-- //tab-content -->
</div><!-- //tab-wrapper -->

</div>




</body>
</html>