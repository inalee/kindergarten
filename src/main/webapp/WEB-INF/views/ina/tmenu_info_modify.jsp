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
margin-top: 60px;
margin-bottom: 50px;
}

table.type05 {
	width:100%;
	height:100%;
	font-size: 16px;
    border-collapse: separate;
    border-spacing: 1px;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 0 auto;
    position: relative;

}


table.type05 th {

	width: 80px;

    padding: 35px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
	

    padding: 35px;
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

#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
}


#discript4{
text-align: center;
position: relative;
margin: auto;
width: 1100px;
padding: 10px;

}

.button {
width: 300px; 
height: 80px;
font-size: 20px;
  background-color: #4374D9;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
	font-family: 'Jeju Gothic', sans-serif;	
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button:hover {opacity: 1}



</style>
<body>
<div id="header">
<h2>┃ 어린이집 정보 수정</h2>
</div>
<form action="modify_kinder" method="POST">
<div id="contain2">
<img src='http://jeffreylwilson.net/wp-content/uploads/2015/08/JLW-Header.png' style="width: 100%; height: 270px;">
<table class="type05">
    <tr>

        <th  scope="row">기관 이름</th>
        <td>${kininfo.kinname}</td>
        <th  scope="row">주소</th>
        <td><input type="hidden" value="${teacher.kincode}" name="kincode">
        <input type="text" name="kinaddress" value="${kininfo.kinaddress}" style="width: 300px; height: 20px; font-family: 'Jeju Gothic', sans-serif;	"></td>        
    </tr>
    <tr>
        <th scope="row" style="height:50px; ">구분</th>
        <td>${kininfo.kinkind}</td>
        <th scope="row">전화번호</th>
        <td><input type="text" name="kinphone" value="${kininfo.kinphone}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;	"></td>        
    </tr>
    <tr>
        <th scope="row" style="height:50px; ">반 갯수</th>
        <td>3개</td>
        <th scope="row">방 갯수</th>
        <td><input type="number" name="kinroom" value="${kininfo.kinroom}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　개</td>        
    </tr>
    <tr>
        <th scope="row">전체 면적</th>
        <td scope="row"><input type="number" name="kinarea"  value="${kininfo.kinarea}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　㎡</td>
        <th scope="row">놀이터 갯수</th>
        <td><input type="number" value="${kininfo.kinplay}" name="kinplay" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　개</td>   
    </tr>
    <tr>
        <th scope="row">전체 교직원 수</th>
        <td scope="row"><input type="number" name="kinteacher" value="${kininfo.kinteacher}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　명</td>
        <th scope="row">홈페이지</th>
        <td><input type="text" name="kinhome" value="${kininfo.kinhome}" style="width: 200px; height: 20px; font-family: 'Jeju Gothic', sans-serif;"></td>   
    </tr>
        <tr>
        <th scope="row">정원</th>
        <td scope="row"><input type="number" name="kinmax" value="${kininfo.kinmax}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　명</td>
        <th scope="row">현원</th>
        <td><input type="number" name="kincurrent"  value="${kininfo.kincurrent}" style="width: 100px; height: 20px; font-family: 'Jeju Gothic', sans-serif;">　명</td>   
    </tr>
</table>
</div>
<div id="headdiv">
<div id="discript4">
<button class="button" type="submit" >정보 수정하기</button>
<br><br><br>
</div>
</div>
</form>
</body>
</html>