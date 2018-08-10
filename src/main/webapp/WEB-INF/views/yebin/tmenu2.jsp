<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:url var="images" value="resources/images/"></c:url>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: 'Jeju Gothic';
	text-align: center;
	font-size : 20px;
	color : black;
	font-weight: lighter;
	
}

#program {
  background-color: #2196f3; /* blue */
}

#facility {
  background-color: #f23538; /* yellow */
}


.button {
	font-family: 'Jeju Gothic', serif;
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 30px;
	/*   padding: 100px; */
	width: 300px;
	height: 90px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 50px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>

<script>
$(function() {
$('#facility').on('click', function() {
	$("#explain").empty();
	$("body").append("<iframe id='fieldtripHelper' src='/kinder/yebin/fieldtrip_facil' style='width: 100%;  height: 100vh;' ></iframe>")
})


$('#program').on('click', function() {
	$("#explain").empty();
	$("body").append("<iframe id='fieldtripHelper' src='/kinder/yebin/fieldtrip' style='width: 100%;  height: 100vh;' ></iframe>")
})

})
</script>
</head>
<body>
	<div id="explain">
	<p></p>
	<div><img src="${images}yebin-fieldtrip-title.png" style="vertical-align: middle" width= 40%></div>
<%-- 	<div><img src="${images}yebin-fieldtrip-summary.png" style="vertical-align: middle" width= 40%></div> --%>
	
	<p>원하는 검색 방식을 선택하세요.</p>
	<button class="button" id="facility" style="vertical-align: middle">
		<span>시설 별 검색 </span>
	</button>
	
	<button class="button" id="program" style="vertical-align: middle">
		<span>프로그램 별 검색</span>
	</button>
	</div>
</body>
</html>