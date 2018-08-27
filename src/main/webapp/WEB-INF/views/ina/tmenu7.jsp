<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style>
body{

    font-family: 'Jeju Gothic', sans-serif;	
}


#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
}

#discript_2{
float: left;
font-size: 17px;
margin: 35px;
width: 40%;
border: thin solid #bcbcbc;
height: 490px;
text-align: center;
padding: 25px;
}




h2{
padding-left: 50px;
}



@import url(https://fonts.googleapis.com/css?family=Roboto:300);


.login-page {
  width: 40%;
float: right;
margin: 20px;
   
}

.form {

  position: relative;
  z-index: 1;
  background-color: #ECEBFF;
  max-width: 550px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

.form input,.form select{
   font-family: 'Jeju Gothic', sans-serif;	
  outline: 0;
 
  width: 95%;
  border: 0;
  margin: 0 0 40px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button {

  text-transform: uppercase;
  outline: 0;
  border: 0;
  background-color: #7D78FF;
  width: 50%;
  padding: 15px;
  color: #FFFFFF;
  font-size: 16px;
  transition: all 0.3 ease;
  cursor: pointer;
}

.form button:hover,
.form button:active,
.form button:focus {
  background: #5954ED;
}

.form .message {
  margin: 15px 0 0;
  color: black;
  font-size: 15px;
}

.form .message a {
  color: #465489;
  text-decoration: none;
}

.form .register-form {
  display: none;
}


</style>
</head>
<body>
<div id="headdiv">
<h2>┃ 정기모집 등록</h2> 
<br>
<div id="discript_2">
<img src="resources/images/logo.png" style="height: 140px; width: 350px;">
<h4 style="margin-top: -30px;">정기모집 공고 등록 시, 유의 사항</h4>
<hr style="width: 90%; "><br>
<p style="font-size: 16px; text-align: left; margin-left: 50px;">- 정기모집은 상반기 1~2월 · 하반기 7~8월에 정기적으로 열리며, <br>모든 어린이집은 반드시 해당 기간 내에 정기모집 공고를 올려야합니다.
<br><br><br>- 현재 본 어린이집의 수용 가능 인원을 정확히 파악한 후에 신청인원을<br>입력해주세요.
<br><br><br>- 공고 게시일로부터 한달 이내에 입소처리를 진행해야 합니다.</p>
<br><hr style="width: 90%; "><br>
<br>
</div>

<div class="login-page">
  <div class="form">
	<form action="make_regular" method="POST">
	  <input type="hidden" name="sigungucode" value="${kinder_info.sigungucode}">
      <input type="hidden" name="kincode" value="${teacher.kincode}">
      <br><p style="font-size: 17px; margin-top:-10px; margin-bottom: 2px; text-align: left; margin-left: 15px; font-weight: bold;">어린이집 이름</p>
      <input type="text" value="${teacher.kinname}" disabled="disabled">
      <br><p style="font-size: 17px; margin-top:-10px; margin-bottom: 2px; text-align: left; margin-left: 15px; font-weight: bold;">모집인원</p>
      <input type="number" placeholder="모집 인원" name="renum">
      <br><p style="font-size: 17px; margin-top:-10px; margin-bottom: 2px; text-align: left; margin-left: 15px; font-weight: bold;">모집일자</p>
      <input type="datetime-local" name="reopen" placeholder="모집일자">
	  <br><p style="font-size: 17px; margin-top:-10px; margin-bottom: 2px; text-align: left; margin-left: 15px; font-weight: bold;">비고</p>
      <input type="text" name="redetail" placeholder="비고">
     
      <button type="submit">정기모집 등록</button>
    </form>
  </div>
</div>
</div>



</body>
</html>