<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
    box-sizing: border-box;
}
li{
	list-style:none;
}
#search_box{
	max-width: 300px;
	margin:20px;
}
#search_box input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
}
#search_box button {
    width: 20%;
    padding: 10px;
    background: #E8DB6B;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
}
#search_box button:hover {
    background: #C4B747;
}
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
#search_box{
	max-width: 300px;
	margin:20px;
}
#search_box input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
}
#search_box button {   
    width: 20%;
    padding: 10px;
    background: #E8DB6B;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
}
#search_box button:hover {
    background: #C4B747;
}

</style>
<body>
<script>
var text = "어린왕자";
var display=10;
var target = "book_adv";
$.get("naver_book", {"d_titl" : text, "display" : display, "target" : target}, function(data, state){
	
	items = data.items;
	ul = $("#naver_list");
	for(i=0; i<items.length; i++){
	image = items[i].image.split("type=m1&").join("");
		ul.append("<li><img width='200px' src='"+ image +"'/><a href='"+ items[i].link +"' target='_blank'><b></li>"+ items[i].title +"<li></b></a></li><li>"+ items[i].description+"</li>");
	}
});

function openTab(ccode) {
	//alert(ccode);
	$("#search_box").empty();
	$("#search_box").append("<input id='query' type='text'/><button onclick='search("+ccode+")'><i class='fa fa-search'></i></button>");
	$(".tabcontent").show();	
	tid = "tab_" + ccode;
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tid).style.display = "block";
    event.currentTarget.className += " active";
}
</script>
<h1>도서 추천</h1>
	<div class="gmenu20" style="width:98%; margin:0px auto">
		<div class="tab">
		  <c:forEach items="${children}" var="i">
		  	 <button id ="tab_${i.ccode}"class="tablinks" onclick="openTab(${i.ccode})">${i.cname}</button>
		  </c:forEach>
		</div>
		<div class="tabcontent">
			<div id="search_box">
			</div>
	        <div>
		        <ul id="ul_search" class="cont">
		        </ul>
		        <ul id="ul_recent" class="cont">
		        </ul>
		        <ul id="ul_freqCh" class="cont">
		        </ul>
		        <ul id="ul_popular" class="cont">
		        </ul>
		        <ul id="ul_base" class="cont">
		        </ul>
	        </div>
        </div>
	</div>
	<ul id="naver_list">
	</ul>


</body>
</html>