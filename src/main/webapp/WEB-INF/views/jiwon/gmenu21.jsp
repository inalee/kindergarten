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
table {border-collapse: collapse;margin-top: 20px;}
table th, td{text-align : center;border : 1px solid #FAECC5;top: 5px;}
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
</style>
<body>

<script>
$(function(){
// 	$("#img_state").on("click", function(){
// 		showDetail();
// 	});
// 	var url = location.href;
// 	if( url.includes("getChildAttendInfo")){
// 		$("#kids_img").remove();
// 		$("#childAt").show();
// 		$("#cdetail").show();
// 	}else{
// 		$("#childAt").remove();
// 		$("#cdetail").remove();
// 		$("#kids_img").append("<img width='100%' src='${kids}'/>");
// 		$("#kids_img").show();
// 	}

	$(".btn_detail").on("click",function(){
		//alert(this.value);
		
// 		$.get("getChnGInfo", {"ccode" : this.value}, function(data){
// 			document.getElementById('c_name').innerHTML = data.cname;
// 			document.getElementById('c_age').innerHTML = data.cage;
// 			document.getElementById('c_birth').innerHTML = data.cidnum.substring(0,6);
// 			document.getElementById('c_addr').innerHTML = data.caddress;
// 			document.getElementById('g_name').innerHTML = data.memname;
// 			document.getElementById('g_relation').innerHTML = data.grelation;
// 			document.getElementById('g_tel').innerHTML = "<span style='margin-right:10%;' >"+data.memphone+"</span><a href='tel:" +data.memphone+"'><img width='30px' src='${phone}'/></a>";
// 		})
		$('#info_modal').modal('show');
		
	});
});
function undefinedKin(ccode){
	alert($("#ch_"+ccode).text() + " 어린이는 유치원이 등록되지 않았습니다.")
}
function undefinedCl(ccode){
	alert($("#ch_"+ccode).text() + " 어린이는 반이 등록되지 않았습니다.")
}

</script>
<c:url var="img_at" value="resources/images/attend.png"></c:url>
<c:url var="img_lt" value="resources/images/late.png"></c:url>
<c:url var="img_lv" value="resources/images/leave.png"></c:url>
<c:url var="img_as" value="resources/images/absent.png"></c:url>

<h1 style="margin-left:30px">출석 확인 </h1>
		
<ul style="padding-left:5px;">


	<li class="column" style="vertical-align: top; width:200px;">
		<ul id="chlist">
			<c:forEach items="${children}" var="i">
				<li>
					<c:if test="${i.kincode eq 0 }">
						<a href="javascript:undefinedKin" id="ch_${i.ccode}">${i.cname} 유치원미등록</a>
					</c:if>
					<c:if test="${i.clcode eq 1 and i.kincode ne 0}">
						<a href="javascript:undefinedCl(${i.ccode})" id="ch_${i.ccode}">${i.cname} 반미등록</a>
					</c:if>
					<c:if test="${i.kincode ne 0 and i.clcode ne 1}">
						<a href="getChildAttendInfo?ccode=${i.ccode}" id="ch_${i.ccode}">${i.cname} <b>등원</b></a>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</li>
	<li class="column" id="childAt"  style="vertical-align:top;margin-top : 10px;">
		<c:forEach items="${children}" var="i">
			<div class="w3-col" id="1">
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
		      <p><button class="btn_detail" data-target="#info_modal" value="${i.ccode}">자세히보기</button></p>
	    	</div>
    	</c:forEach>
    	<div class="w3-col">
	      <img src="${boy}" style="width:200px">
	      <h3>안형섭</h3>
	      <p class="w3-opacity">역삼가애유치원</p>
	      <p>햇님반</p>
	      <p><button class="w3-button">자세히보기</button></p>
    	</div>
    	<div class="w3-col" id="3">
	      <img src="${girl}" style="width:200px">
	      <h3>유선호</h3>
	      <p class="w3-opacity">역삼가애유치원</p>
	      <p>달님반</p>
	      <p><button class="w3-button">자세히보기</button></p>
    	</div>

</ul>

<!-- Modal -->
  <div class="modal fade" id="info_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center"><b id="c_name"></b> 아동</h4>
        </div>
        <div class="modal-body">
  			<table style="width:100%;margin-bottom:10px;">
  				<tr><th style="width:25%;">원생이름</th><td colspan="3" style="width:25%;" id="c_name"></td></tr>
  				<tr><th>등원시간</th><<td></td><th>하원시간</th><td><td></tr>			
  			</table>
  			<table style="width:100%;">
  				<tr><th style="width:25%;">담당선생님</th><td style="width:25%;" id="t_name"></td></tr>
  				<tr><th>연락처</th><td id="g_tel" colspan="3"></td></tr>
  			</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>