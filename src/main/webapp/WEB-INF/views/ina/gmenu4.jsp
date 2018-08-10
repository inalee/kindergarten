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
<c:url var="join" value="resources/css/join.css"></c:url>
<link href="${join}" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function findkinder(){
	
	var popUrl = "/kinder/kinder_find";	//팝업창에 출력될 페이지 URL

	var popOption = "width=720, height=220";    //팝업창 옵션(optoin)

	window.open(popUrl,"",popOption);

}


function inum_check(inum1,inum2) {

	if (inum1 != "") {
		
		$("#ppwcheck").remove();
		
		var btnExp = /^\d{2}[0-1]\d[0-3]\d-?[1-6]\d{6}$/u;
		var total = inum1+inum2;
	
		if (!total.match(btnExp)) {
		
			$("#ppwcheck").remove();
			$("#cidnum2").after("<p style='color:red; font-size:12px; margin:0;' id='ppwcheck'>주민번호를 다시한번 확인해주세요.</p>");

		} else {

			$("#ppwcheck").remove();
// 			$("#cidnum2").after("<p style='font-size:12px; margin:0;' id='ppwcheck'>확인되었습니다.</p>");

		}

	}

	else {
		$("#ppwcheck").remove();
	}

}


//재학여부 판단 function
function Kinsort(sel) {
  
   if(sel=='재학중'){

      document.getElementById("kincode_1").disabled = false;
	  document.getElementById("findkin").disabled = false;
   }else if(sel=='미재학'){

	      document.getElementById("kincode_1").disabled = true;
	      document.getElementById("findkin").disabled = true;
   }
   
}

//부모와 주소 동일한지 체크
function addrCheck() {
  	 var addr = '${glogin.memaddress}';
	if(document.twin.samecheck.checked==true){
			document.twin.caddress.value = addr;
	}
	else{
		document.twin.caddress.value = "";
	}
}


</script>
<style type="text/css">
body{
    font-family: 'Jeju Gothic', sans-serif;	
}
select:disabled{
    background: #BDBDBD;
}
input[type="radio"]{
    back: red;
}

#wrapper2 {
	width: 1000px;
	margin:auto;
	position: relative;
}



#childform {
	position: relative;
	width: 800px;
	height: 720px;
	background: #FFFFFF;
	margin: 0 auto 0;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}


</style>
</head>
<body>

<div id="wrapper2">
	<div id="childform">
	<h1>내 아이 등록하기</h1>
	    <form action="/kinder/insertChild" method="post" name="twin">
	        <table width="800" height="380" cellpadding="0" style="border-collapse:collapse; font-size:12pt; text-align: left;">
	       
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">이름</td>

	                <td><input type="text" id="cname" name="cname"  required="required"  />
	                	               <input type="hidden" value = "${glogin.memid}" name="memid">
	                </td>
	            </tr>
        <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">성별</td>
	                <td>
	                       남아<input type="radio" name="cgen" value="남아" required="required"/>&nbsp;&nbsp;&nbsp;여아<input type="radio" name="cgen" value="여아" required="required"/>
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">연령</td>
	                <td><input type="text" name="cage" required="required" style="width: 50px;"/>&nbsp;세</td>
	            </tr>
	        
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	            <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">주소</td>
	                <td><input type="text" name="caddress" required="required" placeholder="ex>서울특별시 강남구 역삼동"  style="width: 360px;" />
	                <input type="checkbox" name="samecheck" id="sameAddr" onclick="javascript:addrCheck()" ><font style="font-size: 12px;">보호자 주소와 동일</font>

	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">주민번호</td>
	              <td><input type="text" name="cidnum1" id="cidnum1" required="required" onKeyUp="javascript:inum_check(cidnum1.value,cidnum2.value)" style="width: 100px;" />
	              &nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="cidnum2" name="cidnum2" required="required" onKeyUp="javascript:inum_check(cidnum1.value,cidnum2.value)" style="width: 100px;" /></td>
	        
	            </tr>
	               <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">성격</td>
	                <td><input type="number" name="pscode" placeholder="ex>활달함" required="required" /></td>
	              <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">취미</td>
	                <td><input type="number" name="hcode" placeholder="ex>독서" required="required" /></option>
	            </select></td>
	              <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">관심사</td>
	                <td><input type="text" name="cinterest" placeholder="ex>뽀로로" required="required" /></td>
	            
	              <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">주의사항</td>
	               
	                 <td> <textarea rows="5" name="ccaution" cols="90" placeholder="아이에 관한 주의사항을 적어주세요. ex>복용하는 약,행동발달 특성 등"></textarea></td>
	             <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">재학 여부</td>
	               	                <td>
	                       재학중<input type="radio" name="cstate" value="재학중" onchange="Kinsort(this.value)"  required="required"/>&nbsp;&nbsp;&nbsp;미재학<input type="radio" name="cstate" onchange="Kinsort(this.value)" value="미재학" required="required"/>
	                </td>
	            </tr>
	             <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">*</td>
	                <td width="20%">유치원 정보</td>
	               	                <td>
		                <button type="button" id="findkin" onclick="findkinder()" style="font-family: 'Jeju Gothic', sans-serif;">유치원 찾기</button>
		                <input type="text" disabled="disabled" id="kincode_1" name="kincode_1" style="width: 400px; height: 20px;">
		                <input type="hidden" id="kincode2" name="kincode2">
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	        </table>
	        <br />
	        <div style="text-align: center; position: relative; top: -15px; ">
				<button class="btn1">등록</button>
	        </div>
	    </form>
	</div>
	<br><br>
</div>
</body>
</html>