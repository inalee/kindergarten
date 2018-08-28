<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:url var="images" value="resources/images/"></c:url>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>

body{
font-family: 'Jeju Gothic', serif;
}

.approvalList {
	text-align: center;
	margin-top : 2%;
}

#apprList {
	vertical-align : center;
	margin: 0 auto;
	text-align: center;
    border-collapse: collapse;
    width: 70%;
    font-size: 20px;
}

#apprList th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

#apprList th {
background-color: #abddff;
}

/* #apprList tr:hover {background-color: #ddd;} */

.formTable th {
	background-color: #f7f6f6 !important;
} 

.formTable {
	padding: 0px !important;
} 

#before {
	width : 100px;
	height : 30px;
	background-color: #ff2f2f;
	text-align : center;
	vertical-align : center;
	color: white;
	margin: 0 auto;
	padding-top : 6px;
	font-size : 20px;
	border: 1px;
	border-radius: 6px
}

#after {
	width : 100px;
	height : 30px;
	background-color: #22cc0d;
	text-align : center;
	vertical-align : center;
	color: white;
	margin: 0 auto;
	padding-top : 6px;
	font-size : 20px;
	border: 1px;
	border-radius: 6px
}

.subcate {
background-color: #f7f6f6;
height: 30px;
font-weight: bold;
}

.remarks{
width: 99%;
height: 99%;
border: none;
resize: none;
}

</style>

<script>
function dateFormat(date){
	var dt = new Date(date);
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var year = dt.getFullYear();
	var date = year + '/' + month + '/' + day;
	
	return date;
}
	$(function() {
		$.ajax({
			url:'/kinder/getApvList',
			type:'get',
			success : function(data) {
				console.log(data);
				for(var i in data){
					$('#apprList').append("<tr id='apprAttr"+i+"'><td>"+data[i].apvcode+"</td>")
					var apvAtr = "#apprAttr" + i;
// 					var rqdt = new Date(data[i].apvrqdate);
// 					var apdt = new Datd(data[i].apvdate);
// 					var month = dt.getMonth()+1;
// 					var day = dt.getDate();
// 					var year = dt.getFullYear();
// 					var rqdate = year + '/' + month + '/' + day;
// 					var date = year + '/' + month + '/' + day;
					
					$(apvAtr).append("<td><a href='#' onclick='showDetail("+data[i].apvcode+","+i+","+data[i].apvdate+")'>"+data[i].apvtitle+"</a></td>")
					$(apvAtr).append("<td>"+data[i].apvclname+"</td>")
					$(apvAtr).append("<td>"+data[i].memname+"</td>")
					$(apvAtr).append("<td>"+dateFormat(data[i].apvrqdate)+"</td>")
					$(apvAtr).append("<td>"+(data[i].apvdate ? dateFormat(data[i].apvdate) : "-")+"</td>")
					if(data[i].apvdate == null){
						$(apvAtr).append("<td id='tdbefore"+i+"'><div id='before'>승인 대기</div></td></tr>")					
					}else{
						$(apvAtr).append("<td id='tdafter"+i+"'><div id='after'>승인 완료</div></td></tr>")
						
						
					}
					$('#apprList').append("<tr id='tr"+i+"' data-id='1' style='display:none;'><td colspan= 7><div id='div"+i+"' style='display:none;' '></div></td></tr>")
					
				}
			}
		})
	})
	
var isMst = <%=session.getAttribute("isMaster")%>;
	
