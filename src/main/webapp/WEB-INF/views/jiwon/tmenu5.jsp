<%@page import="org.apache.ibatis.annotations.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 나중에 삭제 (teachermenu와 중복) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tmenu5 * { 
} 

li{
	list-style : none;
}
.column {
	display : inline-block;
	vertical-align: top;
}
table {border-collapse: collapse;}
table th, td{
	text-align : center;
	border : 1px solid #ddd;
	top: 5px;
}
table th{
	background-color: #EBF7FF;
	width : 33%;
}
table button {margin:5px;}

#classlist {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}

#classlist li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

/* Change the link color on hover */
#classlist li a:hover {
    background-color: #555;
    color: white;
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
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

.ShopContainer .atd_month {width:977px; height:105px; text-align:center; border:1px solid #e1e4e8; border-bottom:0; padding-top:30px; position:relative;}
.ShopContainer .atd_month .num {font-size:32px; font-weight:800; color:#333; vertical-align:middle; padding:0 18px; letter-spacing:-1px;}
.ShopContainer .atd_month a {display:inline-block; padding-top:6px;}
.ShopContainer .atd_month .my_count strong {font-size:20px; font-weight:800;}
.ShopContainer .atd_calendar {width:980px; height:auto; min-height:536px;  background:url('resources/images/bg_calendar.png') no-repeat; padding-top:31px;}
.ShopContainer .atd_calendar ul li {float:left; width:129.5px; height:91px; padding:10px 0 0 10px; position:relative;}
.ShopContainer .atd_calendar ul {margin:0; padding:0;}
.ShopContainer .atd_calendar ul li .d {font-size:13px; color:#333;}
.ShopContainer .atd_calendar ul li .giveaway {display:inline-block; width:48px; height:48px; background:url('/images/icon/icon_giveaway.png') no-repeat; position:absolute; right:5px; top:5px;}
.ShopContainer .atd_calendar ul li .ac {margin:1px; background-color: #998A00;}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

   	  var list = new Array(); 
   	  <c:forEach items="${clmem}" var="item">
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
                       'height':450
                       };
        
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
$(function(){
	var today = new Date();
	var com = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 10, 30);
	com = com.getTime();
	//현재 주소를 decoding
	var url = unescape(location.href); 
	//파라미터만 자르고, 다시 그분자를 잘라서 배열에 넣는다. 
	var clcode = (url.substring(url.indexOf("=")+1,url.length));
	if(!clcode.includes("kinder")){
	var clid = "#cl_" + clcode;
		$("#className").append($(clid).text());
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
				console.log("success");
			})	
			var chname = "#atCheck_" + ccode;
			var tename = "#atText_" + ccode;
			$(chname).empty();
			$(tename).empty();
			var btn = "<button class='leave' value='" + ccode + "' disabled='disabled'>하원</button>"
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
	} else {
		$("#className").append("학급 선택");
	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

	var d = new Date();
	var thisMonth = d.getMonth()+1;
	var atmonth = d.getFullYear() + "-" + thisMonth;
	$("#thisMonth").append(atmonth);
	drawCalendar();

});
function drawCalendar(){
	var d = new Date();
	var thisMonth = d.getMonth()+1;
	var atmonth = d.getFullYear() + "-" + thisMonth;
	var afterMonth = new Date(new Date(d.getFullYear(), d.getMonth()+2, 0));
	var lastday = afterMonth.getDate();
	$("#thisMonth").empty();
	$(".atd_calendar ul").empty();
	$("#thisMonth").append(atmonth);
	//alert(new Date(atmonth+"-1").getDay());
	var fdom = new Date(atmonth+"-1").getDay();
	for(var i=0; i<fdom; i++){
		$(".atd_calendar ul").append("<li><span class='d'></span></li>");
	}
	for(var i=0; i<lastday; i++){
		$(".atd_calendar ul").append("<li><span class='d'>"+(i+1)+"</span></li>");
	}
	
	
}
	function drawPrevCalendar(){
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 전달
		var lastMonth = new Date ( new Date( d.getFullYear(), d.getMonth() , 1 ).setDate( new Date( d.getFullYear(), d.getMonth() , 1 ).getDate() - 1 ) );
		var thisMonth = lastMonth.getMonth()+1;
		var atmonth = lastMonth.getFullYear() + "-" + thisMonth;
		var lastday = lastMonth.getDate();
		$("#thisMonth").empty();
		$(".atd_calendar ul").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		for(var i=0; i<fdom; i++){
			$(".atd_calendar ul").append("<li><span class='d'></span></li>");
		}
		for(var i=0; i<lastday; i++){
			$(".atd_calendar ul").append("<li><span class='d'>"+(i+1)+"</span></li>");
		}
		
	}
	function drawNextCalendar(){
		var mon = $("#thisMonth").text();
		var d = new Date(mon);
		// 다음달
	 	var afterMonth = new Date(new Date(d.getFullYear(), d.getMonth()+2, 0) + 1);
		var thisMonth = afterMonth.getMonth()+1;
		var atmonth = afterMonth.getFullYear() + "-" + thisMonth;
		$("#thisMonth").empty();
		$(".atd_calendar ul").empty();
		$("#thisMonth").append(atmonth);
		var fdom = new Date(atmonth+"-1").getDay();
		var lastday = afterMonth.getDate();
		for(var i=0; i<fdom; i++){
			$(".atd_calendar ul").append("<li><span class='d'></span></li>");
		}
		for(var i=0; i<lastday; i++){
			$(".atd_calendar ul").append("<li><span class='d'>"+(i+1)+"</span></li>");
		}
		
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
	}
	
</script>
</head>
<body>
<h1 id="className">&nbsp</h1>
	<ul class="tmenu5">
		<li class="column" style="vertical-align: top">
			<ul id="classlist">
				<c:forEach items="${classinfo}" var="i">
					<li><a href="getClassMember?clcode=${i.clcode}" id="cl_${i.clcode}">${i.clname}</a></li>
				</c:forEach>
			</ul>
		</li>		
		<li class="column" style="width:80%">
		<div class="tab">
		  <button id="defaultOpen" class="tablinks" onclick="openTab(event, 'atCheck')">출석체크</button>
		  <button class="tablinks" onclick="openTab(event, 'atMonth')">이달의 출석</button>
		</div>
		<div id="atCheck" class="tabcontent">
			<div style="display:inline-block; width:50%; vertical-align:top;text-align:center">
				<ul style="margin-top:10px">
				<li>
					<table width=100%;>
						<tr><th>이름 </th><th>상태</th><th> </th></tr>
						<c:forEach items="${clmem}" var="i">
							<c:if test="${i.atstate == 0}">
								<tr><td>${i.cname}</td><td id="atText_${i.ccode}">미출석</td><td id="atCheck_${i.ccode}"><button class="attend" value="${i.ccode}">출석</button></td></tr>
							</c:if>
							<c:if test="${i.atstate == 1 || i.atstate == 2}">
								<tr><td>${i.cname}</td><td id="atText_${i.ccode}">출석</td><td id="atCheck_${i.ccode}"><button class="leave" value="${i.ccode}">하원</button></td></tr>
							</c:if>
							<c:if test="${i.atstate eq 3}">
								<tr><td>${i.cname}</td><td id="atText_${i.ccode}">하원</td><td id="atCheck_${i.ccode}"><button value="${i.ccode}" disabled="disabled">하원</button></td></tr>
							</c:if>
						</c:forEach>
					</table>	
				</li>
				</ul>
			</div>
			<div style="display:inline-block; text-align:right" id="chart_div">
				
			</div>
			</div>
		
		<div id="atMonth" class="tabcontent">
			<ul>
			<li>
			<section class="ShopContainer">
			<h1>이달의 출석현황</h1>
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
<!-- 								<li> -->
<!-- 									<span class="d">1</span><br> -->
<!-- 									<h6 class="ac">출석 : 7</h6> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">2</span> -->
<!-- 									<h6 class="ac">출석 : 5</h6> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">3</span> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">4</span> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">5</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">6</span> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">7</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">8</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">9</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">10</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">11</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">12</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">13</span> -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">14</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">15</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">16</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">17</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">18</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">19</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">20</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">21</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">22</span>	 -->
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">23</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">24</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">25</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">26</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">27</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">28</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">29</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">30</span> -->
	
<!-- 								</li> -->
	
<!-- 								<li> -->
<!-- 									<span class="d">31</span> -->
	
<!-- 								</li> -->
<!-- 								<li><span class="d"></span></li><li><span class="d"></span></li><li><span class="d"></span></li><li><span class="d"></span></li> -->
							</ul>
							<div class="clear"></div>
						</div>
						<!--// 달력 -->
				</section> 
				</li>
			</ul>
		</div>
		</li>
	</ul>
</body>
</html>