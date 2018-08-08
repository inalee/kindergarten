<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
li{
	list-style : none;
}
.column{
	display:inline-block;
}
table {border-collapse: collapse;}
table th, td{
	text-align : center;
	border : 1px solid #FAECC5;
	top: 5px;
}
table th{
	background-color: #FFFED7;
	width : 25%;
}
#chlist {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #FFFFD2;
}

#chlist li a {
    display: block;
    color: #5D5D5D;
    padding: 8px 16px;
    text-decoration: none;
}

/* Change the link color on hover */
#chlist li a:hover {
    background-color: #FAF4C0;
    color: #000;
}
</style>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#img_state").on("click", function(){
		showDetail();
	});
	
});
function undefinedKin(ccode){
	alert($("#ch_"+ccode).text() + " 어린이는 유치원이 등록되지 않았습니다.")
}
function undefinedCl(ccode){
	alert($("#ch_"+ccode).text() + " 어린이는 반이 등록되지 않았습니다.")
}
function showDetail(){
	$("#cdetail").empty();
	var state = '${state}';
	if(state == "attend") state="등원";
	else if(state == "late") state="지각";
	else if(state == "leave") state="하원";
	else if(state == "absent") state="결석";
	$("#cdetail").append("<table><tr><th>등원시간</th><th>하원시간</th><th>상태</th></tr><tr><td>${time.atstime}</td><td>${time.atetime}</td><td>"+state+"</td></tr></table>").hide();
	$("#cdetail").fadeIn(500);
	//$("#cdetail").append("10:00</td><td>14:00</td><td>하원</td></tr></table>");
}
</script>
<c:url var="img_at" value="resources/images/attend.png"></c:url>
<c:url var="img_lt" value="resources/images/late.png"></c:url>
<c:url var="img_lv" value="resources/images/leave.png"></c:url>
<c:url var="img_as" value="resources/images/absent.png"></c:url>

<h1>출석 정보</h1>
<ul>
<!--  커밋해야함   -->
	<li class="column" style="vertical-align: top;">
		<ul id="chlist">
			<c:forEach items="${children}" var="i">
				<li>
					<c:if test="${i.kincode eq 0 }">
						<a href="javascript:undefinedKin(${i.ccode})" id="ch_${i.ccode}">${i.cname}</a>
					</c:if>
					<c:if test="${i.clcode eq 1 and i.kincode ne 0}">
						<a href="javascript:undefinedCl(${i.ccode})" id="ch_${i.ccode}">${i.cname}</a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1}">
						<a href="getChildAttendInfo?ccode=${i.ccode}" id="ch_${i.ccode}">${i.cname}</a>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</li>
	<li class="column" style="width:40%;vertical-align:top">
		<div>
<!-- 			<ul><li style="font-size:1.8em; font-weight: bold"></li></ul> -->
			<ul>
				<li>
				<table width=100%;>
					<tr><th style="width:30%">이름 </th><th style="width:70%">${chInfo.cname}</th></tr>
					<tr><th>유치원</th><th>${chInfo.kinname}</th></tr>
					<tr><th>반이름</th><th>${chInfo.clname}</th></tr>
					<tr><td>상태</td><td>
						<c:if test="${state eq 'attend'}"><img src="${img_at}" id="img_state"/></c:if>
						<c:if test="${state eq 'late'}"><img src="${img_lt}" id="img_state"/></c:if>
						<c:if test="${state eq 'leave'}"><img src="${img_lv}" id="img_state"/></c:if>
						<c:if test="${state eq 'absent'}"><img src="${img_as}" id="img_state"/></c:if>
						</td></tr>
				</table>
				</li>
			</ul>
		</div>
	</li>
	<li class="column" id="cdetail"style="width:40%;vertical-align:top; margin-left: 60px">
		
	</li>
</ul>
</body>
</html>