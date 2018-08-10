<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
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
  background-size: auto 1200px;
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
	background-image: url('resources/images/cute6.gif');
	text-align: center;
	        font-family: 'Jeju Gothic', sans-serif;	
}
</style>
<body>
<div id='bgimg'>
<h1>선생님 메인입니다.</h1>
<h2>${teacher.kinname}</h2>
</div>
</body>
</html>