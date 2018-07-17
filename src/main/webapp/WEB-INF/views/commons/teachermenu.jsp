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
	
	$("#maindiv>ul:first-child>li:first-child").append("<a href="+logolink+"><img alt='logo' src='resources/images/logo.png' style='width: 400px; margin-top: -20px; margin-bottom: -50px;'></a>");

})
</script>
<header>
	<div id="maindiv">
	<ul>
		<li></li>
		<li style="font-size: 15px; text-align: right; margin: 0 10px 10px 0;"><span style="font-weight: bold;">${tlogin.memname }</span> 선생님 <button class="logout" title="로그아웃">LOGOUT</button></li>
	</ul>
	</div>
	<nav>
	   <ul>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">업무관리</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/yebin/tmenu1">일정 관리</a></li>
	         <li><a href="/kinder/yebin/tmenu2">보육일지작성</a></li>
	         <li><a href="/kinder/yebin/tmenu3">월간계획안</a></li>
	         <li><a href="/kinder/yebin/tmenu4">체험학습</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">출석체크</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/jiwon/tmenu5">출석체크</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">입소신청관리</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/ina/tmenu6">신청현황 관리</a></li>
	         <li><a href="/kinder/ina/tmenu7">정기모집 등록</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">차량운행</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/guangwo/tmenu8">운행정보</a></li>
	         <li><a href="/kinder/guangwo/tmenu9">운행교사정보</a></li>
	         <li><a href="/kinder/guangwo/tmenu10">차량관리</a></li>
	         <li><a href="/kinder/guangwo/tmenu11">위험지역</a></li>
	         <li><a href="/kinder/guangwo/tmenu12">추천상품</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">정보수정</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/hojung/tmenu13">어린이집 정보수정</a></li>
	       </ul></li>
	   </ul>
	 </nav>
</header>
<iframe id='logoutKakao' style='display: none;' src="" ></iframe>
<iframe id='logoutNaver' style='display: none;' src="" ></iframe>
</body>
</html>