<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약내역</title>
<c:url var="myreservation" value="resources/hjcss/myreservation.css"></c:url>
<link href="${myreservation}" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	function delconfirm(cfrescode) {
		var message = confirm("정말로 예약을 취소하시겠습니까?");
		if(message==true) {
			location.href="deleteres?cfrescode="+cfrescode;
		}else
			return false;
	}
	
	var result = '${msg_del}';
	if(result=='success'){
		alert("취소되었습니다.");
	}
	
// 	var result = '${msg_res}';
// 	if(result=='success'){
// 		alert("예약 완료되었습니다.");
// 	}
	
</script>
</head>
<body>

<jsp:useBean id="toDay" class="java.util.Date" />
<jsp:useBean id="sysdate" class="java.util.Date" />

<div id="wrap">
	
	<table class="cafe_res" border="1" cellspacing="0">
		<colgroup>
			<col width="80">
			<col>
			<col width="115">
			<col width="330">
			<col>
			<col>
			<col>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">예약번호</th>
				<th scope="col">예약일시</th>
				<th scope="col" colspan="2">예약명</th>
				<th scope="col">날짜</th>
				<th scope="col">시간</th>
				<th scope="col">인원수</th>
				<th scope="col">예약현황</th>
				<th scope="col">취소</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach items="${res_list}" var="res_list">
				<c:if test="${res_list.cfimg==null || res_list.cfimg==''}">
					<c:set var="cfimg" value="resources/images/noimage.gif"></c:set>
				</c:if>
				<c:if test="${res_list.cfimg!=null && res_list.cfimg!=''}">
					<c:set var="cfimg" value="${res_list.cfimg}"></c:set>
				</c:if>
				
				<tr>
					<td>No.${res_list.cfrescode}</td>
					<td><fmt:formatDate value="${res_list.confirtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td onclick=""><img class="cfimg" src="${cfimg}"></td>
					<td><span class="cfname">${res_list.cfname}</span><br>${res_list.address}</td>
					<td>${res_list.cfresdate}</td>
					<td>${res_list.cfrestime_str}</td>
					<td>성인 ${res_list.adultsnum}명<br>어린이 ${res_list.kidsnum}명</td>
					
					
					<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today"/>
					<c:if test="${res_list.cfresdate<today}">
						<td><button type="button" class="res_state" id="gray" disabled="disabled">사용완료</button></td>
						<td></td>
					</c:if>
					<c:if test="${res_list.cfresdate>today}">
						<td><button type="button" class="res_state" id="blue" disabled="disabled">예약완료</button></td>
						<td><button type="button" class="res_state" id="yellow" onclick="delconfirm(${res_list.cfrescode})">취소</button></td>
					</c:if>
					<c:if test="${res_list.cfresdate==today}">
						<fmt:formatDate value="${sysdate}" pattern="HH" var="currtime"/>
						<c:if test="${res_list.cfrestime_lists[0]<=currtime}">
							<td><button type="button" class="res_state" id="gray" disabled="disabled">사용완료</button></td>
							<td></td>
						</c:if>
						<c:if test="${res_list.cfrestime_lists[0]>currtime}">
							<td><button type="button" class="res_state" id="blue" disabled="disabled">예약완료</button></td>
							<td><button type="button" class="res_state" id="yellow" onclick="delconfirm(${res_list.cfrescode})">취소</button></td>
						</c:if>
					</c:if>
				</tr>
			</c:forEach>
<!-- 			<tr> -->
<!-- 				<td>No.123</td> -->
<!-- 				<td>2018-08-27 12:00:34</td> -->
<!-- 				<td onclick=""><img class="cfimg" src="resources/images/noimage.gif"></td> -->
<!-- 				<td><span class="cfname">카페이름</span><br>카페주소카페주소카페주소카페주소카페주소카페주소카페주소카페주소</td> -->
<!-- 				<td>2018-08-27</td> -->
<!-- 				<td>12:00 ~ 13:59</td> -->
<!-- 				<td>성인 4명<br>어린이 3명</td> -->
<!-- 				<td><button type="button" class="res_state" id="blue" disabled="disabled">예약완료</button></td> -->
<!-- 				<td><button type="button" class="res_state" id="yellow">취소</button></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>No.123</td> -->
<!-- 				<td>2018-08-27 12:00:34</td> -->
<!-- 				<td onclick=""><img class="cfimg" src="resources/images/noimage.gif"></td> -->
<!-- 				<td><span class="cfname">카페이름</span><br>카페주소카페주소카페주소카페주소카페주소카페주소카페주소카페주소</td> -->
<!-- 				<td>2018-08-27</td> -->
<!-- 				<td>12:00 ~ 13:59</td> -->
<!-- 				<td>성인 4명<br>어린이 3명</td> -->
<!-- 				<td><button type="button" class="res_state" id="gray" disabled="disabled">사용완료</button></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
		</tbody>
	</table>

</div>

</body>
</html>