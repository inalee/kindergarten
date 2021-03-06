<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어서오세요 선생님</title>
<c:url var="tmenu" value="resources/css/tmenu.css"></c:url>
<link href="${tmenu}" rel="stylesheet" type="text/css" />
</head>
<body>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	<%	Object login = session.getAttribute("tlogin");
		if(Objects.isNull(login)){%>
			alert("로그인 해주세요.");
			self.location = "/kinder/tlogin";
	<%	}%>
	
	$(".logout").on("click", function(){
		$("#logoutKakao").attr('src', 'https://developers.kakao.com/logout');
		$("#logoutNaver").attr('src', 'http://nid.naver.com/nidlogin.logout');
		setTimeout(function() {
		location.href = "/kinder/logout"}, 1000);
	})
	
	
	
	var currenturl = document.location.href;
// 	alert(currenturl);
	var str = currenturl.substring(currenturl.length-5,currenturl.length);
// 	alert(str);
	var logolink;
	if (str=="tmain") {
		logolink="tmain"
	} else {
		logolink="../tmain"
	}
	
	$("#maindiv>ul:first-child>li:last-child").append("<a href="+logolink+"><img alt='logo' src='resources/images/logo.png' style='width: 400px; margin-top: -50px; margin-bottom: -20px;'></a>");

})
</script>
<header>
	<div id="maindiv">
	<ul>
		<li style="font-size: 15px; text-align: right; padding: 10px 15px 0 0;"><span style="font-weight: bold;">${tlogin.memname }</span> 선생님 <button class="logout">LOGOUT</button></li>
		<li></li>
	</ul>
	</div>
	<nav>
	   <ul>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">견학 관리</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/yebin/tmenu1">일정 관리</a></li>
	         <li><a href="/kinder/yebin/tmenu2">견학지 선정</a></li>
	         <li><a href="/kinder/yebin/tmenu3">승인/대기목록</a></li>
<!-- 	         <li><a href="/kinder/yebin/tmenu4">체험학습</a></li> -->
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">원생 관리</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/jiwon/tmenu5">출석체크</a></li>
	         <li><a href="/kinder/ina/manage2">원생 / 반 관리</a></li>


	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">입소신청관리</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/ina/tmenu6">입소신청현황 관리</a></li>
	         <li><a href="/kinder/ina/tmenu7">정기모집 등록</a></li>
	         <li><a href="/kinder/ina/regular">정기모집 관리</a></li>	         
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">차량운행</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/guangwo/tmenu8">차량관리</a></li>
	         <li><a href="/kinder/guangwo/tmenu9">스케쥴관리</a></li>
	         <li><a href="/kinder/guangwo/tmenu10">정거장관리</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">정보수정</a>
	       <ul class="sub-menu">
	        <li><a href="/kinder/ina/tmenu_info">어린이집 정보</a></li>
	         <li><a href="/kinder/hojung/tmenu13">어린이집 정보수정</a></li>
	       </ul></li>
	   </ul>
	 </nav>
</header>
<iframe id='logoutKakao' style='display: none;' src="" ></iframe> 
<iframe id='logoutNaver' style='display: none;' src="" ></iframe>
</body>
</html>