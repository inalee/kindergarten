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




function search_btn() {
	
	var psigungu = $("#sigungu").val();
	var pkinkind = $("#kinkind").val();
	var pkinname = $("#kinname").val();
	
	var target = document.getElementById("sigungu");
	var sigunguname = target.options[target.selectedIndex].text;
	
	var target2 = document.getElementById("kinkind");
	var kinkindname = target2.options[target2.selectedIndex].text;
	
	
	$.get("search_regular",	{ sigungucode: psigungu, kinkindcode:pkinkind, kinname:pkinname }).done(function(data,state){
	
		
		$(".container").empty();
	 	$(".container").append("<tr><th>번호</th><th>구분</th><th>어린이집 이름</th><th>주소 </th><th>모집 일자</th><th>모집 인원</th><th>비고</th><th>신청 페이지</th></tr>");
		
		for (var i = 0; i < data.length; i++) {
		
			date=new Date(data[i].reopen-32400000);
			$(".container").append("<tr>"+
					"<td>"+data[i].recode+"</td><td>"+data[i].kinkind+"</td><td>"+data[i].kinname+"</td><td>"+data[i].sigungu+"</td><td>"+date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일</td>"+   
				    "<td>"+data[i].renum+"명</td><td>"+data[i].redetail+"</td><td><a href='detail_regular_enroll?recode="+data[i].recode+"&kincode="+data[i].kincode+"'><img style='width: 30px; height: 30px;' src='http://atonofcows.x10.mx/assets/circle.png'></a></td></tr>");
		}

	});
}

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


.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 100%;
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


#contains{
margin: auto;
margin-top: 50px;
position: relative;
width: 100%;
margin-bottom: 70px;
}

#contain2{
width: 100%;

/* border: solid thin black; */
position: relative; 
margin: auto;
margin-top: 60px;

}

