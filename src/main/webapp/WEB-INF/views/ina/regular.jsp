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

function upclass(pccode,pclcode) {

  var pkincode = "${teacher.kincode}";
	if (confirm("해당 아동의 반을 지정하시겠습니까?") == true){   
		
		$.post("update_class", {ccode:pccode,clcode:pclcode,kincode:pkincode}, function(result){
			alert("반 등록이 완료되었습니다.");
			location.reload();
	    });
		

	}else{   
	    return;
	}

	
}

function del_regular(val) {
	
	alert("해당 정기모집 공고를 삭제하시겠습니까?");
	$.get("del_regular",{recode:val},function(result){
		alert("삭제가 완료되었습니다.");
		location.reload();
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
margin-bottom: 50px;

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



</style>
</head>
<body>
<div id="headdiv">
<h2>┃정기모집 관리</h2>
<div id="contains">
		<table id="mychild">
  		<tr>
	<th>번호</th>
    <th>등록 일자</th>
    <th>모집 일자</th>  
    <th>모집 인원</th>
	<th>신청 인원</th>      
  	<th>비고</th>
  	<th>-</th>

  </tr>
<c:forEach items="${regular_list}" var="i">
<fmt:formatDate var="date_re" value="${i.redate}" pattern="yyyy-MM-dd" />
  <tr>
    <td>${i.recode}</td>
	<td>${date_re}</td>
    <td>${i.reopen}</td>
    <td>${i.renum} 명</td>
    <td>${i.renum_2} 명</td>
    <td>${i.redetail}</td>
    <td><button type="button" class="button button2" onclick="">수정</button>
    <button class="button button3" type="button" onclick="del_regular(${i.recode})">삭제</button></td>
     </tr>
  </c:forEach>
</table>
</div>
</div>


</body>
</html>