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
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function enrollform() {
	
	var recode = "${recode}";
	var kincode = "${kincode}";
	var popUrl = "coomingsoon?recode="+recode+"&kincode="+kincode;	//팝업창에 출력될 페이지 URL
	window.open(popUrl,'','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');


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

h2{
padding-left: 50px;
}


#contains{
margin: auto;
margin-top: 70px;
position: relative;
margin-bottom: 50px;

}

.jg{font-family: 'Jeju Gothic', sans-serif;}

table.type05 {
	font-size: 16px;
	width: 90%;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: auto;
    position: relative;
}
table.type05 th {
  	width: 120px;
    padding: 20px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
   	width: 600px;
    padding: 20px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}


.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
	opacity: 0.8;
	padding: 10px;
	width: 140px;
	height: 50px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    font-family: 'Jeju Gothic', sans-serif;	

    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
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






</style>

</head>
<body>
<div id="headdiv">
<h2>┃정기모집 공고 상세보기</h2>
<div id="contains">
			<p
				style="text-align: center; margin-bottom: 40px; font-size: 30px; ">■
				${kininfo.kinname} ■</p>
			<p style="padding-left: 73px; font-size: 13px;">※모집 신청 양식은 모집 일자에 맞추어 자동으로 업데이트 됩니다. </p>
<table class="type05">
    <tr>
        <th style="height: 90px; background-color: #F7F8E0;" scope="row"><br>모집인원</th>
        <td style="height: 90px;"><br>${reinfo.renum}명</td>
        <th style="height: 90px; background-color: #F7F8E0;" scope="row"><br>모집 일자</th>
        <td style="height: 90px; text-align: center;">${reinfo.reopen}<br><br>
        <button class='button button4' type='button' onclick='enrollform()'>신청하기</button></td>        
    </tr>
    <tr>
        <th scope="row">주소</th>
        <td>${kininfo.kinaddress}</td>
        <th scope="row">전화번호</th>
        <td>${kininfo.kinphone}</td>        
    </tr>
    <tr>
        <th scope="row">정원</th>
        <td>${kininfo.kinmax}명</td>
        <th scope="row">현원</th>
        <td>${kininfo.kincurrent}명</td>        
    </tr>
    <tr>
        <th scope="row">방 갯수</th>
        <td>${kininfo.kinroom}개</td>
         <th scope="row">전체 면적</th>
        <td>${kininfo.kinarea}㎡</td>       
    </tr>
        <tr>
        <th scope="row">놀이터 개수</th>
        <td>${kininfo.kinplay}개</td>
         <th scope="row">선생님</th>
        <td>${kininfo.kinteacher}명</td>       
    </tr>
        <tr>
        <th scope="row">셔틀버스<br>운영 여부</th>
		<c:choose>
		<c:when test="${kininfo.kinshuttle eq false}">
		        <td>안함</td>
		</c:when>
		<c:otherwise>
		<td>운영</td>
		</c:otherwise>
		</c:choose>

         <th scope="row">홈페이지</th>
        <td><a href="http://${kininfo.kinhome}">
        <img style="width: 30px; height: 30px;" src="data:image/png;base64,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"></a></td>       
    </tr>
</table>
</div>
</div>

</body>
</html>