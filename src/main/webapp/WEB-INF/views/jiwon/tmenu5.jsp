<%@page import="org.apache.ibatis.annotations.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 나중에 삭제 (teachermenu와 중복) -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* body{font-family: 'Jeju Gothic', sans-serif; } */
.tmenu5 { margin-bottom: 80px; margin-left:0px; padding-left: 0px; text-align:center;} 
li{	list-style : none;}
.column {
	display : inline-block;
	vertical-align: top;
}
#clickedClass, #tmenuEnter { text-align : center;}
table {border-collapse: collapse; margin-bottom:20px;}
table th, td{
	text-align : center;
	border : 1px solid #ddd;
	top: 5px;
	font-size : 16px;
	border-right : hidden;
	border-left : hidden;
}
table th{
	height : 50px;
	background-color: #EBF7FF;
	padding : 5px;
	font-size : 18px;
}
table .tdst{text-align:right; }
table .tdbtn{text-align:center; }
#classlist {
    list-style-type: none;
    margin: 0;
    margin-right : 15px;
    padding: 0;
    width: 180px;
    background-color: white;
    text-align:center;
}
#classlist li {}
#classlist li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
    font-size:18px;
    border-bottom: thin solid black;
}

/* Change the link color on hover */
#classlist li a:hover, #classlist .active {
    background-color: #555;
    color: white;
}

