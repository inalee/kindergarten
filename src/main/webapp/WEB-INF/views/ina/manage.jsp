<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	var master = "${teacher.tmaster}";
	
	if(master=='false'){
		alert("원장만 접근 가능한 메뉴입니다.");
		location.href = "/kinder/tmain";
	}
	
});


</script>
</head>
<style>

body{
font-family: 'Jeju Gothic', sans-serif;	
background-color: #F9F9F9;
}
.container {
      width: 1300px;
    position: relative;
	margin: auto;

  }
  


#header{
position: relative;
margin: 50px auto;
margin-bottom: -85px;
width: 1300px;

}

#contain2{
width: 1200px;
/* border: solid thin black; */
position: relative; 
margin: auto;
margin-top: 60px;

}

table.type04 {
	width: 1050px;
	font-size: 17px;
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
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}




.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
    font-family: 'Jeju Gothic', sans-serif;	
}

.button4:hover {background-color: #e7e7e7;}

@import url(https://fonts.googleapis.com/css?family=Roboto:300);


.login-page {
  width: 550px;
  padding: 8% 0 0;
  margin: auto;
}

.form {

  position: relative;
  z-index: 1;
  background-color: #D9E5FF;
  max-width: 550px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

.form input,.form select{
   font-family: 'Jeju Gothic', sans-serif;	
  outline: 0;
 
  width: 85%;
  border: 0;
  margin: 0 0 25px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button {

  text-transform: uppercase;
  outline: 0;
  border: 0;
  background-color: #6799FF;
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
  background: #4375DB;
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
<body>
<div id="header">
<h2>┃ 신규반 추가</h2>
</div>
<div class="login-page">
  <div class="form">
    <form class="login-form" action="make_class" method="POST">
      <p class="message">생성할 반의 상세정보를 입력해주세요.</p><br>
      <input type="hidden" name="kincode" value="${teacher.kincode}">
      <input type="text" placeholder="반 이름" name="clname">
      <input type="text" placeholder="반 상세정보" name="clage">
      <select id="agecode" name="agecode" >
      		<option value="none" disabled="disabled" selected="selected">반 연령대</option>
			<option value="1">0-1세</option>
			<option value="2">1-2세</option>
			<option value="3">2-3세</option>
			<option value="4">3-4세</option>
			<option value="5">4-5세</option>
			<option value="6">5-6세</option>				
        </select><br>
        <select  name="tecode">
        <option disabled="disabled" selected="selected">담당 선생님</option>
        <c:forEach items="${teacherlist}" var="i">
        <option value="${i.tecode}">${i.memname}</option>
        </c:forEach>
        </select>
      <button type="submit">신규반 추가하기</button>
    </form>
  </div>
</div>
</body>
</html>