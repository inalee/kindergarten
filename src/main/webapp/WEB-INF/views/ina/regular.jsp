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

function upclass(pccode,pclcode) {

  var pkincode = "${teacher.kincode}";
	if (confirm("해당 아동의 반을 지정하시겠습니까?") == true){   
		
		$.post("update_class", {ccode:pccode,clcode:pclcode,kincode:pkincode}, function(result){
			alert("반 등록이 완료되었습니다.");
			location.reload();
	    });
		

	}else{   
	    return;
	}

	
}

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


.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 100%;
 	font-size:11pt;
 	margin: auto; 
 	position: relative;
 	background-color: #fff;

}

#mychild th{
 border-top: double #464646;
background-color: #f5f5f5;
}


#mychild th, #mychild td {
    padding: 20px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    
}

#mychild tr:hover {
background-color:#f5f5f5;
}


h2{
padding-left: 50px;
}


#contains{
margin: auto;
margin-top: 50px;
position: relative;
width: 95%;

}


</style>
</head>
<body>
<div id="headdiv">
<h2>┃정기모집 관리</h2>
<div id="contains">
		<table id="mychild">
  		<tr>
	<th>번호</th>
    <th>등록 일자</th>
    <th>모집 일자</th>  
    <th>모집 인원</th>
	<th>신청 인원</th>      
  	<th>비고</th>
  	<th>-</th>
  	<th>신청 페이지</th>
  </tr>
<c:forEach items="${regular_list}" var="i">
<fmt:formatDate var="date_re" value="${i.redate}" pattern="yyyy-MM-dd" />
  <tr>
    <td>${i.recode}</td>
	<td>${date_re}</td>
    <td>${i.reopen}</td>
    <td>${i.renum} 명</td>
    <td>${i.renum_2} 명</td>
    <td>${i.redetail}</td>
    <td>[자세히 보기]</td>
    <td><a href="#"><img style="width: 30px; height: 30px;" src="https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2/128/mouse-cursor-circle-blue-512.png"></a>
  </tr>
  </c:forEach>
</table>
</div>
</div>


</body>
</html>