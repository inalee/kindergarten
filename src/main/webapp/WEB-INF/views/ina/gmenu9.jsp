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
<style>
#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 150px;
/* border: thin solid black; */
}


.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 95%;
 	font-size:11pt;
 	margin: auto; 
 	position: relative;

}

#mychild th{

background-color: #D9E5FF;
}


#mychild th, #mychild td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

#mychild tr:hover {
background-color:#EBF3FB;
}







</style>
</head>
<body>
<div id="headdiv">

<h3>■ 대기현황</h3>
  <table id="mychild">
  <tr>
	<th>대기 번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
	<th>입소순번</th>
    <th>상태</th>    
    <th>자료제출하기</th>        
  </tr>

  <tr>
    <td>15</td>
	<td>김이안</td>
    <td>행복어린이집</td>
    <td>2017-06-10</td>
    <td>1번째/5명</td>
    <td>대기확정</td>
    <td>[제출]</td>
  </tr>
  <tr>
    <td>15</td>
	<td>김이안</td>
    <td>행복어린이집</td>
    <td>2017-06-10</td>
    <td>1번째/5명</td>
    <td>대기확정</td>
    <td>[제출]</td>
  </tr>
</table>
</div>
<br><br>

<br>


<br><br>


</body>
</html>