table.type04 {
	width: 1050px;
	font-size: 15px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : auto;
  position: relative;

}
table.type04 th {
    width: 150px;
    padding: 15px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.button2 {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
  
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.1s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
}

.button4:hover {background-color: #e7e7e7;}


*, *:before, *:after {
  box-sizing: inherit;
}

.container {
  box-sizing: border-box;
  font-size: 18px;
  font-weight: 500;
  margin: 70px;
  margin-bottom: 100px;
  width: 1200px;


}

.u-float-right {
  float: right;
}


.subtle {
	color: #EDA900;
  font-size: 20px;

}

.card-media {
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .12);
  height: 250px;
  margin-bottom: 25px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover {
  box-shadow: 0 5px 14px rgba(0, 0, 0, .2);
}

.card-media-object-container {
  background: none;
  float: left;
  height: 100%;
  width: 35%;
  position: relative;
  
  

}

.card-media-object {
  background-position: center center;
  background-size: cover;
  height: 100%;

}



.card-media-object:after {
  content: " ";
  display: block;
  height: 100%;
  left: 0;
  opacity: 0;
  position: absolute;
  right: 0;
  top: 0;
  transition: all 300ms ease-out;
  z-index: 10;
}

.card-media:hover .card-media-object:after {
  background: -moz-linear-gradient(top,  rgba(0,0,0,0) 0%, rgba(0,0,0,0) 52%, rgba(0,0,0,0.4) 100%);
  background: -webkit-linear-gradient(top,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  background: linear-gradient(to bottom,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6000000',GradientType=0 );
  opacity: 1;
}

.card-media-object-tag {
  background-color: #fff;
  border-radius: 2px;
  padding: 2px 7px;
  position: absolute;
  right: 10px;
  top: 10px;
}

.card-media-object-social-list {
  bottom: 4px;
  left: 10px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  position: absolute;
  z-index: 20;
}

.card-media-object-social-list li {
  border-radius: 50%;
  display: inline-block;
  height: 30px;
  margin-right: 6px;
  opacity: 0;
  overflow: hidden;
  transform: translateY(5px);
  transition: all 300ms ease-out;
  width: 30px;
}

.card-media:hover .card-media-object-social-list li {
  opacity: 1;
  transform: translateY(0);
}

.card-media-object-social-list li:nth-child(1) {
  transition-delay: 0;
}
.card-media-object-social-list li:nth-child(2) {
  transition-delay: 75ms;
}
.card-media-object-social-list li:nth-child(3) {
  transition-delay: 150ms;
}

.card-media-object-social-list-item-additional {
  border: 1px solid #fff;
  color: #fff;
  font-size: 12px;
  padding-top: 7px;
  text-align: center;
}

.card-media-body {
  background-color: #F6F6F6;
  float: left;
  height: 100%;
  padding: 12px 15px;
  position: relative;
  width: 65%;
}

.card-media-body-top {
  display: block;
}

.card-media-body-top-icons {
  margin-top: -2px;
  opacity: 0;
  transition: all 300ms ease-out;
  transform: translateY(-5px);
}

.card-media:hover .card-media-body-top-icons {
  opacity: 1;
  transform: translateY(0);
}

.card-media-body-top-icons > svg {
  cursor: pointer;
  margin-left: 10px;
  transition: all 300ms ease-out;
}

.card-media-body-top-icons > svg:hover {
  fill: #444;
}

.card-media-body-heading {
  display: block;
  margin-top: 10px;
 margin-left: 20px;
}

.card-media-body-supporting-bottom {
  position: absolute;
  bottom: 10px;
  left: 0;
  opacity: 1;
  padding: 0 15px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover .card-media-body-supporting-bottom {
  opacity: 0;
  transform: translateY(-8px);
}

.card-media-body-supporting-bottom-text {
  display: inline-block;
}

.card-media-body-supporting-bottom-reveal {
  opacity: 0;
  transform: translateY(8px);
  transition: all 300ms ease-out;
}

.card-media:hover .card-media-body-supporting-bottom-reveal {
  opacity: 1;
  transform: translateY(0);
}

.card-media-link {
  color: #41C1F2;
  text-decoration: none;
}

</style>
</head>
<body>
<div id="headdiv">
<h2>┃입소신청 정기모집 공고</h2>
<div id="contain2">
<table class="type04">
    <tr>
        <th scope="row">시/도</th>
        <td><select style="width: 150px; height: 25px;" name="sido">
        <option>서울특별시</option>
        </select></td>
         <th scope="row">시/군/구</th>
        <td><select id="sigungu" name="sigungucode" style="width: 150px; height: 25px;">
         	  <option value="0">--전체--</option>
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
        </select></td>
    </tr>
    <tr>
        <th scope="row">유형</th>
        <td><select id="kinkind" name="kinkindcode" style="width: 150px; height: 25px;">
        <option value="0">--전체--</option>
        <option value="1">가정</option>
        <option value="2">국공립</option>
        <option value="3">민간</option>
        <option value="4">법인·단체등</option>
        <option value="5">사회복지법인</option>
        <option value="6">직장</option>
        <option value="7">협동</option>
        </select></td>
 			 <th scope="row">어린이집명</th>
        <td><input type="text"  style="width: 250px; height: 20px;" name="kinname"  id="kinname" ></td>
    </tr>
    <tr>
         <th scope="row" colspan="4" style="text-align: center; border-bottom: none;"><button onclick="search_btn()" type="button" style="width: 200px; height: 60px;  margin-top: 15px; font-size: 20px;" class="button2 button4">검색</button></th>
     

    </tr>
</table>
<hr class="my-hr3" style="width: 70%;">
 <div id="contains">
    <div class="wrapper">
  	 <ul class="list">

	<c:forEach items="${list}" var="i" varStatus="k">
	<fmt:formatDate var="date_re2" value="${i.reopen}" pattern="yyyy년 M월 d일 HH시 mm분" />
	<div class="container">
  <div class="card-media">
    <!-- media container -->
    <div class="card-media-object-container">
	<c:choose>
		<c:when test="${k.count%2 == 0 }">
		<div class="card-media-object" style="background-image: url(resources/images/logo.png); background-size: contain; background-color: #FFBB00;"></div>
		</c:when>
		<c:otherwise>
		<div class="card-media-object" style="background-image: url(resources/images/logo.png); background-size: contain;"></div>
		</c:otherwise>
	</c:choose>
	  

    </div>
    <!-- body container -->
    <div class="card-media-body">
      <div class="card-media-body-top">
        <span class="subtle" style="margin-left: 10px; font-size: 23px; font-weight: bolder;">◎ ${i.kinname}</span>
        <div class="card-media-body-top-icons u-float-right">
          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0h24v24H0z" fill="none"/>
            <path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"/>
          </svg>
          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
            <path d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"/>
            <path d="M0 0h24v24H0z" fill="none"/>
          </svg>
        </div>
      </div>
      <br>
      <span class="card-media-body-heading">#${i.kinkind} #${i.sigungu} #${i.renum}명 모집</span>
	 <span class="card-media-body-heading"> - ${i.redetail}</span>
      <div class="card-media-body-supporting-bottom">
        <span class="card-media-body-supporting-bottom-text subtle" style="font-size: 19px; margin-left: 10px; ">모집일시 - ${date_re2}</span>
      
      </div>
      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
       
        <a href="detail_regular_enroll?recode=${i.recode}&kincode=${i.kincode}" class="card-media-body-supporting-bottom-text card-media-link u-float-right" style="font-size:20px; color: #4374D9;" >상세보기▶</a>
      </div>
    </div>
  </div>
</div>
</c:forEach>

</ul>
</div>
</div>
</div>
</div>

</body>
</html>