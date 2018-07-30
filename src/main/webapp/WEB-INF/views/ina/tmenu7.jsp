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

function fin_enroll(pkincode,pccode){

	
	alert("해당 아동의 입소를 확정하시겠습니까?");
	
	$.post("final_enroll", {ccode:pccode,kincode:pkincode}, function(result){
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
</script>
<style>
#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
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




.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
}

.button4:hover {background-color: #e7e7e7;}

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
list-style: none;
}

#contains{
margin-top: 50px;
margin-bottom: 50px;
}


h2{
padding-left: 50px;
}

</style>
</head>
<body>
<div id="headdiv">
<h2>┃ 정기모집 등록</h2> 
<p style="padding-left: 70px; font-size: 15px; margin-bottom: 25px;">정기모집은 상반기 1~2월 · 하반기 7~8월에 정기적으로 열리며, 모든 어린이집은 반드시 해당 기간 내에 정기모집 공고를 올려야합니다.</p>
<br>
<div id="discript_2">
<img src="http://p5cdn4static.sharpschool.com/UserFiles/Servers/Server_3017789/Image/News%20Article%20Photos/Kindergarten%20Pic.jpg" style="float: left; height: 200px; margin-left: 20px;">
<ul>
<li style="list-style: none; font-size: 25px;"><b>${teacher.kinname}</li><br>
<li>─ 주소 : 서울특별시 강남구 개포로 311 902동 111호(개포동, 우성9차아파트)</li>
<br>
<li>─ 정원 : 100명</li>
<br>
<li>─ 현원 : 20명</li>
</b>
</ul>

<br>
</div>

<div id="contains">
<form action="make_class" method="POST">
<table class="type04">

    <tr>
        <th scope="row">어린이집 이름</th>
        <td>${teacher.kinname}</td>
         <th scope="row">모집인원</th>
        <td><input type="number">　　명</td>
    </tr>
    <tr>
        <th scope="row">모집 일자</th>
        <td><input type="datetime-local"></td>
 			 <th scope="row">비고</th>
        <td><input type="text"></td>
    </tr>
    <tr>
         <th scope="row" colspan="4" style="text-align: center; border-bottom: none;"><button type="submit" style="width: 200px; height: 60px;  margin-top: 15px; font-size: 20px;" class="button2 button4">등록</button></th>
    </tr>
</table>
</form>
</div>
</div>




</body>
</html>