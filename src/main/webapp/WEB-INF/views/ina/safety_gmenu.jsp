<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){

  

});


function detailkinder(kincode){
	
	var popUrl = "http://info.childcare.go.kr/info/pnis/search/preview/SummaryInfoSlPu.jsp?flag=YJ&STCODE_POP="+kincode;	//팝업창에 출력될 페이지 URL
	var popOption = "width=600, height=700 top=50 left=300";    //팝업창 옵션(optoin)
	window.open(popUrl,"",popOption);	

}



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
		$("#next").remove();
		$("#mychild").empty();
		$("#mychild").append(" <tr><th>위치</th><th>어린이집</th><th>유형</th><th>전화번호</th><th>구분</th><th>안전정보 공시</th></tr>");
		
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
			
			$("#mychild").append("<tr id='trresult'>"+
					"<td>"+data[i].sido+" "+sigunguname+"</td><td>"+data[i].kinname+"</td><td>"+kinkind+"</td><td>"+data[i].kinphone+"</td><td>"+data[i].kinspec+"</td>"+   
				    "<td><a onclick='layer_open((\"modal\"),"+data[i].kincode2+",(\""+data[i].kinname+"\")"+",(\""+data[i].kinaddress+"\"))'><img style='width:50px; height:50px;' src='https://static8.depositphotos.com/1003938/1045/v/950/depositphotos_10451115-stock-illustration-funny-cartoon-builder.jpg'></a></td></tr>");
		}
			$("#mychild").after("<center><button id='next' class='button2 button4'>더보기▽</button></center>"); 
		

		  var list = $(".list tr");
		    var numToShow = 10;
		    var button = $("#next");
		    var numInList = list.length;
		    list.hide();
		    if (numInList > numToShow) {
		      button.show();
		    }
		    list.slice(0, numToShow).show();

		  	
		    $("#next").click(function(){
		    
		        var showing = list.filter(':visible').length;
		        list.slice(showing - 1, showing + numToShow).fadeIn();
		        var nowShowing = list.filter(':visible').length;
		        if (nowShowing >= numInList) {
		          button.hide();
		        }
		    });
		    
		});
	
	

	    
	
}


