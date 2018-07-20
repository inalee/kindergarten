<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Kindergarten~</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
/* * {border: thin solid red} */
body {
	margin: 0;
	background-image: url("resources/images/back_yellow.jpg");
	background-repeat: no-repeat;
	background-size: 100% 1800px;
	background-position: center center;
 	background-color: #FFE70A; 
 	font-family: 'Jeju Gothic', serif;
}

#maindiv ul{
	list-style: none;
	text-align: center;
}
#maindiv ul li button{
	font-family: 'Jeju Gothic', serif;
	width: 350px;
	height: 350px;
	background-color: white;
	z-index: 15;
	-webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    -ms-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    
    -webkit-transform: scale(1.0);
    -moz-transform: scale(1.0);
    -ms-transform: scale(1.0);
    -o-transform: scale(1.0);
    transform: scale(1.0);
}
#maindiv ul li button:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    -webkit-transform: scale(1.05);
    -moz-transform: scale(1.05);
    -ms-transform: scale(1.05);
    -o-transform: scale(1.05);
    transform: scale(1.05);
}
.admin {
	text-decoration: none;
	font-family: sans-serif;
	color: #999999;
}
.admin:hover {
	color: #adadad;
}
</style>
</head>
<body>
<div id="maindiv">
<ul style="margin-bottom: 60px;">
	<li><img alt="logo" src="resources/images/logo.png" style="width: 500px;"></li>
	<li style="font-size: 30px;">환영합니다! 프로그램 사용자를 선택해주세요.</li>
</ul>
<ul>
	<li style="display: inline; margin-right: 23px;">
		<a href="tlogin"><button><img alt="teacher" src="resources/images/teacher.png" style="height: 250px;"><p style="font-size: 22px;">선생님</p></button></a></li>
	<li style="display: inline; margin-left: 23px;">
		<a href="glogin"><button><img alt="parents" src="resources/images/parents.png" style="height: 250px;"><p style="font-size: 22px;">보호자</p></button></a></li>
</ul>
<ul style="margin-top: 50px;">
	<li><a href="alogin" class="admin">관리자로 로그인</a></li>
</ul>
</div>
</body>
</html>