.kinCon{
    padding: 6px 12px;
    border: 1px solid #ccc;
}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover { background-color: #ddd;}

/* Create an active/current tablink class */
.tab button.active {background-color: #ccc;}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
/* .tds{width:25%;} */
table button {
    background-color: white;
    border: 2px solid #e7e7e7;
    color: black;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px 7px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 12px;
}

table button:hover {background-color: #e7e7e7;}

.btn_disabled {background-color: #e7e7e7;}

.w3-ul{
	list-style-type:none;padding:0;margin:0;
	border:1px solid #ccc!important;
	text-align:center!important;
	margin : 10px;	
}
.w3-ul:hover{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
.w3-ul li{
	padding:8px 16px;border-bottom:1px solid #ddd;
}.w3-ul li:last-child{border-bottom:none}
.w3-dark-grey {color:#000!important;background-color:#f1f1f1!important;}
.w3-xlarge{font-size:24px!important}
.w3-padding-16{padding-top:16px!important;padding-bottom:16px!important}
.w3-padding-32{padding-top:32px!important;padding-bottom:32px!important}
.w3-light-grey{padding-top:24px;color:#000!important;background-color:#f1f1f1!important}

.ShopContainer .atd_month {width:977px; height:105px; text-align:center; border:1px solid #e1e4e8; border-bottom:0; padding-top:30px; position:relative;}
.ShopContainer .atd_month .num {font-size:32px; font-weight:800; color:#333; vertical-align:middle; padding:0 18px; letter-spacing:-1px;}
.ShopContainer .atd_month a {display:inline-block; padding-top:6px;}
.ShopContainer .atd_month .my_count strong {font-size:20px; font-weight:800;}
.ShopContainer .atd_calendar {width:980px; height:auto; min-height:536px;  background:url('resources/images/bg_calendar.png') no-repeat; padding-top:31px;}
.ShopContainer .atd_calendar ul li {float:left; width:139.5px; height:101px; padding:10px 0 0 10px; position:relative;}
.ShopContainer .atd_calendar ul {margin:0; padding:0;}
.ShopContainer .atd_calendar ul li .d {font-size:13px; color:#333;}
.ShopContainer .atd_calendar ul li .giveaway {display:inline-block; width:48px; height:48px; background:url('/images/icon/icon_giveaway.png') no-repeat; position:absolute; right:5px; top:5px;}
.ShopContainer .atd_calendar ul li .ac {margin:1px; background-color: #FFE08C;  text-align:center; color: #4B2C00}
.ShopContainer .atd_calendar ul li .lt {margin:1px; background-color: #FFC19E;  text-align:center; color: #4B2C00}
.ShopContainer .atd_calendar ul li .lv {margin:1px; background-color: #FFB9B9;  text-align:center; color: #4B2C00}
</style>
<c:url var="phone" value="resources/images/tphone.png"></c:url>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawColumnChart);
   	  var list = new Array(); 
   	  <c:forEach items="${children}" var="item">
   	  	list.push("${item.ccode}","${item.atstate}");
   	  </c:forEach>
   	  var state = new Array();
   	  state = [0, 0, 0, 0, 0];
   	  for (var i = 0; i < list.length/2; i++) {
		state[list[i*2+1]]++;
		}
		
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	// Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '상태');
        data.addColumn('number', '인원');
        data.addRows([
          ['결석', state[0]],
          ['출석', state[1]],
          ['지각', state[2]],
          ['하원', state[3]],
          ['기타', state[4]]
        ]);

        // Set chart options
        var options = {'title':'오늘의 출석 현황',
        			   'titleTextStyle':{fontSize : 20, bold : true},
        			   'fontSize' : 12,
                       'width':550,
                       'height':450,
                       'colors': ['#F15F5F', '#6799FF', '#D1B2FF', '#FAED7D', '#f6c7b6']
                       };
        
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      function drawChart2() {
      	// Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '상태');
          data.addColumn('number', '인원');
          data.addRows([
            ['결석', ${state[0]}],
            ['출석', ${state[1]}],
            ['지각', ${state[2]}],
            ['하원', ${state[3]}],
            ['기타', state[4]]
          ]);

          // Set chart options
          var options = {'title':'오늘의 출석 현황',
          			   'titleTextStyle':{fontSize : 20, bold : true},
          			   'fontSize' : 12,
                         'width':550,
                         'height':450,
                         'colors': ['#F15F5F', '#6799FF', '#D1B2FF', '#FAED7D', '#f6c7b6']
                         };
          
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
          chart.draw(data, options);
        }
      function drawColumnChart() {

		     $.ajax({
		
		          url : "week_attend",
		          timeout : 10000,
		          type : 'get',
		          dataType : 'json', // response 데이터 타입
		          success : function(data, state){
		              var jdata = new google.visualization.DataTable();
		
		              jdata.addColumn('string', '요일');
		              jdata.addColumn('number', '출석');
		              jdata.addColumn('number', '지각');
		              jdata.addColumn('number', '결석');
		
// 		              for(var i = 0; i < data.length; i++)
// 		                          jdata.addRow([data[i].day, data[i].attend, data[i].late, data[i].absent]);
		 				jdata.addRow(['2018.08.27', 13, 3, 1]);
		 				jdata.addRow(['2018.08.28', 15, 1, 1]);
		 				jdata.addRow(['2018.08.29', 3, 0, 0]);
		 				jdata.addRow(['2018.08.30', 0, 0, 0]);
		 				jdata.addRow(['2018.08.31', 0, 0, 0]);
		              //jdata = new google.visualization.DataTable(jdata);
		
		              // Set chart options
		              var options = {
		                          'width':1200,
		                          'height':300,
		                          'vAxis' :{
		                        	  viewWindow:{
		                                  'min':0
		                               }
		                          }
		              };
		
		              // Instantiate and draw our chart, passing in some options.
		              var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));
		              chart.draw(jdata, options);
		             
		          },
		          error : function(reqeust, state, error){
		              //alert(error);
		          }
		      })
      }
$(function(){
	var today = new Date();
	var com = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 10, 30);
	com = com.getTime();
	//현재 주소를 decoding
	var url = unescape(location.href); 
	if(url.includes("getClassMember")){
		$("#tmenuEnter").remove();
		$("#clickedClass").show();
		
	} else{
		$("#clickedClass").remove();
		$("#tmenuEnter").show();
	}
	//파라미터만 자르고, 다시 그분자를 잘라서 배열에 넣는다. 
	var clcode = (url.substring(url.indexOf("=")+1,url.length));
	if(!clcode.includes("kinder")){
	var clid = "#cl_" + clcode;
	$(clid).parent().addClass("active");
	
		$(".attend").on("click", function(){
			today = new Date();
			today = today.getTime();
			//alert(this.value);
			var ccode = this.value;
			
			$.post("addAttend", {ccode:ccode, clcode:clcode}).done(function(data, state){
				console.log("success");
			})	
			var chname = "#atCheck_" + ccode;
			var tename = "#atText_" + ccode;
			$(chname).empty();
			$(tename).empty();
			var btn = "<button class='leave' value='" + ccode + "' onclick='javascript:leaveCheck("+ccode+")'>하원</button>"
			$(chname).append(btn);
			$(tename).append("출석");
			if(com - today >= 0){
				state[0]--;
				state[1]++;
			}else{
				state[0]--;
				state[2]++;
			}
			drawChart();
		});
		$(".leave").on("click", function(){
			today = new Date();
			today = today.getTime();
			//alert(this.value);
			var ccode = this.value;
			
			$.post("addLeave", {ccode:ccode, clcode:clcode}).done(function(data, state){
			})	
			var chname = "#atCheck_" + ccode;
			var tename = "#atText_" + ccode;
			$(chname).empty();
			$(tename).empty();
			var btn = "<button class='btn_disabled'  disabled='disabled'>하원</button>"
			$(chname).append(btn);
			$(tename).append("하원");
			for (var i = 0; i < list.length/2; i++) {
				if(list[i*2] == ccode){
					if(list[i*2+1] == 1){
						state[1]--;
						state[3]++;
					}else{
						state[2]--;
						state[3]++;
					}
				}
			}
			drawChart();
		});
	}
	document.getElementById("defaultOpen").click();
	
	$(".chinfo").on("click",function(){
		//alert(this.value);
		
		$.get("getChnGInfo", {"ccode" : this.value}, function(data){
			document.getElementById('c_name').innerHTML = data.cname;
			document.getElementById('c_gender').innerHTML = data.cgen;
			document.getElementById('c_age').innerHTML = data.cage;
			document.getElementById('c_birth').innerHTML = data.cidnum.substring(0,6);
			document.getElementById('c_addr').innerHTML = data.caddress;
			document.getElementById('g_name').innerHTML = data.memname;
			document.getElementById('g_relation').innerHTML = data.grelation;
			document.getElementById('g_tel').innerHTML = "<span style='margin-right:10%;' >"+data.memphone+"</span><a href='tel:" +data.memphone+"'><img width='30px' src='${phone}'/></a>";
		})
		$('#info_modal').modal('show');
		
	});
	
	
});
function writeAttendState(pmonth){
	var url = unescape(location.href); 
	var clcode = (url.substring(url.indexOf("=")+1,url.length));
	$.post("getAttendState", {clcode:clcode, pmonth : pmonth}).done(function(data, state){
	       // alert("Data: " + data[0].date + "\nStatus: " + data[0].attend);
	        for ( var i=0; i<data.length; i++) {
	        	var day = "#day_" + data[i].date;
				$(day).append("<h6 class='ac'>출석 : "+ data[i].attend+"</h6>");
				$(day).append("<h6 class='lt'>지각 : "+ data[i].late+"</h6>");
				$(day).append("<h6 class='lv'>결석 : "+ data[i].absent+"</h6>");
			}
	        
	    });
	 
}

function drawCalendar(){
	var d = new Date();
	var thisMonth = d.getMonth()+1;
	var atmonth = d.getFullYear() + "-" + thisMonth;
	if(thisMonth <10) var pmonth = d.getFullYear() + "-0" + thisMonth;
	else var pmonth = atmonth;
	var lastday = (new Date(new Date(d.getFullYear(), d.getMonth()+1, 0))).getDate();
	$("#thisMonth").empty();
	$(".atd_calendar ul").empty();
	$("#thisMonth").append(atmonth);
	//alert(new Date(atmonth+"-1").getDay());
	var fdom = new Date(atmonth+"-1").getDay();
	for(var i=0; i<fdom; i++){
		$(".atd_calendar ul").append("<li><span class='d'></span></li>");
	}
	for(var i=0; i<lastday; i++){
		$(".atd_calendar ul").append("<li id=day_"+(i+1)+"><span class='d'>"+(i+1)+"</span></li>");
	}
	writeAttendState(pmonth);

}
	function drawPrevCalendar(){
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 전달
		var lastMonth = new Date ( new Date( d.getFullYear(), d.getMonth() , 1 ).setDate( new Date( d.getFullYear(), d.getMonth() , 1 ).getDate() - 1 ) );
		var thisMonth = lastMonth.getMonth()+1;
		var atmonth = lastMonth.getFullYear() + "-" + thisMonth;
		if(thisMonth <10) var pmonth = d.getFullYear() + "-0" + thisMonth;
		else var pmonth = atmonth;
		var lastday = lastMonth.getDate();
		$("#thisMonth").empty();
		$(".atd_calendar ul").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		for(var i=0; i<fdom; i++){
			$(".atd_calendar ul").append("<li><span class='d'></span></li>");
		}
		for(var i=0; i<lastday; i++){
			$(".atd_calendar ul").append("<li id=day_"+(i+1)+"><span class='d'>"+(i+1)+"</span></li>");
		}
		writeAttendState(pmonth);
	}
	function drawNextCalendar(){
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 다음달
	 	var afterMonth = new Date(new Date(d.getFullYear(), d.getMonth()+2, 0) + 1);
		var thisMonth = afterMonth.getMonth()+1;
		var atmonth = afterMonth.getFullYear() + "-" + thisMonth;
		if(thisMonth <10) var pmonth = d.getFullYear() + "-0" + thisMonth;
		else var pmonth = atmonth;
		$("#thisMonth").empty();
		$(".atd_calendar ul").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		var lastday = afterMonth.getDate();
		for(var i=0; i<fdom; i++){
			$(".atd_calendar ul").append("<li><span class='d'></span></li>");
		}
		for(var i=0; i<lastday; i++){
			$(".atd_calendar ul").append("<li id=day_"+(i+1)+"><span class='d'>"+(i+1)+"</span></li>");
		}
		writeAttendState(pmonth);
	}
	function leaveCheck(ccode){
		//var ccode = this.value;
		var url = unescape(location.href); 
		//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
		var clcode = (url.substring(url.indexOf("=")+1,url.length)); 
			$.post("addLeave", {ccode:ccode, clcode:clcode}).done(function(data, state){
				console.log("success");
			})	
		var chname = "#atCheck_" + ccode;
		var tename = "#atText_" + ccode;
		$(chname).empty();
		$(tename).empty();
		var btn = "<button class='leave' value='" + ccode + "' disabled='disabled'>하원</button>"
		$(chname).append(btn);
		$(tename).append("하원");
		window.location.href=window.location.href;
	}
	function openTab(evt, tabName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(tabName).style.display = "block";
	    evt.currentTarget.className += " active";
	    if(tabName == 'atMonth'){

		    var d = new Date();
			var thisMonth = d.getMonth()+1;
			var atmonth = d.getFullYear() + "-" + thisMonth;
			$("#thisMonth").append(atmonth);
			drawCalendar();
	   
	    }
	}
	
</script>
</head>

<body>
<h1 id="className" style="margin-left:50px"></h1>
	<ul class="tmenu5">
		<li class="column" style="vertical-align: top">
			<ul id="classlist">
				<c:forEach items="${classinfo}" var="i">
					<li><a href="getClassMember?clcode=${i.clcode}" id="cl_${i.clcode}">${i.clname}</a></li>
				</c:forEach>
			</ul>
		</li>		
		<li class="column" style="width:80%;" id="clickedClass" >
		<div class="tab">
		  <button id="defaultOpen" class="tablinks" onclick="openTab(event, 'atCheck')">출석체크</button>
		  <button class="tablinks" onclick="openTab(event, 'atMonth')">이달의 출석</button>
		</div>
		<div id="atCheck" class="tabcontent">
			<div style="display:inline-block; width:50%; vertical-align:top;text-align:center">
				<ul style="margin-top:10px">
				<li>
					<table width=100%;>
						<tr><th>이름 </th><th colspan="2">상태</th><th>학생정보</th></tr>
						<c:forEach items="${children}" var="i">
							<c:if test="${i.atstate == 0}">
<%-- 								<tr><td class="tds" width="15%">${i.cname}</td><td width="15%" id="atText_${i.ccode}"  class="tds">미출석</td><td width="50%" id="atCheck_${i.ccode}" class="tds"><button class="attend" value="${i.ccode}">출석</button><button class="etc" value="${i.ccode}">기타</button></td><td width="20%"><button class="chinfo" data-target="#info_modal" value="${i.ccode}" >Click</button></td></tr> --%>
								<tr><td class="tds">${i.cname}</td><td id="atText_${i.ccode}"  class="tdst">미등원</td><td id="atCheck_${i.ccode}" class="tdbtn"><button class="attend" value="${i.ccode}">출석</button></td><td width="20%"><button class="chinfo" data-target="#info_modal" value="${i.ccode}" >Click</button></td></tr>
							</c:if>
							<c:if test="${i.atstate == 1 || i.atstate == 2}">
								<tr><td class="tds">${i.cname}</td><td id="atText_${i.ccode}" class="tdst">등원</td><td id="atCheck_${i.ccode}" class="tdbtn"><button class="leave" value="${i.ccode}">하원</button></td><td width="20%"><button class="chinfo" data-target="#info_modal" value="${i.ccode}">Click</button></td></tr>
							</c:if>
							<c:if test="${i.atstate eq 3}">
								<tr><td class="tds">${i.cname}</td><td id="atText_${i.ccode}" class="tdst">하원</td><td id="atCheck_${i.ccode}" class="tdbtn"><button class="btn_disabled" disabled="disabled">하원</button></td><td width="20%"><button class="chinfo" data-target="#info_modal" value="${i.ccode}">Click</button></td></tr>
							</c:if>
						</c:forEach>
					</table>	
				</li>
				</ul>
			</div>
			<div style="display:inline-block; text-align:right" id="chart_div"></div>
			</div>
		
			<div id="atMonth" class="tabcontent">
				<ul>
				<li>
				<section class="ShopContainer">
							<!-- contents -->
							<div class="atd_month">
								<div class="inblock">
									<a href="javascript:drawPrevCalendar()" class="btn_left vam"><img src="http://image.ethefaceshop.com/tfsshopWebSrc/images/btn/btn_left_9.png" alt="전달"></a>
									<span class="num" id="thisMonth"></span>
									<a href="javascript:drawNextCalendar()" class="btn_right vam"><img src="http://image.ethefaceshop.com/tfsshopWebSrc/images/btn/btn_right_9.png" alt="다음달"></a>
								</div>
							</div>
		
							<!-- 달력 -->
							<!-- 출석체크되면 li에 클래스 "ac" 추가 -->					
							<div class="atd_calendar">
								<ul>
	
								</ul>
								<div class="clear"></div>
							</div>
							<!--// 달력 -->
					</section> 
					</li>
				</ul>
			</div>
		</li>
		<li class="column" style="width:80%;" id="tmenuEnter">
			<div class="kinCon">
				<div class="w3-third w3-margin-bottom"  style="display:inline-block; width:50%; vertical-align:top;">
			      <ul class="w3-ul">
			        <li class="w3-dark-grey w3-xlarge w3-padding-32">출석정보</li>
			        <li class="w3-padding-16"><b>등원</b> ${state[1]}</li>
			        <li class="w3-padding-16"><b>지각</b> ${state[2]}</li>
			        <li class="w3-padding-16"><b>하원</b> ${state[3]}</li>
			        <li class="w3-padding-16"><b>미등원</b> ${state[0]}</li>
			        <li class="w3-padding-16"><b>반미지정</b> ${state[4]}</li>
			        <li class="w3-light-grey"><b>총원</b>${state[5]}</li>
			      </ul>
			    </div>
				<div id="chart_div2" style="display:inline-block; text-align:right" ></div>
				<div>
					<h3 style="text-align:left; margin-left:30px">이주의 출석</h3>
					<div id="column_chart"></div>
				</div>
			</div>
		</li>
	</ul>
	
	
	  <!-- Modal -->
  <div class="modal fade" id="info_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">원생 정보</h4>
        </div>
        <div class="modal-body">
  			<table style="width:100%;margin-bottom:10px;">
  				<tr><th style="width:25%;">원생이름</th><td style="width:25%;" id="c_name"></td><th style="width:25%;">원생성별</th><td style="width:25%;" id="c_gender"></td></tr>
  				<tr><th>원생나이</th><td id="c_age"></td><th>생년월일</th><td id="c_birth"></td></tr>
  				<tr><th>원생주소</th><td id="c_addr" colspan="3"></td></tr>
  				
  			</table>
  			<table style="width:100%;">
  				<tr><th style="width:25%;">보호자이름</th><td style="width:25%;" id="g_name"></td><th style="width:25%;">원생과의 관계</th><td style="width:25%;" id="g_relation"></td></tr>
  				<tr><th>연락처</th><td id="g_tel" colspan="3"></td></tr>
  			</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>