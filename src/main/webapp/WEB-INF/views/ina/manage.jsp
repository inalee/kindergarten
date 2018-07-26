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




.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
}

.button4:hover {background-color: #e7e7e7;}

</style>
<body>
<div id="header">
<h2>┃ 반 만들기</h2>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">생성할 반의 상세정보를 입력해주세요.</h4><br>

<form action="make_class" method="POST">
<table class="type04">

    <tr>
        <th scope="row">반이름</th>
        <td><input type="text" name="clname">
        <input type="hidden" name="kincode" value="${teacher.kincode}"></td>
         <th scope="row">반 연령대</th>
        <td><select id="agecode" name="agecode" style="width: 150px; height: 25px;">
			<option value="1">0-1세</option>
			<option value="2">1-2세</option>
			<option value="3">2-3세</option>
			<option value="4">3-4세</option>
			<option value="5">4-5세</option>
			<option value="6">5-6세</option>				
        </select></td>
    </tr>
    <tr>
        <th scope="row">상세나이</th>
        <td><input type="text" name="clage"></td>
 			 <th scope="row" >담당 선생님</th>
        <td><select style="width: 150px; height: 25px;" name="tecode">
        <c:forEach items="${teacherlist}" var="i">
        <option value="${i.tecode}">${i.memname}</option>
        </c:forEach>
        </select></td>
    </tr>
    <tr>
         <th scope="row" colspan="4" style="text-align: center; border-bottom: none;"><button type="submit" style="width: 200px; height: 60px;  margin-top: 15px; font-size: 20px;" class="button2 button4">만들기</button></th>
    </tr>
</table>
</form>
</div>

	

</body>
</html>