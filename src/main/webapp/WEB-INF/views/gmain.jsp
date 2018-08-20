<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="commons/guardianmenu.jsp" flush="true" ></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body { margin: 0; }

body #bgimg {
  position: relative;
  overflow: hidden;
  background-size: auto 1000px;
  background-position: center center;
/*   opacity: 0.7; */
}

html, body, #bgimg, #bgimg .image-top, #bgimg .image-bottom {
  height: 100%;
  width: 100%;
}


body #bgimg .image-bottom, body #bgimg .image-top {
  position: absolute;
  left: 0;
  top: 0;
  background-size: cover;
}

body #bgimg .image-bottom { z-index: -2; }

body #bgimg .image-top {
  z-index: -1;
  display: none;
}



#bgimg{
	background-image: url('resources/images/cute4.gif');
	text-align: center;
	        font-family: 'Jeju Gothic', sans-serif;	
}

#contains{
	margin: auto;
	position: relative;
width: 80%;
height: 80%;
opacity: 0.2;
background-color: black;
margin-top: -200px;
color: black;
}

</style>
<body>
<div id="bgimg">
<div id="contains">
<h1 style="margin: 300px;">행복과 웃음이 가득한 Kindergarten 입니다♥</h1>
</div>
</div>
</body>
</html>