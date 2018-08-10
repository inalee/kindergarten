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


$(document).ready(function(){

    var list = $(".list tr");
    var numToShow = 2;
    var button = $("#next");
    var numInList = list.length;
    list.hide();
    if (numInList > numToShow) {
      button.show();
    }
    list.slice(0, numToShow).show();

    button.click(function(){
        var showing = list.filter(':visible').length;
        list.slice(showing - 1, showing + numToShow).fadeIn();
        var nowShowing = list.filter(':visible').length;
        if (nowShowing >= numInList) {
          button.hide();
        }
    });

});




function search_btn() {
	
	var psigungu = $("#sigungu").val();
	var pkinkind = $("#kinkind").val();
	var pkinname = $("#kinname").val();
	
	var target = document.getElementById("sigungu");
	var sigunguname = target.options[target.selectedIndex].text;
	
	var target2 = document.getElementById("kinkind");
	var kinkindname = target2.options[target2.selectedIndex].text;
	
	
	$.get("search_regular",	{ sigungucode: psigungu, kinkindcode:pkinkind, kinname:pkinname }).done(function(data,state){
	
		
		$("#mychild").empty();
	 	$("#mychild").append("<tr><th>번호</th><th>구분</th><th>어린이집 이름</th><th>주소 </th><th>모집 일자</th><th>모집 인원</th><th>비고</th><th>신청 페이지</th></tr>");
		
		for (var i = 0; i < data.length; i++) {
		
			date=new Date(data[i].reopen-32400000);
			$("#mychild").append("<tr>"+
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
width: 95%;
margin-bottom: 70px;
}

#contain2{
width: 1200px;

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
<hr class="my-hr3">
 <div id="contains">
    <div class="wrapper">
  	 <ul class="list">
		<table id="mychild">
  		<tr>
	<th>번호</th>
	  <th>구분</th>
    <th>어린이집 이름</th>
    <th>주소</th>
    <th>모집 일자</th>  
    <th>모집 인원</th>
  	<th>비고</th>
	<th>신청 페이지</th>
  </tr>

<c:forEach items="${list}" var="i">
<fmt:formatDate var="date_re2" value="${i.reopen}" pattern="yyyy년 M월 d일" />
  <tr>
    <td>${i.recode}</td>
    <td>${i.kinkind}</td>
	<td>${i.kinname}</td>
	<td>${i.sigungu}</td>
    <td>${date_re2}</td>
    <td>${i.renum}명</td>
    <td>${i.redetail}</td>
    <td><a href="detail_regular_enroll?recode=${i.recode}&kincode=${i.kincode}"><img style="width: 30px; height: 30px;" src="http://atonofcows.x10.mx/assets/circle.png"></a>
  </tr>
  </c:forEach>
</table>
  <button id="next">Show More</button>
</ul>
</div>
</div>
</div>
</div>

</body>
</html>