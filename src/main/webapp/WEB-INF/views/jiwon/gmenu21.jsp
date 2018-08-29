<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<c:url var="kids" value="resources/images/kids_2.png"></c:url>
<c:url var="phone" value="resources/images/phone.png"></c:url>
<c:url var="boy" value="resources/images/kids/boy.png"></c:url>
<c:url var="girl" value="resources/images/kids/girl.png"></c:url>
<style>
/* body{font-family: 'Jeju Gothic', sans-serif; } */
li{list-style : none;}
.column{display:inline-block;}
table {border-collapse: collapse;margin-top: 20px; font-size:20px;}
table th, td{text-align : center;border : 1px solid #FAECC5;top: 5px; padding:2px; padding-top: 10px; padding-bottom:10px;}
table th{background-color: #FFFED7;width : 25%;}
#chlist {list-style-type: none;margin: 0;padding: 0; position: fixed;margin-left:10px; border:thin solid grey; text-align:center}

#chlist li a {
/*  	background-color: #FFFFD2; */
    display: block;
    color: #5D5D5D;
    padding: 8px 16px;
    text-decoration: none;
    min-width: 100px;
    text-align : center;
    border-bottom : thin solid gray;
    font-size:18px;
}
/* Change the link color on hover */
#chlist li a:hover {
    background-color: #FAF4C0;
    color: #000;
}
.w3-col{display:inline-block;width:40%;margin-bottom:16px; text-align:center; background-color : white; padding:15px; margin-left:10px;}
.w3-col:hover{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
.w3-col button{
	background-color: white;
    border: 2px solid #e7e7e7;
    color: black;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px 7px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 12px;}
.w3-col button:hover {background-color: #e7e7e7;}
 #childAt{text-align:center; margin : 0 auto;width:80%; padding:0;}
 #gmenu21 {margin-bottom : 30px;}
</style>
<body>

<script>
$(function(){

	$(".btn_detail").on("click",function(){
		//alert(this.value);
		
		$.get("getChildAttendInfo", {"ccode" : this.value}, function(data){
			if(data.state == "attend") atstate = "등원";
			else if(data.state == "late") atstate = "지각";
			else if(data.state == "leave") atstate = "하원";
			else atstate = "미등원";
			
			document.getElementById('c_name').innerHTML = data.chInfo.cname;
			document.getElementById('kin_name').innerHTML = data.chInfo.kinname==null?"유치원이 등록되지 않았습니다.": data.chInfo.kinname;
			document.getElementById('kin_addr').innerHTML = data.kinInfo.kinaddress;
			document.getElementById('k_tel').innerHTML = data.kinInfo.kinphone;
			document.getElementById('cl_name').innerHTML = data.chInfo.clname;
			document.getElementById('t_name').innerHTML = data.teacher.memname;
			document.getElementById('atstime').innerHTML = data.time.atstime;
			document.getElementById('atetime').innerHTML = data.time.atetime;
			document.getElementById('atstate').innerHTML = atstate==null?"":atstate;
			document.getElementById('t_tel').innerHTML = "<span style='margin-right:10%;' >"+data.teacher.memphone+"</span><a href='tel:" +data.teacher.memphone+"'><img width='30px' src='${phone}'/></a>";
		})
		$('#info_modal').modal('show');
		
	});

$(".undefinedKin").on("click", function(){
	alert($("#ch_"+this.value).text().split(" ")[0] + " 어린이는 유치원이 등록되지 않았습니다.")
});
$(".undefinedCl").on("click",function(){
	alert($("#ch_"+this.value).text().split(" ")[0] + " 어린이는 반이 등록되지 않았습니다.")
})
});


</script>
<c:url var="img_at" value="resources/images/attend.png"></c:url>
<c:url var="img_lt" value="resources/images/late.png"></c:url>
<c:url var="img_lv" value="resources/images/leave.png"></c:url>
<c:url var="img_as" value="resources/images/absent.png"></c:url>

<h1 style="margin-left:30px">출석 확인 </h1>
		
<ul id="gmenu21" style="padding-left:5px;">


	<li class="column" style="vertical-align: top; width:200px;">
		<ul id="chlist">
			<c:forEach items="${children}" var="i">
				<li>
					<c:if test="${i.kincode eq 0 }">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}">${i.cname} <b>유치원미등록</b></a>
					</c:if>
					<c:if test="${i.clcode eq 1 and i.kincode ne 0}">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}">${i.cname} <b> 반미등록 </b></a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1 and i.state eq 0}">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}">${i.cname} <b>미등원</b></a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1 and i.state eq 1}">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}">${i.cname} <b>등원</b></a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1 and i.state eq 2}">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}">${i.cname} <b>지각</b></a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1 and i.state eq 3}">
						<a href="#ch_${i.ccode}" id="chi_${i.ccode}" class="moveBtn">${i.cname} <b>하원</b></a>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</li>
	<li class="column" id="childAt"  style="vertical-align:top;margin-top : 10px;">
		<c:forEach items="${children}" var="i">
			<div class="w3-col" id="ch_${i.ccode}">
