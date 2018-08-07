<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="author" content="http://wistrap.blogspot.co.id/">
  <meta content='Creative button style example' name='description'/>
  <meta content='creative button, button css style, css button effect, creative button style' name='keywords'/>
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
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


function regular_enroll(val1,val3) {

	if (val3=="") {
		alert("입소 희망일을 선택해주세요.");	
	}
	else{
		var val2 = "${param.recode}";
		var val4 = "${param.kincode}";
		
		$.post("insert_regular",{ ccode: val1, recode:val2, rehopedate:val3,kincode:val4 },function(){
			alert("정기모집 신청이 완료되었습니다.");
			window.close();
			opener.parent.location.reload();
		});
		
	}
	

}


</script>
</head>
<style>

body{
/* 	background-color: #FFE70A; */
		background-image: url('resources/images/cute4.gif');
	 height: 100%;
    background-position: center;
    background-size: cover;
    position: relative;
    font-family: 'Jeju Gothic', sans-serif;	
}
.container {
      width: 1300px;
    position: relative;
	margin: auto;

  }
  


#header{
position: relative;
margin: 50px auto;
margin-bottom: 30px;
width: 1300px;

}

#contain2{
width: 1300px;
border: dashed 2px white;
padding: 70px;
position: relative; 
margin: auto;
margin-top: 70px;
text-align: center;
font-family: 'Jeju Gothic', sans-serif;	
box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
margin-bottom: 30px;
}

#childform {
	margin-left: -40px;
	position: relative;
	width: 1100px;
	height: 470px;
	background: #FFFFFF;
	margin: 0 auto 0;
	padding: 45px;
	text-align: center;
	opacity: 0.95;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	margin-bottom: 80px;
}

#childform button{
margin: 0;

}

#contain3{
width: 1300px;
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
    width: 100%;
 	margin: auto; 
 	position: relative;
 	opacity: 0.9;
}

#mychild th{

background-color: #FFCD12;
font-size: 20px;
}


#mychild th, #mychild td {
    padding: 16px;
    text-align: center;

}

#mychild td{
	font-size: 18px;
    border-bottom: 1px solid #ddd;
}

#mychild tr:hover {
background-color:white;
}




#btnid{
	text-align:center;
 	margin: auto; 
 	position: relative;
 	margin-top: 100px;
 	margin-bottom: 40px;
}



.animate
{
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.action-button
{
	position: relative;
	padding: 20px 60px;
	  margin: 0px 10px 10px 0px;
	border-radius: 3px;
	font-size: 25px;
	text-decoration: none;	
	color: #F6F6F6;
}




.yellow
{
	background-color: #f1c40f;
	border-bottom: 5px solid #f39c12;
	text-shadow: 0px -2px #f39c12;
}

.action-button:active
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}

</style>
<body>

 
<div id="contain2">
<h1>${kininfo.kinname} 정기 모집 입소 신청하기</h1>
<br>
<form action="regular_enroll" method="post" name="twin">

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
<h2 style="margin-bottom: 10px; margin-top: 10px;">입소 신청 아동 기본 정보</h2>
</div>

	    <input type="hidden" name="ccode" id="ccode">

	        <table width="900" height="250" cellpadding="5" style="border-collapse:collapse; font-size:12pt;  text-align: left; margin: auto; position: relative; margin-bottom: 0;">
	    	
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
	            	             <tr class="register" height="30">
	                <td width="5%" align="center">○</td>
	                <td width="20%">입소 희망일</td>
	              <td>
	            <input type="date" id="rehopedate" name="rehopedate" required="required" style="width: 200px;"  /></td>
	       	</tr>

	            <tr height="7">
	                <td colspan="3"><hr /></td>
	            </tr>
	        </table>
	        <br />

	            				<div id="btnid">
	 <a class="action-button shadow animate yellow" onclick="regular_enroll(ccode.value,rehopedate.value)">신청하기</a>
	</div>
	</div>
</form>
</div>




</body>
</html>