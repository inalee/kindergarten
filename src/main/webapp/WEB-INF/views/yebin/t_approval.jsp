<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체험학습 진행 계획서 양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
div {
text-align: center;
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

$(function() {
	$.ajax({
		url : '/kinder/getReportForm',
		type : 'get',
		success : function(data) {
// 			alert(data)
			console.log(data);
			$('#teacher').append("<p>"+data[0].memname+"</p>")
			$('#date').append("<p>"+data[0].ftselecteddate+"</p>")
			$('#catemain').append("<p>"+data[0].catemain+"</p>")
			$('#catesub').append("<p>"+data[0].catesub+"</p>")
			$('#mainplace').append("<p>"+data[0].fttitle+"</p>")
			$('#mainaddr').append("<p>"+data[0].ftaddr+"</p>")	
			$('#class').append("<p>"+data[0].clname+"</p>")	
			$('#person').append("<p>"+data[0].ftperson+"</p>")
// 			$('#subcategr').attr('rowspan', data.length+1)

			for(var i = 0; i < data.length; i++){
				var idx = Number(i+1);
				if(data[i].tourremarks != null){
					$('#subplace').append("<p>"+idx+". "+data[i].tourremarks+"</p>")
					$('#subaddr').append("<p>"+data[i].touraddr+"</p>")					
				}else{
					for(var j = 0; j < data[i].length; j++){
						if(j != data[i].length-1){
							$('#materials').append(data[i][j]+", ");
						}else{
							$('#materials').append(data[i][j]);	
						}
					}
				}
			}

		}
	})
	
	window.parent.$("#requestApproval").on('click', function() {
		
		$.ajax({
			url: '/kinder/postSaveApv',
			type: 'post',
			data : {
				apvpurpose : $('#apvpurpose').val(),
				apvremarks : $('#apvremarks').val()
			},
			success : function() {
				window.parent.window.parent.location.href='/kinder/yebin/tmenu3'
			}
			
		})
		
		
		
	})
	
})

</script>
</head>
<body>
	<div class='approvalForm'>
	<table class='formTable' border='1' collapse='1' align="center">
	<th rowspan="2" colspan="6" width="500px" ><h1>체험학습 진행 계획서</h1></th>
	<th width='150px' style='background-color: #f7f6f6;'>담 임</th>
	<th width='150px' style='background-color: #f7f6f6;'>원 장</th>
	<tr><td height="50px" id='teacher'></td><td height="50px" id='master'></td></tr>
	<tr><td class="subcate" colspan="2" width="20%">일 시</td><td colspan="7" id='date'></td></tr>
	<tr><td class="subcate" colspan="2">분 류</td>
		<td colspan="3" id='catemain'></td>
		<td colspan="1" width="100px" class="subcate">소 분 류</td>
		<td colspan="3" id='catesub'></td></tr>			
	<tr><td class="subcate" id = 'subcategr'colspan="1" rowspan="2" width="10px">장 소</td>
		<td class="subcate" colspan="1" >견 학 지</td>
		<td colspan="3" id='mainplace'></td>
		<td colspan="1" width="100px" class="subcate">주 소</td>
		<td colspan="3" id='mainaddr'></td></tr>
	<tr><td class='subcate' colspan='1'>관 광 지</td><td colspan='3' id='subplace'></td>
	<td colspan='1' width='100px' class='subcate'>주 소</td><td colspan='3' id='subaddr'></td>
	</tr>
	<tr><td class="subcate" colspan="2">대 상</td>
		<td colspan="7" id='class'></td></tr>		
	<tr><td class="subcate" colspan="2">인 원</td>
		<td colspan="7" id='person'></td></tr>
	<tr><td class="subcate" colspan="2">준비물</td>
		<td colspan="7" id='materials'></td></tr>
	<tr><td class="subcate" colspan="9">견 학 목 적</td></tr>
	<tr><td colspan="9" style="height: 100px">
		<textarea class="remarks" id='apvpurpose' placeholder="견학 목적을 작성해 주세요." style='font-size: 24px;'></textarea></td></tr>
	<tr><td class="subcate" colspan="9">견 학 계 획</td></tr>
	<tr><td colspan="9" style="height: 200px">
		<textarea class="remarks" id= 'apvremarks' placeholder="견학 계획을 작성해 주세요." style='font-size: 24px;'></textarea></td></tr>
	<tr><td class="subcate" colspan="9"><p>위 와 같이 체험학습을 진행하고자 하오니 결재 바랍니다.<br><p>
	<script>
	var date = new Date();
	document.write(date.getFullYear()+"년 "+(date.getMonth()+1) +"월 "+date.getDate()+"일");
	</script></td></tr>			
	</table>	
	</div>
	
</body>
</html>