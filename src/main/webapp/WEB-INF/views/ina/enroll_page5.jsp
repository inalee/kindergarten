<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
body{
    font-family: 'Jeju Gothic', sans-serif;	
}
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
	font-size: 16px;
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
 	margin-bottom: 40px;
}


.button {

font-family: 'Jeju Gothic', sans-serif;	
width: 300px; 
height: 80px;
font-size: 20px;
  background-color: #f4511e;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;

  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button:hover {opacity: 1}


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
          <li  class="active">희망 입소일 선택</li>          
          <li class="active"><p style="font-weight: bolder; font-size: 13px;">입소대기확정</li>
  </ul>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">5.　　입소신청이 완료되었습니다. 아래 정보를 확인해주세요.</h4><br>
<table class="type04">
    <tr>
        <th scope="row">아동 이름</th>
        <td>${cname}</td>
         <th scope="row">어린이집 이름</th>
        <td>${kinname}</td>
    </tr>
    <tr>
        <th scope="row">입소 대기 번호</th>
        <td>${re_enroll.encode}<br>
        <p style="font-size: 13px;">* 입소 대기 번호는 입소 순서와 무관합니다.</p></td>
 			 <th scope="row">입소 대기 상태</th>
 			
        <td>
        <c:choose>
        <c:when test="${re_enroll.statcode eq 1}">대기</c:when>
        <c:when test="${re_enroll.statcode eq 2}">추가대기</c:when>
        </c:choose>

       <br>
        <fmt:formatDate var="date_re" value="${re_enroll.enlog}" pattern="yyyy.MM.dd HH:mm:ss" />
         <p style="font-size: 13px; color: red;">※ ${date_re} 까지 입소 순위 배점과 관련한 자료를 제출하여 (추가)대기확정을 받아야 입소 대기 신청이 최종적으로 완료됩니다.	
        <p style="font-size: 13px;">▷대기: 해당 어린이집의 현원이 다 차지 않은 경우
        <br>▷추가 대기: 해당 어린이집의 현원과 정원이 같아 추가 대기가 필요한 경우
       </td>

    </tr>

        </table>
	<div id="btnid">
	<button class="button" onclick="location.href='gmenu9'">서류 제출하러 가기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="button" onclick="location.href='gmenu9'">대기현황 자세히 보기</button>

	</div>
</div>




</body>
</html>