var slideFlag = 0;
function showDetail(apvnum, num, apvdate) {
	var i = num;
	var n = "#div"+num;
	var m = "#tr"+num;
	var stick = Number($(m).data('id'));
	var teacher = "#teacher"+num;
	var date = "#date"+num;
	var catemain = "#catemain"+num;
	var catesub = "#catesub"+num;
	var mainplace = "#mainplace"+num;
	var mainaddr = "#mainaddr"+num;
	var tclass = "#class"+num;
	var person = "#person"+num;
	var subplace = "#subplace"+num;
	var subaddr = "#subaddr"+num;
	var materials = "#materials"+num;
	var apvpurpose = "#apvpurpose"+num;
	var apvremarks = "#apvremarks"+num;
	var master = "#master"+num;
	var apvAtr = "#apprAttr" + num;
	
	var table = "<table class='formTable' border='1' collapse='1' align='center'><th rowspan='2' colspan='6' width='1000px' ><h1>체험학습 진행 계획서</h1></th><th width='150px' style='background-color: #f7f6f6;'>담 임</th><th width='150px' style='background-color: #f7f6f6;'>원 장</th><tr><td height='50px' id='teacher"+i+"'></td><td height='50px' id='master"+i+"'></td></tr><tr><td class='subcate' colspan='2' width='20%'>일 시</td><td colspan='7' id='date"+i+"'></td></tr><tr><td class='subcate' colspan='2'>분 류</td><td colspan='3' id='catemain"+i+"'></td><td colspan='1' width='100px' class='subcate'>소 분 류</td><td colspan='3' id='catesub"+i+"'></td></tr><tr><td class='subcate' id = 'subcategr"+i+"' colspan='1' rowspan='2' width='10px'>장 소</td><td class='subcate' colspan='1' >견 학 지</td><td colspan='3' id='mainplace"+i+"'></td><td colspan='1' width='100px' class='subcate'>주 소</td><td colspan='3' id='mainaddr"+i+"'></td></tr><tr><td class='subcate' colspan='1'>관 광 지</td><td colspan='3' id='subplace"+i+"'></td><td colspan='1' width='100px' class='subcate'>주 소</td><td colspan='3' id='subaddr"+i+"'></td></tr><tr><td class='subcate' colspan='2'>대 상</td><td colspan='7' id='class"+i+"'></td></tr><tr><td class='subcate' colspan='2'>인 원</td><td colspan='7' id='person"+i+"'></td></tr><tr><td class='subcate' colspan='2'>준비물</td><td colspan='7' id='materials"+i+"'></td></tr><tr><td class='subcate' colspan='9'>견 학 목 적</td></tr><tr><td colspan='9' style='height: 100px'><p id='apvpurpose"+i+"'></p></td></tr><tr><td class='subcate' colspan='9'>견 학 계 획</td></tr><tr><td colspan='9' style='height: 200px'><p id='apvremarks"+i+"'></p></td></tr><tr><td class='subcate' colspan='9'><p>위 와 같이 체험학습을 진행하고자 하오니 결재 바랍니다.<br><p></td></tr></table>";
	
	slideFlag = slideFlag + stick;
	
	if(!apvnum) return;
	if(slideFlag % 2 != 0){
		
		$.ajax({
			url:'/kinder/getDetails',
			type:'get',
			data: {
			 apvcode : apvnum
			},
			success : function(data) {
				console.log(data);
				$(n).empty();
				$(n).append(table);
				$(teacher).append("<p>"+data[0].memname+"</p>")
				$(date).append("<p>"+data[0].ftselecteddate+"</p>")
				$(catemain).append("<p>"+data[0].catemain+"</p>")
				$(catesub).append("<p>"+data[0].catesub+"</p>")
				$(mainplace).append("<p>"+data[0].fttitle+"</p>")
				$(mainaddr).append("<p>"+data[0].ftaddr+"</p>")	
				$(tclass).append("<p>"+data[0].clname+"</p>")	
				$(person).append("<p>"+data[0].ftperson+"</p>")
				$(apvpurpose).append("<p>"+data[0].apvpurpose+"</p>")
				$(apvremarks).append("<p>"+data[0].apvremarks+"</p>")
// 				$(materials).append("<p>"+data[0].apvremarks+"</p>")
				
				
				if(isMst){
					console.log("원장")
					if(apvdate == null){
						$(master).append("<button onclick='approve("+apvnum+", "+num+")'>승인하기</button>")						
					}else{
						$(master).append("<img width='80%' src='${images}yebin-icon-approved.jpg'>");	
					}
				}else{
					console.log("선생")
					if(apvdate != null){
						$(master).append("<img width='80%' src='${images}yebin-icon-approved.jpg'>");	
					}
				}
				

				for(var i = 0; i < data.length; i++){
					var idx = Number(i+1);
					if(data[i].tourremarks != null){
						$(subplace).append("<p>"+idx+". "+data[i].tourremarks+"</p>")
						$(subaddr).append("<p>"+data[i].touraddr+"</p>")					
					}else{
						for(var j = 0; j < data[i].length; j++){
							if(j != data[i].length-1){
								$(materials).append(data[i][j]+", ");
							}else{
								$(materials).append(data[i][j]);	
							}
						}
					}
				}
			}
		})
		
		$(m).slideDown(300);
		$(n).slideDown(300);
		$(m).data('id', 0);
		slideFlag = 0;
	
	}else{
		$(m).slideUp(000);
		$(n).slideUp(500);
		$(m).data('id', 1);
	}
}
	
function approve(apvnum, num){
	var td = "#tdbefore" + num;
	var master = "#master" + num;
	var apvAtr = "#apprAttr" + num;
	
	$.ajax({
		url: '/kinder/postUpdateApv',
		type:'post',
		data: {
			apvcode : apvnum
		},
		success : function() {
			$(master).empty();
			$(master).append("<img width='80%' src='${images}yebin-icon-approved.jpg'>");
			$(td).empty();
			$(td).append("<div id='after'>승인 완료</div>");
			$(apvAtr).empty();
			$(apvAtr).append("<td>"+dateFormat(data[i].apvrqdate)+"</td>")
		}
	})
}	
	
	
</script>

</head>
<body>
<div class='approvalList'>

<h2>결재 승인/대기목록</h2>
<table id='apprList'>
  <tr>
    <th width='10%'>문서번호</th>
    <th width='35%'>제목</th>
     <th width='10%'>학급</th>
    <th width='10%'>선생님</th>
    <th width='10%'>요청일</th>
    <th width='10%'>승인일</th>
    <th width='10%'>승인 현황</th>
  </tr>
 
</table>
</div>

</body>
</html>
