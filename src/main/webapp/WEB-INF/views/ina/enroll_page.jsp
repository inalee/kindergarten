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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function info(pname,pgen,page,paddress,pidnum1,pidnum2,pccode) {
	
	  $("#cname").val(pname);

	  if(pgen=="남아"){

		  $("input:radio[name='cgen']:radio[value='남아']").prop('checked', true); 
	  }
	  else if(pgen=="여아"){

		  $("input:radio[name='cgen']:radio[value='여아']").prop('checked', true); 
	  }
	 
	  $("#cage").val(page);
	  $("#caddress").val(paddress);
	  $("#cidnum1").val(pidnum1);
	  $("#cidnum2").val(pidnum2);
	  $("#ccode").val(pccode);
}

</script>
</head>
<style>
.container {
      width: 1300px;
    position: relative;
	margin: auto;

  }
  

  .progressbar {
      counter-reset: step;
  }
  
  .progressbar li {
      list-style-type: none;
      width: 20%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
  }
  .progressbar li:before {
      width: 30px;
      height: 30px;
      content: counter(step);
      counter-increment: step;
      line-height: 30px;
      border: 2px solid #7d7d7d;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background-color: white;
  }
  .progressbar li:after {
      width: 100%;
      height: 2px;
      content: '';
      position: absolute;
      background-color: #7d7d7d;
      top: 15px;
      left: -50%;
      z-index: -1;
  }
  .progressbar li:first-child:after {
      content: none;
  }
  .progressbar li.active {
      color: #4374D9;
  }
  .progressbar li.active:before {
      border-color: #4374D9;
 
        
  }
  .progressbar li.active + li:after {
      background-color: #4374D9;
 
  }

#header{
position: relative;
margin: 50px auto;
margin-bottom: 30px;
width: 1300px;

}

#contain2{
width: 1200px;

/* border: solid thin black; */
position: relative; 
margin: auto;
margin-top: 180px;

}

#childform {
	position: relative;
	width: 1100px;
	height: 450px;
	background: #FFFFFF;
	margin: 0 auto 0;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

#childform button{
margin: 0;

}

#contain3{
width: 1200px;
position: relative; 
margin: auto;
}

  .my-hr3 {
    border: 0;
    height: 2px;
    background: #D5D5D5;
    width: 800px;
    margin-top: 50px;
    margin-bottom: 50px;


  }


#mychild {

    border-collapse: collapse;
    width: 95%;
 	font-size:11pt;
 	margin: auto; 
 	position: relative;

}

#mychild th{

background-color: #D9E5FF;
}


#mychild th, #mychild td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

#mychild tr:hover {
background-color:#EBF3FB;
}




#btnid{

text-align:center;
 	margin: auto; 
 	position: relative;
 	margin-top: 100px;
 	margin-bottom: 40px;
}


.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #FAECC5;
  border: none;
  color: black;
  text-align: center;
  font-size: x-large;

  width: 400px;
  transition: all 0.1s;
  cursor: pointer;

  height: 60px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}


.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;	
}

#modibtn{

}

#childform a,#childform a:visited{

color: red;

}

#modia:hover {
    background-color: #C4DBF0;
}

</style>
<body>
<div id="header">
<h2>입소신청하기</h2>
<hr style="width: 4.5cm; float: left; margin-top: 0;">
</div>
<br>
  <div class="container">
      <ul class="progressbar">
          <li class="active"><p style="font-weight: bolder; font-size: 13px;">아동선택</li>
          <li>추가정보입력</li>
          <li>입소 어린이집 검색·선택</li>
          <li>희망 입소일 선택</li>          
          <li>입소대기확정</li>
  </ul>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">1.　　입소할 아동을 선택해주세요.</h4><br>
<form action="enroll_page2" method="post" name="twin">

<c:choose>
  <c:when test="${empty ChildVO}">
  <div id="nochild" style="margin: auto; position: relative; padding-left: 100px;  font-size: 17px; margin-top: -30px;">
       <p>등록된 아이가 없습니다.</p>
       <a href="gmenu4" style="text-decoration: none; font-size: 15px;">▶내아이 등록하러 가기</a>
       </div>
    </c:when>
 <c:otherwise>
  <div id="contain3">
   <table id="mychild">
  <tr>
    <th>-</th>
    <th>이름</th>
    <th>성별</th>
    <th>생년월일</th>
  </tr>
<c:forEach items="${ChildVO}" var="i">
<c:set var="cid" value="${i.cidnum}"/>
  <tr>
    <td><input type="radio"  required="required"  onclick="javascript:info('${i.cname}','${i.cgen}','${i.cage}','${i.caddress}','${fn:substring(cid,0,6)}','${fn:substring(cid,6,14)}','${i.ccode}')" id="sel" name="sel"></td>
	<td>${i.cname}</td>
    <td>${i.cgen}</td>
    <td>${fn:substring(cid,0,6)}</td>
  </tr>
</c:forEach> 
</table>

</div>
    </c:otherwise>
      </c:choose>
<hr class="my-hr3">

<div id="childform">
<div id="titlediv" style="border-bottom:double;    width: 280px; margin: 0 auto; position: relative;  margin-bottom: 50px;">
<h3 style="margin-bottom: 10px; margin-top: 10px;">입소 신청 아동 기본 정보</h3>
</div>

	    <input type="hidden" name="ccode" id="ccode">
	        <table width="1000" height="280" cellpadding="0" style="border-collapse:collapse; font-size:11pt; font-family: 'Nanum Gothic', sans-serif; text-align: left; margin: auto; position: relative; margin-bottom: 0;">
	    	
	            <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">이름</td>
	                <td><input type="text" id="cname" name="cname"  required="required"  disabled="disabled" />
	                </td>
	            </tr>
        <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">성별</td>
	                <td>
	                       남아<input type="radio" id="cgen" name="cgen" value="남아" required="required" disabled="disabled"  />&nbsp;&nbsp;&nbsp;여아<input type="radio"  id="cgen" name="cgen" value="여아" disabled="disabled"  required="required"/>
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	            <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">연령</td>
	                <td><input type="text"  id="cage" name="cage" required="required" style="width: 50px;"  disabled="disabled"/>&nbsp;세</td>
	            </tr>
	        
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	            <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">주소</td>
	                <td><input type="text" id="caddress" name="caddress" required="required" disabled="disabled"  style="width: 360px;" />
	                </td>
	            </tr>
	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>            
	             <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">주민번호</td>
	              <td><input type="text" name="cidnum1" id="cidnum1" required="required"  disabled="disabled"  style="width: 100px;" />
	              &nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="cidnum2" name="cidnum2" required="required"  disabled="disabled" style="width: 100px;" /></td>
	       	</tr>

	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	        </table>
	        <br />
			<a href="#" id="modia" style="margin-left: 820px; font-size: 15px; text-decoration: none;">▶아이 정보 수정하기</a>
				<div id="btnid">
	<button class="button"><span>다음 단계</span></button>
	</div>


	</div>
</form>
</div>




</body>
</html>