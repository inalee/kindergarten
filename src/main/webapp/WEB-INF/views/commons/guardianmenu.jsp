<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행복과 웃음이 가득한 킨더가든입니다*^^*</title>
<c:url var="gmenu" value="resources/css/gmenu.css"></c:url>
<link href="${gmenu}" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	<%	Object login = session.getAttribute("glogin");
		if(Objects.isNull(login)){%>
			alert("로그인 해주세요.");
			self.location = "/kinder/glogin";
	<%	}%>
	
	$(".logout").on("click", function(){
		$("#logoutKakao").attr('src', 'http://developers.kakao.com/logout');
		$("#logoutNaver").attr('src', 'http://nid.naver.com/nidlogin.logout');
			setTimeout(function() {
			location.href = "/kinder/logout"}, 1000);
	})

	var currenturl = document.location.href;
// 	alert(currenturl);
	var str = currenturl.substring(currenturl.length-5,currenturl.length);
// 	alert(str);
	var logolink;
	if (str=="gmain") {
		logolink="gmain"
	} else {
		logolink="../gmain"
	}
	
	$("#maindiv>ul:first-child>li:last-child").append("<a href="+logolink+"><img alt='logo' src='resources/images/logo.png' style='width: 400px; margin-top: -50px; margin-bottom: -20px;'></a>");
	
})
</script>
<header>

	<div id="maindiv">
	<ul>
		<li style="font-size: 15px; text-align: right; padding: 10px 15px 0 0;"><span style="font-weight: bold;">${glogin.memname }</span> 학부모님 <button class="logout">LOGOUT</button></li>
		<li></li>
	</ul>
	</div>
	<nav>
	   <ul>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">알림장</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/yebin/gmenu1">어린이집 일정</a></li>
	         <li><a href="/kinder/yebin/gmenu2">보육일지 확인</a></li>
	         <li><a href="/kinder/yebin/gmenu3">동의서 작성</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">입소신청</a>
	       <ul class="sub-menu">
	       	 <li><a href="/kinder/ina/gmenu4">내 아이 등록하기</a></li>
	      	 <li><a href="/kinder/ina/gmenu6">정기모집</a></li>      	 
	         <li><a href="/kinder/ina/gmenu8">수시모집</a></li>
	         <li><a href="/kinder/ina/gmenu9">신청현황</a></li>   
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">차량운행</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/guangwo/gmenu11">운행정보</a></li>
	         <li><a href="/kinder/guangwo/gmenu12">운행교사정보</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">어린이집 정보</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/hojung/search_keyword_gmenu">어린이집 찾기</a></li>
	         <li><a href="/kinder/hojung/gmenu15">어린이집 후기</a></li>
	         <li><a href="/kinder/ina/safety_gmenu">어린이집 안전정보</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	       <a href="#">아이맞춤추천</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/jiwon/gmenu21">출석 정보</a></li>
	         <li><a href="/kinder/jiwon/gmenu19">영상 추천</a></li>
	         <li><a href="/kinder/jiwon/gmenu20">도서 추천</a></li>
	       </ul>
	      </li>
	      <li class="sub-menu-parent" tab-index="0">
	       <a href="#">키즈카페</a>
	       <ul class="sub-menu">
	         <li><a href="/kinder/hojung/kidscafe_gmenu">키즈카페 예약</a></li>
	         <li><a href="/kinder/hojung/gmenu17">나의 예약 내역</a></li>
	       </ul>
	      </li>
	   </ul>
	 </nav>
</header>
<iframe id='logoutKakao' style='display: none;' src="" ></iframe>
<iframe id='logoutNaver' style='display: none;' src="" ></iframe>
</body>
</html>