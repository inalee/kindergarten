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
$(function() {
var re = '${kinnum}';
if(re=='over'){
	alert("입소 신청 가능 횟수(3회)를 초과하였습니다.")
	document.location.href="gmenu8";
}
});

function checkrank(total){
 	
	if (confirm("입소 신청 이후, 해당 사항 확인을 위한 서류 제출이 반드시 7일 이내에 이루어져야 최종적으로 신청이 완료가 됩니다.이를 확인하셨습니까?") == true){   
		
		 document.location.href="enroll_page3?totalnum="+total;
		

	}else{   
	    return;
	}
}


function calculate(val){

	  $("#totalnum").val(val);
}




</script>
</head>
<style>

body{

    font-family: 'Jeju Gothic', sans-serif;	
}


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

table.type05 {
	
	width: 1100px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 0 auto;
    position: relative;
}


table.type05 th {
   width: 250px;
    padding: 10px;
    font-weight: bold;
    font-size: 18px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
	 font-size: 17px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}



  .my-hr3 {
    border: 0;
    height: 2px;
    background: #D5D5D5;
    width: 800px;
    margin-top: 50px;
    margin-bottom: 50px;


  }





#btnid{

text-align:center;
 	margin: auto; 
 	position: relative;
 	margin-top: 60px;
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
  font-family: 'Jeju Gothic', sans-serif;	
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


#before:after {
  content: '\00ab';
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;	
}


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
          <li class="active">아동선택</li>
          <li class="active"><p style="font-weight: bolder; font-size: 13px;">추가정보입력</li>
          <li>입소 어린이집 검색·선택</li>
          <li>희망 입소일 선택</li>          
          <li>입소대기확정</li>
  </ul>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">2.　　입소 우선순위 계산을 위한 추가 정보를 입력해주세요.</h4><br>
<form action="enroll_page3" method="get" name="form_enroll">
<table class="type05">
    <tr>
        <th scope="row">입소순위점수</th>
        <td><input type="text" name="totalnum" id="totalnum" disabled="disabled" value=0>　점</td>
    </tr>
    <tr>
        <th scope="row" style="padding-top: 200px;">1순위</th>
        <td style=" padding: 20px;">
        <b>[자동연계항목] 보호자 실명인증을 하면 자동연계 확인됩니다.</b><br>
        <input type="radio" name="ranksel" id="sel1" value=100 onclick="javascript:calculate(this.value)">국민기초생활보장법에 따른 수급자(법정)<br>
        <input type="radio" name="ranksel" id="sel1" value=100 onclick="javascript:calculate(this.value)">국민기초생활보장법 제24조의 규정에 의한 차상위계층의 자녀(차상위 본인부담경감대상자)<br>
        <input type="radio" name="ranksel" id="sel1" value=100 onclick="javascript:calculate(this.value)">장애인복지법 제2조의 규정에 의한 장애인 중 보건복지부령이 정하는 장애등급 이상에 해당하는 자의 자녀<br>
        <input type="radio" name="ranksel" id="sel1" value=100 onclick="javascript:calculate(this.value)">아동복지시설에서 생활중인 영유아<br><br>
        <b>[국가보훈처 자동연계항목] ▶ 국가보훈처의 국가유공자 정보는 분기단위로 제공됩니다.</b><br>
		- 자동연계확인 불가시 ["자동연계를 통해 국가 유공자의 자녀로 확인되지 않은 경우"]를 선택하면 됩니다. <br>

<input type="radio" name="ranksel"  id="sel1" value=200 onclick="javascript:calculate(this.value)">국가 유공자 등 예우 및 지원에 관한 법률 제 4조 제1항에 따른 국가 유공자 중 전몰자(제3호), 순직자(제5호,제14호,제16호),상이자(제4호,제6호,제12호,제15호,제17호)로서 보건복지부령으로 정하는 자의자녀
 <br>
 <input type="radio" name="ranksel"  id="sel1" value=200 onclick="javascript:calculate(this.value)">자동 연계를 통해 국가 유공자의 자녀로 확인 되지 않은 경우(입소시, 증빙서류 수기 제출필요) <br> <br>
<b>[직접선택]</b><br>
<input type="radio" name="ranksel"  id="sel1" value=300 onclick="javascript:calculate(this.value)">부모가 모두 취업중인 경우로서 자녀가 3명 이상인 가구 <br>
 <input type="radio" name="ranksel"  id="sel1" value=200 onclick="javascript:calculate(this.value)">부모가 모두 취업중인 영유아 <br>
<input type="radio" name="ranksel"  id="sel1" value=200 onclick="javascript:calculate(this.value)">자녀가 3명 이상인 가구 총자녀수 <br>
<input type="radio" name="ranksel"  id="sel1" value=100 onclick="javascript:calculate(this.value)">영유아가 2자녀 이상 가구 영유아수   <br>
<input type="radio" name="ranksel"  id="sel1" value=100 onclick="javascript:calculate(this.value)">다문화가족지원법 제 2조 제 1호에 따른 다문화가족의 영유아 <br>
<input type="radio" name="ranksel"  id="sel1" value=100 onclick="javascript:calculate(this.value)">제1형 당뇨를 가진 경우로서 보육에 지장이 없는 영유아 <br>
        </td>
    </tr>
    <tr>
        <th scope="row">2순위</th>
        <td><input type="radio" name="ranksel"  id="sel1" value=50 onclick="javascript:calculate(this.value)">기타 한부모 조손 가족, 입양된 영유아<br>
        <input type="radio" name="ranksel"  id="sel1" value=50 onclick="javascript:calculate(this.value)">형제 자매가 재원중인 아동(어린이집 선택후 입소대기신청시 선택가능)<br>
        </td>
    </tr>

        <tr>
        <th scope="row">3순위</th>
        <td><input type="radio" name="ranksel"  id="sel1" value=0 onclick="javascript:calculate(this.value)">일반 영유아(선택사항 없음)<br></td>
    </tr>
</table>
	<div id="btnid">
	<button class="button" type="button" onclick="location.href='enroll_page'"><span id="before">이전 단계</span></button>　　
	<button class="button" type="button" onclick="checkrank(totalnum.value)"><span>다음 단계</span></button>
	</div>
</form>
<br><br>
</div>




</body>
</html>