<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<c:url var="join" value="resources/css/join.css"></c:url>
<link href="${join}" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	function findkinder(){
	
		var popUrl = "kinder_find";	//팝업창에 출력될 페이지 URL

		var popOption = "width=750, height=220";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
	
	
	function MemsortFunc(sel) {
	
		if (sel == 1) {
			document.getElementById("grelation").disabled = true;
			document.getElementById("tmaster").disabled = false;
			document.getElementById("tmaster1").disabled = false;
			document.getElementById("findkin").disabled = false;
		} else if (sel == 0) {
			document.getElementById("tmaster").disabled = true;
			document.getElementById("tmaster1").disabled = true;
			document.getElementById("grelation").disabled = false;
			document.getElementById("findkin").disabled = true;
		}

	}

	function id_check(id) {
		if (id != "") {
			$
					.get(
							"/kinder/memIdcheck/?memid=" + id,
							function(data, state) {

								if (state == "success") {
									if (data == 1) {

										$("#pidcheck").remove();
										$("#memid")
												.after(
														"<p style='color:red; font-size:12px; margin:0;' id='pidcheck'>이미 존재하는 아이디 입니다.</p>");
									} else if (data == 0) {

										$("#pidcheck").remove();

										var btnExp = /^[a-z][a-zA-Z0-9]{5,15}$/;

										if (!id.match(btnExp)) {
											$("#pidcheck").remove();
											$("#memid")
													.after(
															"<p style='color:red; font-size:12px; margin:0;' id='pidcheck'>영 소문자로 시작하는 6~16글자 사이의 아이디를 입력해주세요.</p>");

										} else {
											$("#pidcheck").remove();
											$("#memid")
													.after(
															"<p style='font-size:12px; margin:0;' id='pidcheck'>사용가능한 아이디 입니다.</p>");

										}

									}

								} else {
									//실패한 경우
									alert("GET 실패");
								}
							});

		} else {
			$("#pidcheck").remove();
		}

	}

	function pw_check(pw) {

		if (pw != "") {

			$("#ppwcheck").remove();

			var btnExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

			if (!pw.match(btnExp)) {
				$("#ppwcheck").remove();
				$("#mempw")
						.after(
								"<p style='color:red; font-size:12px; margin:0;' id='ppwcheck'>숫자, 문자, 특수문자 1개 이상 포함한 8자리 이상의 비밀번호를 입력해주세요.(사용가능 특수문자:$,@,!,%,*,#,?,&)</p>");

			} else {
				$("#ppwcheck").remove();
				$("#mempw")
						.after(
								"<p style='font-size:12px; margin:0;' id='ppwcheck'>사용가능한 비밀번호입니다.</p>");

			}

		}

		else {
			$("#ppwcheck").remove();
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
	        <table width="500" height="380" cellpadding="0" style="border-collapse:collapse; font-size:11pt; font-family: 'Nanum Gothic', sans-serif;">
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
	            <tr class="register" height="40">
	                <td width="5%" align="center">*</td>
	                <td width="20%">ID</td>
	                <td><input type="text" id="memid" name="memid" placeholder="ID" onKeyUp="javascript:id_check(memid.value)" required="required" onclick="this.placeholder = ''" /></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
            <tr class="register" height="54">
                <td width="5%" align="center">*</td>
                <td width="20%">비밀번호</td>
                <td><input type="password" id="mempw" name="mempw" id="pw"  required="required" placeholder="********" onKeyUp="javascript:pw_check(mempw.value)" onclick="this.placeholder = ''"/></td>
            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">이름</td>
	                <td><input type="text" name="memname" placeholder="김이안" onclick="this.placeholder = ''"  required="required"/></td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="28">
	                <td width="5%" align="center">*</td>
	                <td width="20%">성별</td>
	                <td>
	                       남자<input type="radio" name="memgen" value="male" required="required"/>&nbsp;여자<input type="radio" name="memgen" value="female" required="required"/>
	                </td>
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
	                <td width="20%">유치원</td>
	                <td>
		                <button type="button" id="findkin" onclick="findkinder()">유치원 찾기</button>
		                <input type="text" disabled="disabled" id="kincode_1" name="kincode_1" style="width: 270px;">
		                <input type="hidden" id="kincode2" name="kincode2">
	                </td>
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