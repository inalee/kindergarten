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
/* 	        font-family: 'Jeju Gothic', sans-serif;	 */
	margin: auto;
	position: relative;
}

#contains{
	margin: auto;
	position: relative;
width: 80%;
height: 80%;
margin-top:300px;
color: black;
}


h4 {
  height: 100px;
}

h4 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
/*   font-family: 'Titan One', cursive; */
  font-size: 60px;
  color: #FFF;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h4 span:nth-child(2) { animation-delay: .1s; }
h4 span:nth-child(3) { animation-delay: .2s; }
h4 span:nth-child(4) { animation-delay: .3s; }
h4 span:nth-child(5) { animation-delay: .4s; }
h4 span:nth-child(6) { animation-delay: .5s; }
h4 span:nth-child(7) { animation-delay: .6s; }
h4 span:nth-child(8) { animation-delay: .7s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
        }
}

</style>
<body>
<div id='bgimg'>
<div id="contains">
<%-- <h1 style="margin: 300px;">${teacher.kinname} ${tlogin.memname}선생님, 반갑습니다.</h1> --%>
<h4>
  <span>${teacher.kinname}</span>
  <span>${tlogin.memname}</span>
  <span>선생님</span>
  <span>반갑습니다</span>
  <span>♥</span>
</h4>
</div>
</div>
</body>
</html>