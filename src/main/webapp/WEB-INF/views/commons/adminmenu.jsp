<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴입니다.</title>
<c:url var="amenu" value="resources/css/amenu.css"></c:url>
<link href="${amenu}" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var currenturl = document.location.href;
	//	alert(currenturl);
	var str = currenturl.substring(currenturl.length-5,currenturl.length);
	//	alert(str);
	var logolink;
	if (str=="amain") {
		logolink="amain"
	} else {
		logolink="../amain"
	}
	
	$("#maindiv>ul:first-child>li:first-child").append("<a href="+logolink+"><img alt='logo' src='resources/images/logo.png' style='width: 400px; margin-top: -20px; margin-bottom: -50px;'></a>");
})
</script>
</head>
<body>
<header>

	<div id="maindiv">
	<ul>
		<li></li>
		<li style="font-size: 15px; text-align: right; margin: 0 10px 10px 0; font-weight: bold;">관리자님 <button class="logout">LOGOUT</button></li>
	</ul>
	</div>
	<nav>
	   <ul>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">메뉴1</a>
	       <ul class="sub-menu">
	         <li><a href="">서브메뉴1</a></li>
	         <li><a href="">서브메뉴2</a></li>
	         <li><a href="">서브메뉴3</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">메뉴2</a>
	       <ul class="sub-menu">
	         <li><a href="">서브메뉴1</a></li>
	         <li><a href="">서브메뉴2</a></li>
	         <li><a href="">서브메뉴3</a></li>
	       </ul>
	     </li>
	     <li class="sub-menu-parent" tab-index="0">
	     <a href="#">메뉴3</a>
	       <ul class="sub-menu">
	         <li><a href="">서브메뉴1</a></li>
	         <li><a href="">서브메뉴2</a></li>
	         <li><a href="">서브메뉴3</a></li>
	       </ul>
	     </li>
	   </ul>
	 </nav>
</header>
</body>
</html>