<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:url var="join" value="resources/css/join.css"></c:url>
<link href="${join}" rel="stylesheet" type="text/css" />
<style type="text/css">
.photo {
	overflow: hidden;
    margin : 0 auto;
    top: 50%;
	width: 130px;
	height: 130px;
    overflow:hidden;
    border-radius: 50%;
}
.profile {
    margin-left: -22px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function MemsortFunc(sel) {

		if (sel == 1) {
			document.getElementById("grelation").disabled = true;
			document.getElementById("tmaster").disabled = false;
			document.getElementById("tmaster1").disabled = false;
			document.getElementById("kincode").disabled = false;
		} else if (sel == 0) {
			document.getElementById("tmaster").disabled = true;
			document.getElementById("tmaster1").disabled = true;
			document.getElementById("kincode").disabled = true;
			document.getElementById("grelation").disabled = false;
		}

	}


	$(function() {
// 		alert('${joinsort}');
		MemsortFunc('${joinsort}');
		
		$(".btn2").on("click", function(){
			if('${joinsort}'==0) {
				location.href = "/kinder/glogin"
			} else if('${joinsort}'==1) {
				location.href = "/kinder/tlogin"
			} else {
				location.href = "/kinder/"
			}
		})
	})
</script>
<style type="text/css">
select:disabled{
    background: #BDBDBD;
}
input[type="radio"]{
    back: red;
}
</style>
</head>
<body>

<div id="wrapper2">
	<div id="joinform">
		<img alt="logo" src="resources/images/logo.png" style="width: 300px; z-index: 2; margin-top: -50px; margin-bottom: -15px;">
	    <form action="/kinder/join" method="post" name="twin">
	    	<input type="hidden" id="memid" name="memid" value="${memid}" />
	        <div class="photo"><img src="${profileimage}" width=auto height="130" class="profile" /></div>
	        <table width="500" height="380" cellpadding="0" style="border-collapse:collapse; font-size:11pt; font-family: 'Nanum Gothic', sans-serif;">
<!-- 	            <tr height="7"> -->
<!-- 	                <td colspan="3"><hr /></td> -->
<!-- 	            </tr> -->
<!-- 	            <tr class="register" height="28"> -->
<!-- 	                <td width="5%" align="center">*</td> -->
<!-- 	                <td width="20%">회원 구분</td> -->
<!-- 	                <td><select  name="memsort" style="height: 23px; width: 100px;" onchange="MemsortFunc(this.value)"  > -->
<%-- 		                <c:if test="${joinsort==1}"> --%>
<!-- 		                	<option value="0"> 보호자</option> -->
<!-- 		               		<option value="1" selected="selected"> 선생님</option> -->
<%-- 		                </c:if> --%>
<%-- 		                <c:if test="${joinsort!=1||empty joinsort}"> --%>
<!-- 		                	<option value="0" selected="selected"> 보호자</option> -->
<!-- 	               			<option value="1"> 선생님</option> -->
<%-- 		                </c:if> --%>
<!-- 	            	</select></td> -->
<!-- 	            </tr> -->
<!-- 	            <tr height="7"> -->
<!-- 	                <td colspan="3"><hr /></td> -->
<!-- 	            </tr> -->
<!-- 	            <tr class="register" height="40"> -->
<!-- 	                <td width="5%" align="center">*</td> -->
<!-- 	                <td width="20%">ID</td> -->
<!-- 	                <td><input type="text" id="memid" name="memid" placeholder="ID" onKeyUp="javascript:id_check(memid.value)" required="required" onclick="this.placeholder = ''" /></td> -->
<!-- 	            </tr> -->
<!-- 	            <tr height="7"> -->
<!-- 	                <td colspan="3"><hr /></td> -->
<!-- 	            </tr> -->
<!--             <tr class="register" height="54"> -->
<!--                 <td width="5%" align="center">*</td> -->
<!--                 <td width="20%">비밀번호</td> -->
<!--                 <td><input type="password" id="mempw" name="mempw" id="pw"  required="required" placeholder="********" onKeyUp="javascript:pw_check(mempw.value)" onclick="this.placeholder = ''"/></td> -->
<!--             </tr> -->
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">이름</td>
	                <td><input type="text" name="memname" onclick="this.placeholder = ''"  required="required" value="${memname}" readonly="readonly"/></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">성별</td>
	                <td>
	          <c:if test="${gender == 'M'}">
		                       남자<input type="radio" name="memgen" value="male" required="required" checked="checked"/>&nbsp;
		                       여자<input type="radio" name="memgen" value="female" required="required"/>
	          </c:if>      
	          <c:if test="${gender == 'F'}">
		                       남자<input type="radio" name="memgen" value="male" required="required"/>&nbsp;
		                       여자<input type="radio" name="memgen" value="female" required="required"  checked="checked"/>
	          </c:if>      
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">회원 구분</td>
	                <td><select  name="memsort" style="height: 23px; width: 100px;" onchange="MemsortFunc(this.value)"  >
		                <c:if test="${joinsort==1}">
		                	<option value="0"> 보호자</option>
		               		<option value="1" selected="selected"> 선생님</option>
		                </c:if>
		                <c:if test="${joinsort!=1||empty joinsort}">
		                	<option value="0" selected="selected"> 보호자</option>
	               			<option value="1"> 선생님</option>
		                </c:if>
	            	</select></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">연령</td>
	                <td><input type="text" name="memage" placeholder="25" required="required" onclick="this.placeholder = ''" /></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">연락처</td>
	                <td><input type="text" name="memphone" placeholder="01012345678" required="required" onclick="this.placeholder = ''" /></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">주소</td>
	                <td><input type="text" name="memaddress" required="required" placeholder="서울특별시 강남구 역삼동" onclick="this.placeholder = ''" style="width: 360px;" /></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	             <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">관계</td>
	                <td><select id="grelation" name="grelation" style="height: 23px; width: 100px;">
	               <option value="부">부</option>
	               <option value="모">모</option>
	               <option value="조부모">조부모</option>
	               <option value="친인척">친인척</option>
	               <option value="기타">기타</option>
	            </select></td>
	            </tr>
	             <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	             <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">유치원 번호</td>
	                <td><select name="kincode" style="height: 23px; width: 100px;" id="kincode" disabled="disabled">
	               <option value="3"> 3</option>
	               <option value="4"> 4</option>
	            </select></td>
	            </tr>
	             <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">원장 여부</td>
	                <td>
	                       원장님<input type="radio" required="required" name="tmaster" id="tmaster1" value="1" disabled="disabled"/>&nbsp;선생님<input type="radio" id="tmaster" name="tmaster" required="required" value="0" disabled="disabled"/>
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	        </table>
	        <br />
	        <div style="text-align: center; position: relative; top: -10px;">
	        	<button class="btn2" type="button">취  소</button>
				<button class="btn1">회원가입</button>
	        </div>
	    </form>
	</div>
</div>
</body>
</html>