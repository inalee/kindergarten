<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


</script>
</head>
<style>
.container {
      width: 1300px;
    position: relative;
	margin: auto;

  }
  

  .progressbar {
      counter-reset: step;
  }
  
  .progressbar li {
      list-style-type: none;
      width: 20%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
  }
  .progressbar li:before {
      width: 30px;
      height: 30px;
      content: counter(step);
      counter-increment: step;
      line-height: 30px;
      border: 2px solid #7d7d7d;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background-color: white;
  }
  .progressbar li:after {
      width: 100%;
      height: 2px;
      content: '';
      position: absolute;
      background-color: #7d7d7d;
      top: 15px;
      left: -50%;
      z-index: -1;
  }
  .progressbar li:first-child:after {
      content: none;
  }
  .progressbar li.active {
      color: #4374D9;
  }
  .progressbar li.active:before {
      border-color: #4374D9;
 
        
  }
  .progressbar li.active + li:after {
      background-color: #4374D9;
 
  }

#header{
position: relative;
margin: 50px auto;
margin-bottom: 30px;
width: 1300px;

}

#contain2{
width: 1200px;

/* border: solid thin black; */
position: relative; 
margin: auto;
margin-top: 180px;

}


table.type04 {
	width: 1050px;
	font-size: 15px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : auto;
  position: relative;

}
table.type04 th {
    width: 150px;
    padding: 15px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

  .my-hr3 {
    border: 0;
    height: 2px;
    background: #D5D5D5;
    width: 800px;
    margin-top: 50px;
    margin-bottom: 50px;


  }





#btnid{

text-align:center;
 	margin: auto; 
 	position: relative;
 	margin-top: 60px;
 	margin-bottom: 70px;
}


.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #FAECC5;
  border: none;
  color: black;
  text-align: center;
  font-size: x-large;

  width: 400px;
  transition: all 0.1s;
  cursor: pointer;

  height: 60px;
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


#before:after {
  content: '\00ab';
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;	
}


}

</style>
<body>
<div id="header">
<h2>입소신청하기</h2>
<hr style="width: 4.5cm; float: left; margin-top: 0;">
</div>
<br>
  <div class="container">
      <ul class="progressbar">
          <li class="active">아동선택</li>
          <li class="active">추가정보입력</li>
          <li class="active">입소 어린이집 검색·선택</li>
          <li class="active"><p style="font-weight: bolder; font-size: 13px;">희망 입소일 선택</p></li>          
          <li>입소대기확정</li>
  </ul>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">4.　　희망 입소일을 선택해주세요.</h4><br>
<table class="type04">
    <tr>
        <th scope="row">아동 이름</th>
        <td>${cname}</td>
         <th scope="row">어린이집 이름</th>
        <td>${kinder.kinname}</td>
    </tr>
    <tr>
        <th scope="row">어린이집 주소</th>
        <td>${kinder.kinaddress}</td>
 			 <th scope="row">입소 희망 날짜</th>
        <td><input type="date"></td>
    </tr>

</table>
	<div id="btnid">
	<button class="button" type="button" onclick="location.href='enroll_page3'"><span id="before">이전 단계</span></button>　　
	<button class="button" type="button" onclick="location.href='enroll_page5'"><span>입소 신청하기</span></button>
	</div>
</div>




</body>
</html>