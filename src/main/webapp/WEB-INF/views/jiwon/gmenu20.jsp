<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.column {
	display : inline-block;
	vertical-align: top;
}
.cont{
	margin : 0px auto;
	margin-top : 20px;
	width : 96%;
	background-color: #EAEAEA;
	border-radius: 5%;
	padding:0px;
	text-align:center;
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
	margin-left:80%;
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

#chlist {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}

#chlist li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

/* Change the link color on hover */
#chlist li a:hover {
    background-color: #555;
    color: white;
}
.bookList {
	display:inline-block; 
	margin-top:10px; 
	margin-bottom:10px;
	text-align:center;
	width:25%;
}
.bookList ul{
	padding:0px;
}
.bookList a{
	color:#353535;
	text-decoration:none;
	
}
.div_b {
	padding-left : 10px;
	height : 40px;
	vertical-align : middle;
	background-color: #D5D5D5;
	font-size : 1.2em;
	font-weight: bold;
}
</style>
<body>
<script>

function clickBook(i, ccode){
	alert(i);
}
var start;
function search(ccode){
	//alert(ccode);
	 var query = document.getElementById('query').value;
	 var display=12;
   	 var target = "book_adv";
	 $.get("naver_book",{"d_titl" : query, "display" : 4, "start" : start}, function(data, state){
		 items = data.items;
		 query = !query? "어린이" : query;
		$("#ul_search").empty();
		$("#ul_search").append("<div class='div_b'>["+query+"] 검색 결과</div>");
	   for(var i = 0; i < items.length; i++){
		   image = items[i].image.split("type=m1&").join("");
		   title = items[i].title;
		   if(title.length > 18) title = title.substring(0,18) + "...";
            //$("#ul_search").append("<li class='bookList'><ul><a href='javascript:clickBook("+i+","+ccode+")'><li><img width='200px' src='"+ image +"'/></li><li>"+title+"</li></a><button type='button' class='btn btn-info btn-lg'  data-toggle='modal' data-target='#myModal'>자세히보기</button></ul></li>");     
		   $("#ul_search").append("<li class='bookList'><ul><li><img width='200px' src='"+ image +"'/></li><li>"+title+"</li><li class='cc'><button type='button' class='btn btn-info btn-lg'  data-toggle='modal' data-target='#myModal'>자세히보기</button></li></ul></li>");     

	   }
	 });
}
function openTab(ccode, tabName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
// 	$("#search_box").empty();
// 	$("#search_box").append("<input id='query' type='text'/><button onclick='search("+ccode+")'><i class='fa fa-search'></i></button>");
	for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}

// $(function(){
// 	$(".cc").on("click", function(){
// 		alert(this);
// 		alert("btn_info");
// 	});
	
// })
</script>
<h1>도서 추천</h1>
	<ul class="gmenu20" style="width:98%; margin:0px auto">
		<li class="column" style="vertical-align: top">
			<ul id="chlist">
				<c:forEach items="${children}" var="i">
					<li><a href="getBooks?ccode=${i.ccode}" id="cl_${i.ccode}">${i.cname}</a></li>
				</c:forEach>
			</ul>
		</li>
		<li class="column" style="width:80%">
			<div class="tab">
			  <button id="defaultOpen" class="tablinks" onclick="openTab(${param.ccode}, 'bookManage')">독서관리</button>
			  <button class="tablinks" onclick="openTab(${param.ccode}, 'bookRecom')">독서추천</button>
			</div>
			<div id="bookManage" class="tabcontent">
				<h3>독서관리</h3>
				<div style="width:45%;display:inline-block">
					카테고리별 분포
				</div>
				<div style="width:45%;display:inline-block">
					월별 독서량
				</div>
			</div>
			<div id="bookRecom" class="tabcontent">
				<div id="search_box">
					<input id='query' type='text'/><button onclick='search(${param.ccode})'><i class='fa fa-search'></i></button>
				</div>
				<div>
					<ul id="ul_search" class="cont">
		        	</ul>
				</div>
				<div style="display:inline-block; text-align:right" id="chart_div">
				</div>
			</div>
		</li>
	</ul>
	<ul id="naver_list">
	</ul>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">도서정보</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>