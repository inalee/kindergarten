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

</script>
</head>
<body>
	<div class='approvalForm'>
	<table class='formTable' border='1' align="center">
	<th rowspan="2" colspan="6" width="500px" ><h1>체험학습 진행 계획서</h1></th>
	<th width='100px' style='background-color: #f7f6f6;'>담 임</th>
	<th width='100px' style='background-color: #f7f6f6;'>원 장</th>
	<tr><td height="50px">확인란</td><td height="50px">확인란</td></tr>
	
	<tr><td class="subcate" colspan="2" width="30%">일 시</td><td colspan="7"></td></tr>
	<tr><td class="subcate" colspan="2">분 류</td><td colspan="3"></td><td colspan="1" width="100px" class="subcate">소 분 류</td><td colspan="3"></td></tr>			
	<tr><td class="subcate" colspan="1" rowspan="2" width="10px">장 소</td><td class="subcate" colspan="1">견 학 지</td><td colspan="3"></td><td colspan="1" width="100px" class="subcate">주 소</td><td colspan="3"></td></tr>
	<tr><td class="subcate" colspan="1">관 광 지</td><td colspan="3"></td><td colspan="1" width="100px" class="subcate">주 소</td><td colspan="3"></td></tr>
	<tr><td class="subcate" colspan="2">대 상</td><td colspan="7"></td></tr>		
	<tr><td class="subcate" colspan="2">인 원</td><td colspan="7"></td></tr>
	<tr><td class="subcate" colspan="2">준비물</td><td colspan="7"></td></tr>
	<tr><td class="subcate" colspan="9">견 학 목 적</td></tr>
	<tr><td colspan="9" style="height: 100px"><textarea class="remarks" placeholder="견학 목적을 작성해 주세요." required></textarea></td></tr>
	<tr><td class="subcate" colspan="9">견 학 계 획</td></tr>
	<tr><td colspan="9" style="height: 200px"><textarea class="remarks" placeholder="견학 계획을 작성해 주세요." required></textarea></td></tr>
	<tr><td class="subcate" colspan="9"><p>위 와 같이 체험학습을 진행하고자 하오니 결재 바랍니다.<br><p>
	<script>
	var date = new Date();
	document.write(date.getFullYear()+"년 "+(date.getMonth()+1) +"월 "+date.getDate()+"일");
	</script></td></tr>			
	</table>
	
	</div>
	
</body>
</html>