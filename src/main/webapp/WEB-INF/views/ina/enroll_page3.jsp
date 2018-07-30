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


function search_btn() {
	
	var psigungu = $("#sigungu").val();
	var pkinkind = $("#kinkind").val();
	var pkinname = $("#kinname").val();
	
	var target = document.getElementById("sigungu");
	var sigunguname = target.options[target.selectedIndex].text;
	
	var target2 = document.getElementById("kinkind");
	var kinkindname = target2.options[target2.selectedIndex].text;

	

	$.get("search_kinder",	{ sigungucode: psigungu, kinkindcode:pkinkind, kinname:pkinname }).done(function(data,state){

		$("#total").remove();
		$("#contain3").before("<h5 id='total' style='padding-left: 60px;'>총 "+data.length+"개의 어린이집이 검색되었습니다.</h5>"); 
		$("#mychild").empty();
		$("#mychild").append(" <tr><th>-</th><th>위치</th><th>어린이집</th><th>유형</th><th>정원</th><th>현원</th><th>상세정보</th></tr>");
		
		for (var i = 0; i < data.length; i++) {
		
			if(data[i].kinkindcode==1){
				var kinkind = "가정";
			}
			else if(data[i].kinkindcode==2){
				var kinkind = "국공립";
			}			
			else if(data[i].kinkindcode==3){
				var kinkind = "민간";
			}
			else if(data[i].kinkindcode==4){
				var kinkind = "법인·단체 등";
			}
			else if(data[i].kinkindcode==5){
				var kinkind = "사회복지법인";
			}
			else if(data[i].kinkindcode==6){
				var kinkind = "직장";
			}
			else if(data[i].kinkindcode==7){
				var kinkind = "협동";
			}
			

			$("#mychild").append("<tr id='trresult'><td><input type='hidden' id='kins' name='kins'><input type='radio' id='info_kinder' onclick='javascript:calculate((\""+data[i].kinname+"\"))' name='info_kinder' value='"+data[i].kincode+"'></td>"+
					"<td>"+data[i].sido+" "+sigunguname+"</td><td>"+data[i].kinname+"</td><td>"+kinkind+"</td><td>"+data[i].kinmax+"명</td><td>"+data[i].kincurrent+"명</td>"+   
				    "<td><a href='#'>[상세보기]</a></td></tr>");
		}
		
		});
	
	

}

function calculate(val1){
	$("#kins").val(val1);
}




function checkkind(){
	var data = 	$("#kins").val();
	var code = $("input:radio[name='info_kinder']:checked").val();
	if (confirm("선택하신 어린이집이 "+data+" 이(가) 맞습니까?") == true){   
		location.href='enroll_page4?kincode='+code;
	}else{   
	    return;
	}
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

table.type04 {
	width: 1050px;
	font-size: 16px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : auto;
  position: relative;

}
table.type04 th {
    width: 150px;
    padding: 15px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}


  .my-hr3 {
    border: 0;
    height: 2px;
    background: #D5D5D5;
    width: 800px;
    margin-top: 70px;
    margin-bottom: 70px;


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



#contain3{
width: 1200px;
position: relative; 
margin: auto;
}

#contain4{
width: 1200px;
position: relative; 
margin: auto;


}

#mychild{
	
    border-collapse: collapse;
    width: 90%;
 	font-size:12pt;
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


.button2 {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    font-family: 'Jeju Gothic', sans-serif;	
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.1s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
}

.button4:hover {background-color: #e7e7e7;}

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
          <li class="active">추가정보입력</li>
          <li class="active"><p style="font-weight: bolder; font-size: 13px;">입소 어린이집 검색·선택</li>
          <li>희망 입소일 선택</li>
          <li>입소대기확정</li>
  </ul>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">3.　　입소할 어린이집을 선택해주세요.</h4><br>
<table class="type04">
    <tr>
        <th scope="row">시/도</th>
        <td><select style="width: 150px; height: 25px;" name="sido">
        <option>서울특별시</option>
        </select></td>
         <th scope="row">시/군/구</th>
        <td><select id="sigungu" name="sigungucode" style="width: 150px; height: 25px;">
         	  <option value="0">--전체--</option>
              <option value="1">강남구</option>
              <option value="2">강동구</option>
              <option value="3">강북구</option>
              <option value="4">강서구</option>
              <option value="5">관악구</option>
              <option value="6">광진구</option>
              <option value="7">구로구</option>
              <option value="8">금천구</option>
              <option value="9">노원구</option>
              <option value="10">도봉구</option>
              <option value="11">동대문구</option>
              <option value="12">동작구</option>
              <option value="13">마포구</option>
              <option value="14">서대문구</option>
              <option value="15">서초구</option>
              <option value="16">성동구</option>
              <option value="17">성북구</option>
              <option value="18">송파구</option>
              <option value="19">양천구</option>
              <option value="20">영등포구</option>
              <option value="21">용산구</option>
              <option value="22">은평구</option>
              <option value="23">종로구</option>
              <option value="24">중구</option>
              <option value="25">중랑구</option>
        </select></td>
    </tr>
    <tr>
        <th scope="row">유형</th>
        <td><select id="kinkind" name="kinkindcode" style="width: 150px; height: 25px;">
        <option value="0">--전체--</option>
        <option value="1">가정</option>
        <option value="2">국공립</option>
        <option value="3">민간</option>
        <option value="4">법인·단체등</option>
        <option value="5">사회복지법인</option>
        <option value="6">직장</option>
        <option value="7">협동</option>
        </select></td>
 			 <th scope="row">어린이집명</th>
        <td><input type="text"  style="width: 250px; height: 20px;" name="kinname"  id="kinname" ></td>
    </tr>
    <tr>
         <th scope="row" colspan="4" style="text-align: center; border-bottom: none;"><button onclick="search_btn()" type="button" style="width: 200px; height: 60px;  margin-top: 15px; font-size: 20px;" class="button2 button4">검색</button></th>
     

    </tr>
</table>
<hr class="my-hr3">
  <div id="contain3">

   <table id="mychild" >

 
</table>
</div>

	<div id="btnid">
	<button class="button" type="button" onclick="location.href='enroll_page2'"><span id="before">이전 단계</span></button>　　
	<button class="button" type="button" onclick="checkkind()"><span>다음 단계</span></button>
	</div>
</div>




</body>
</html>