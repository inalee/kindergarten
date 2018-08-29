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
/* 	        font-family: 'Jeju Gothic', sans-serif;	 */
}

#contains{
	margin: auto;
	position: relative;
width: 80%;
height: 80%;
<<<<<<< HEAD
opacity: 0.5;
background-color: white;
margin-top: -200px;
=======
margin-top:300px;
>>>>>>> branch 'dev' of https://github.com/yebinable/kindergarten.git
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
<div id="bgimg">
<div id="contains">

<h4>
  <span>행복과</span>
  <span>웃음이</span>
  <span>가득한</span>
  <span>Kindergarten</span>
  <span>입니다</span>
  <span>♥</span>
</h4>

</div>
</div> 
</body>
</html>