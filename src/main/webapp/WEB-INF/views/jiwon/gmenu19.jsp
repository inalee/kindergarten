<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:url var="search" value="resources/js/search.js"></c:url>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<style>
li { list-style : none;}
.cont{
	margin : 0px auto;
	margin-top : 20px;
	width : 96%;
	background-color: #EAEAEA;
	border-radius: 5%;
	padding:0px;
}
/* Style the tab */
.tab {
	margin-top : 30px;
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

* {
    box-sizing: border-box;
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

.videoList {
	display:inline-block; 
	margin-top:10px; 
	margin-bottom:10px;
	text-align:center;
}
.videoList a{
	color:#353535;
	text-decoration:none;
}
.div_v {
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
var reVideo = new Array();
var baVideo = new Array();
var seVideo = new Array();
var chVideo = new Array();
var popVideo = new Array();
//var ccode;
	function search(ccode){
		//alert(ccode);
		 var query = document.getElementById('query').value;
		 //alert(query);
		 $.get("youtubeApi",{"q" : query},function(data, state){
			query = !query? "어린이" : query;
			$("#ul_search").empty();
			$("#ul_search").append("<div class='div_v'>["+query+"] 검색 결과</div>");
		   for(var i = 0; i < data.items.length; i++){
			   var title = data.items[i].snippet.title;
			   if(title.length > 20) title = title.substring(0,18) + "...";
			   seVideo[i*4] = data.items[i].snippet.title; 
			   seVideo[i*4+1] = data.items[i].snippet.channelId; 
			   seVideo[i*4+2] = data.items[i].id.videoId;
			   seVideo[i*4+3] = query;
	            $("#ul_search").append("<li class='videoList'><ul><a href='javascript:clickVideo(3, "+i+","+ccode+")'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
		   }
		 });
	}
	function openTab(ccode) {
		//alert(ccode);
		$("#ul_freqCh").empty();
		$("#ul_recent").empty();	
		$("#ul_base").empty();
		$("#ul_popular").empty();
		$("#search_box").empty();
		$("#search_box").append("<input id='query' type='text'/><button onclick='search("+ccode+")'><i class='fa fa-search'></i></button>");
		$("#ul_search").empty();
		
		$.get("youtubeApiBase",{"ccode" : ccode},function(data, state){
			
			$("#ul_base").append("<div class='div_v'>킨더가든 추천 영상</div>");
			   for(var i = 0; i < data.items.length; i++){
				   var title = data.items[i].snippet.title;
				   if(title.length > 20) title = title.substring(0,18) + "...";
				   baVideo[i*3] = data.items[i].snippet.title; 
				   baVideo[i*3+1] = data.items[i].snippet.channelId; 
				   baVideo[i*3+2] = data.items[i].id.videoId;
				   $("#ul_base").append("<li class='videoList'><ul><a href='javascript:clickVideo(1, "+i+","+ccode+")'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
				   //$("#ul_base").append("<li style='display:inline-block; margin-top:10px; margin-bottom:10px'><ul><a href='http://www.youtube.com/watch?v="+data.items[i].id.videoId+"'target='_blank'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
			}
		});
		$.get("youtubeApiRecent", {"ccode" : ccode}, function(data, state){
			
			var vname = data[1].vname;
			if(vname.length>10) vname = vname.substring(0,10)+"...";
			var data = data[0];					
			$("#ul_recent").append("<div class='div_v'>최근 본  ["+vname+"] 비슷한 영상</div>");
			   for(var i = 0; i < data.items.length; i++){
				   var title = data.items[i].snippet.title;
				   if(title.length > 20) title = title.substring(0,18) + "...";
				   reVideo[i*3] = data.items[i].snippet.title; 
				   reVideo[i*3+1] = data.items[i].snippet.channelId; 
				   reVideo[i*3+2] = data.items[i].id.videoId;
				   $("#ul_recent").append("<li class='videoList'><ul><a href='javascript:clickVideo(2, "+i+","+ccode+")'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
			}
		});
		$.get("youtubeApiFreqCh", {"ccode" : ccode}, function(data, state){
			var chname = data.items[0].snippet.channelTitle;
			
			$("#ul_freqCh").append("<div class='div_v'>자주 본 ["+ chname +"] 채널의 다른 영상</div>");
			for(var i = 0; i < data.items.length; i++){
			   var title = data.items[i].snippet.title;
			   if(title.length > 20) title = title.substring(0,18) + "...";
			   chVideo[i*3] = data.items[i].snippet.title; 
			   chVideo[i*3+1] = data.items[i].snippet.channelId; 
			   chVideo[i*3+2] = data.items[i].id.videoId;
			   $("#ul_freqCh").append("<li class='videoList'><ul><a href='javascript:clickVideo(4, "+i+","+ccode+")'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
			   //$("#ul_base").append("<li style='display:inline-block; margin-top:10px; margin-bottom:10px'><ul><a href='http://www.youtube.com/watch?v="+data.items[i].id.videoId+"'target='_blank'><li><img src='http://i.ytimg.com/vi/" + data.items[i].id.videoId + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
			}
		});
		$.get("getPopV", function(data, state){
			$("#ul_popular").append("<div class='div_v'>킨더가든 인기 영상</div>");
			for(var i = 0; i < data.length; i++){
			   var title = data[i].vname;
			   if(title.length > 20) title = title.substring(0,18) + "...";
			   popVideo[i*3] = data[i].vname; 
			   popVideo[i*3+1] = data[i].vchannel; 
			   popVideo[i*3+2] = data[i].vid;
			   $("#ul_popular").append("<li class='videoList'><ul><a href='javascript:clickVideo(5, "+i+","+ccode+")'><li><img src='http://i.ytimg.com/vi/" + data[i].vid + "/mqdefault.jpg'/></li><li>"+title+"</li></a></ul></li>");
			}
		});
		//var i, tabcontent, tablinks;    
		//tabcontent = document.getElementsByClassName("tabcontent");
	    $(".tabcontent").show();	
	    tid = "tab_" + ccode;
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(tid).style.display = "block";
	    event.currentTarget.className += " active";
	    
	}
	
	function clickVideo(num, i,ccode){
		//alert(ccode);
		if(num == 1){
			vname = baVideo[i*3]; 
			vchannel = baVideo[i*3+1];
			vid = baVideo[i*3+2];
			keyword = null;
		}
		if(num == 2){
			vname = reVideo[i*3]; 
			vchannel = reVideo[i*3+1];
			vid = reVideo[i*3+2];
			keyword = null;
		}
		if(num == 3){
			vname = seVideo[i*4]; 
			vchannel = seVideo[i*4+1];
			vid = seVideo[i*4+2];
			keyword = seVideo[i*4+3];
			//alert(keyword);
		}
		if(num == 4){
			vname = chVideo[i*3]; 
			vchannel = chVideo[i*3+1];
			vid = chVideo[i*3+2];
			keyword = null;
			//alert(vname);
		}
		if(num == 5){
			vname = popVideo[i*3]; 
			vchannel = popVideo[i*3+1];
			vid = popVideo[i*3+2];
			keyword = null;
			//alert(vname);
		}
		$.post("insertVideo", {ccode:ccode, vname : vname, vchannel : vchannel, vid : vid, vkeyword:keyword }).done(function(data, state){
			console.log("success");
			
			window.open("http://www.youtube.com/watch?v="+vid ,"_blank");
		})	
		
	}
</script>

	<div class="gmenu19" style="width:98%; margin:0px auto">
		<div class="tab">
		<div style="margin:5px; margin-left:20px; font-size:28px; font-weight:bold; font-family: jejughodic"> 영상추천</div>
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
	<br/>
	<br/>
</body>
</html>