//Layer Popup
function layer_open(obj,obj2,obj3,obj4) {

	$.get("crawling_list",{kincode2:obj2}, function(result){

		var map = new Map();
		map = result;
		console.log(map);
		
		//이수인원
		$("#d1").empty();
		$("#d1").append(map['이수 인원']);

		//안전교육 훈련일자
		$("#d2").empty();
	 	$("#d2").append(map['훈련일자']);

		//가스 점검일
		$("#d3").empty();
	 	$("#d3").append(map['가스점검일']);
	 	
		//소방 안전 점검
		$("#d4").empty();
	 	$("#d4").append(map['소방안전 점검일']);
	
		//전기설비 점검일
		$("#d5").empty();
	 	$("#d5").append(map['전기설비 점검일']);
	 	
		//전기안전점검관리점검일자
			$("#d6").empty();
		 	$("#d6").append(map['전기안전점검관리점검일자']);
		 	
			//결과
			$("#d7").empty();
		 	$("#d7").append(map['점검결과']);


	 	
		//공제회가입현황/대상
		$("#d8").empty();
	 	$("#d8").append(map['공제회가입현황']);
	 	
		//영유아 생명·신체보상(의무가입)
		$("#table_div").empty();
	 	$("#table_div").append(
	 			"<tr><th>구분</th><th>해당 여부</th><th>가입 여부</th><th>업체명</th></tr>"+
	 		    "<tr><td>영유아 생명·신체보상(의무가입)</td>"+
	 		   "<td>"+map['영유아 생명·신체보상(의무가입) 해당여부']+"</td>"+
	 		   "<td>"+map['영유아 생명·신체보상(의무가입)']+"</td>"+
	 		   "<td>"+map['영유아 생명·신체보상(의무가입) 업체명']+"</td></tr>"+
	 		   
	 		    "<tr><td>화재(의무가입)</td>"+
		 		 "<td>"+map['화재(의무가입) 해당여부']+"</td>"+
		 		 "<td>"+map['화재(의무가입)']+"</td>"+
		 		 "<td>"+map['화재(의무가입) 업체명']+"</td></tr>"+		
		 		 
		 		 
		 		    "<tr><td>보육교직원 생명·신체</td>"+
			 		 "<td>"+map['보육교직원 생명·신체 해당여부']+"</td>"+
			 		 "<td>"+map['보육교직원 생명·신체']+"</td>"+
			 		 "<td>"+map['보육교직원 생명·신체 업체명']+"</td></tr>"+	
			 		 

			 		"<tr><td>가스배상 책임(집단급식소 운영)</td>"+
				    "<td>"+map['가스배상 책임(집단급식소 운영) 해당여부']+"</td>"+
				 	"<td>"+map['가스배상 책임(집단급식소 운영)']+"</td>"+
			 		"<td>"+map['가스배상 책임(집단급식소 운영) 업체명']+"</td></tr>"+	
			 		 
			 		 
				 	
			 		"<tr><td>놀이시설 안전(옥외놀이터 설치)</td>"+
				    "<td>"+map['놀이시설 안전(옥외놀이터 설치) 해당여부']+"</td>"+
				 	"<td>"+map['놀이시설 안전(옥외놀이터 설치)']+"</td>"+
				 	"<td>"+map['놀이시설 안전(옥외놀이터 설치) 업체명']+"</td></tr>"+
				 	
		
			 		"<tr><td>통학버스 책임(차량운행시설)</td>"+
				    "<td>"+map['통학버스 책임(차량운행시설) 해당여부']+"</td>"+
				 	"<td>"+map['통학버스 책임(차량운행시설)']+"</td>"+
				 	"<td>"+map['통학버스 책임(차량운행시설) 업체명']+"</td></tr>"+				 	
				 	
				 	
			 		"<tr><td>통학버스 종합(차량운행시설)</td>"+
				    "<td>"+map['통학버스 종합(차량운행시설) 해당여부']+"</td>"+
				 	"<td>"+map['통학버스 종합(차량운행시설)']+"</td>"+
				 	"<td>"+map['통학버스 종합(차량운행시설) 업체명']+"</td></tr>"	 	
	 	);
	 	
	 	
	// 어린이집 이름
	$("#kin_name").empty();
	$("#kin_name").append(obj3);
	
	//어린이집 이름 + 주소
	$("#kindetail").empty();
	$("#kindetail").append(obj4+"에 위치한 "+obj3+"은");
	});

	
    var temp = $('#' + obj);
    var bg = temp.parent().parent().find('.bg').hasClass('bg');
    if(bg) {
        $('html, body').css('overflow-y','hidden');
        temp.parent().parent().show();
        temp.parent().css('overflow-y','auto');
    }
    temp.find('.popcls').on('click', function(e){
        if(bg) {
            $('html, body, .ly_pop, .ly_pop .cont').removeAttr('style');
        }
        e.preventDefault();
    });
};


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
  
h2{
padding-left: 50px;
}

#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
margin-bottom: 50px;
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
margin-top: 60px;

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
    width: 900px;
    margin-top: 70px;
    margin-bottom: 70px;


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
    width: 100%;
 	font-size:12pt;
 	margin: auto; 
 	position: relative;
	margin-bottom: 20px;

}

#mychild th{

background-color: #D9E5FF;
}


#mychild th, #mychild td {
    padding: 10px;
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

.button4:hover {background-color: #B2CCFF;}


.button6 {
    background-color: #008CBA;
    color: white; 
    border: 2px solid #008CBA;
}

.button6:hover {
    background-color: white;
    color: black;
}

.buttonh {
	width: 100px;
	height: 30px;
    background-color: #C7D3ED; /* Green */
    border: none;
    color: black;
	opacity: 0.8;
    text-align: center;	
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    font-family: 'Jeju Gothic', sans-serif;	

}


#next {

border-radius: 7px;
width: 200px;
height: 40px;
position: relative;
display: inline-block;	
margin: auto;
}

#next:hover{
background-color: #EAEAEA;

} 

*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-text-size-adjust:none;-webkit-tap-highlight-color:rgba(0,0,0,0);-webkit-font-smoothing: antialiased}
html,body{height:100%;margin:0;padding:0}
body,p,ul,menu,ol,li,dl,dt,dd,form,table,th,td,fieldset,input,textarea,select,button,h1,h2,h3,h4,h5,h6,pre,address {margin:0; padding:0}