<%-- 			  <div style="position:relative;top:20px; left:20px; width:70px;"><img src="${img_at}" id="img_state" style="width:80px;"/></div> --%>
		      <c:if test="${i.cgen eq '남아' }">
			     <img src="${boy}" style="width:200px">
			  </c:if>
			  <c:if test="${i.cgen eq '여아' }">
				 <img src="${girl}" style="width:200px">
			  </c:if>
		      <h3>${i.cname}</h3>
		      <p class="w3-opacity">${i.kinname}</p>
		      <p>${i.clname}</p>
		      <p>
		      <c:if test="${i.kincode eq 0 }">
		      	<button class="undefinedKin"  value="${i.ccode}">자세히보기</button>
		      </c:if>
		      <c:if test="${i.clcode eq 1 and i.kincode ne 0}">
					<button class="undefinedCl"  value="${i.ccode}">자세히보기</button>
				</c:if>
		      <c:if test="${i.kincode ne 0 and i.clcode ne 1}">
		      	<button class="btn_detail" data-target="#info_modal" value="${i.ccode}">자세히보기</button>
		      </c:if>
		      </p>
	    	</div>
    	</c:forEach>

</ul>

<!-- Modal -->
  <div class="modal fade" id="info_modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="width:700px">
        <div class="modal-header" style="vertical-align:middle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title" style=""><img src="${img_at}" style="float:left; width:42px;margin-left:5px;margin-right:7px;"/><b id="c_name"></b> 어린이</h2>
        </div>
        <div class="modal-body">
  			<table style="width:100%;margin-bottom:10px;">
  				<tr><th style="width:20%;">유치원</th><td style="width:30%;" id="kin_name"></td><th style="width:20%;">유치원주소</th><td id="kin_addr" colspan="3"></td></tr>
  				<tr><th style="width:20%;">반</th><td style="width:30%;" id="cl_name"></td><th style="width:20%;">담당선생님</th><td style="width:80%;" colspan="3" id="t_name"></td></tr>
  				<tr><th style="width:20%;">유치원연락처</th><td style="width:30%;" id="k_tel"></td><th style="width:20%;">선생님연락처</th><td style="width:30%;" id="t_tel"></td></tr>
  				<tr><th style="width:20%;">등원시간</th><td style="width:30%;" id="atstime"></td><th style="width:20%;">하원시간</th><td style="width:30%;" id="atetime"></tr>			
  				<tr><th style="width:20%;">출결상태</th><td id="atstate" colspan="3"></td></tr>
  			</table>
<!--   			<table style="width:100%;margin-bottom:10px;"> -->
<!--   				<tr><th>날짜</th><th>등원시간</th><th>하원시간</th><th>상태</th></tr>append로 할수있을듯..? -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
<!--   				<tr><td>2018.08.29</td><td id="atstime"></td><td id="atetiem"><td></tr> -->
		
<!--   			</table> -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>