.ly_pop{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:99}
.ly_pop .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.4}
.ly_pop .popcls{position:absolute;top:-5px;right:3px;}
.ly_pop .cont{width: 100%;height: 100%;position: absolute;top: 0;left: 0;z-index:999;text-align: center}
.ly_pop .cont:before{height:100%;content:'';display:inline-block;vertical-align:middle}
.ly_pop .ele{
width:70%; height:95%; position:relative;display:inline-block;vertical-align:middle;margin:0 auto 0 -2px;
/* 		background:#FFFFE4; */
	background-image: url('resources/images/safety6.png');
    background-size: cover;
padding:15px;border-radius:5px;
}


#detail_con{
width: 100%;
height: 100%;

padding: 10px;
position: relative;
margin: auto 0;
text-align: center;
display:inline-block;
letter-spacing: 3px;
}


#title{
display:inline-block;
width: 40%;
text-align: center;
margin-left: 100px;
margin-top: 20px;
}

#content_safe{
width: 100%;
padding: 20px;
}


#table_div{

    border-collapse: collapse;
    width: 95%;
    text-align: center;
    font-size: 14px;
    margin-bottom: 5px;
}

#table_div th,#table_div td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

#table_div tr:hover {background-color:#FAECC5;}


</style>
</head>
<body>

<div id="headdiv">
<h2>┃어린이집 안전정보 공시</h2>
<div id="contain2">
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

  	 <ul class="list">
	   <table id="mychild" >
		</table>

</ul>

</div>
</div>
</div>



<div class="ly_pop">
	<div class="bg"><!-- shadow --></div>
	<div class="cont">
		<section id="modal" class="ele">

			<div id="detail_con">
				<div id="title">
							
					<img src='http://kodiklip.com/wp-content/uploads/2014/11/Safety-Icon.png' style="width: 70px; height: 70px; float: left;">　
					<br>
					<h2 style="float: left;" id="kin_name"></h2>

					<a href="" class="ico_com popcls" style="color: black;">[닫기]</a>
				</div>
				<div id="content_safe">
					<p id="kindetail"></p><p><font style="color: #F29661;">최근 3년간 보수교육 이수를 받은 원장 및 보육교사</font>가 총 <font style="color: #F29661;" id="d1">6명</font>입니다.</p>
					
					<p>또한 <font style="color: #F29661;" id="d2">2018-03-28</font>에 <font style="color: #F29661;">안전교육 실시 현황 및 소방대피 훈련</font>을 실시하였네요.</p>
					<br>
					<p>안전점검 실시 현황을 살펴보면 <font style="color: #F29661;">가스점검</font>은 <font style="color: #F29661;" id="d3">2017-05-19</font>,<font style="color: #F29661;">소방안전 점검</font>은 <font style="color: #F29661;" id="d4">2017-05-22</font>,</p>
					<p>마지막으로 <font style="color: #F29661;">전기설비 점검</font>은 <font style="color: #F29661;" id="d5">2017-05-16</font>에 실시되었습니다.</p>
					<br>
					<p><font style="color: #F29661;">전기안전점검관리</font>는 <font style="color: #F29661;" id="d6"></font>에 시행되었으며,점검결과는 <font style="color: #F29661;" id="d7">적합</font> 입니다.</p>
					<p>공제회 가입 현황을 보면,<font style="color: #F29661;">어린이집 안전공제회</font>의 대상자이며 현재 <font style="color: #F29661;" id="d8">가입</font> 상태입니다.</p>
					<br>
					<p><font style="color: #CC3D3D;">보험별 가입 상세 현황</font>은 다음과 같습니다.</p>
				</div>
				<div id="content_safe" style="margin-top: -25px;">

<table id="table_div">
  <tr>
    <th>구분</th>
    <th>해당 여부</th>
    <th>가입 여부</th>
  </tr>

</table>

	<p style="float: right; font-size: 12px; color: #003399; margin-right: 45px;">정보제공:어린이집정보공개포탈</p>
				</div>
			</div>
		</section>
	</div>
</div>

</body>
</html>