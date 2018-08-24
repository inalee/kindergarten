<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


function childinfo(data) {

	var popUrl = "childinfo_tmenu?ccode="+data;	//팝업창에 출력될 페이지 URL

	var popOption = "width=600, height=560";    //팝업창 옵션(optoin)

	window.open(popUrl,"",popOption);
}


function upclass(pccode,pclcode) {

  var pkincode = "${teacher.kincode}";
	if (confirm("해당 아동의 반을 지정하시겠습니까?") == true){   
		
		$.post("update_class", {ccode:pccode,clcode:pclcode,kincode:pkincode}, function(result){
			alert("반 등록이 완료되었습니다.");
			location.reload();
	    });
		

	}else{   
	    return;
	}

	
}

$(document).ready(function() {
	  
	  var $wrapper = $('.tab-wrapper'),
	      $allTabs = $wrapper.find('.tab-content > div'),
	      $tabMenu = $wrapper.find('.tab-menu li'),
	      $line = $('<div class="line"></div>').appendTo($tabMenu);
	  
	  $allTabs.not(':first-of-type').hide();  
	  $tabMenu.filter(':first-of-type').find(':first').width('100%')
	  
	  $tabMenu.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $allTabs.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $tabMenu.on('click', function() {
	    
	    var dataTab = $(this).data('tab'),
	        $getWrapper = $(this).closest($wrapper);
	    
	    $getWrapper.find($tabMenu).removeClass('active');
	    $(this).addClass('active');
	    
	    $getWrapper.find('.line').width(0);
	    $(this).find($line).animate({'width':'100%'}, 'fast');
	    $getWrapper.find($allTabs).hide();
	    $getWrapper.find($allTabs).filter('[data-tab='+dataTab+']').show();
	  });

	});//end ready
	
	
	
	//Layer Popup
	function layer_open(obj) {
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
<style>
.container {

  box-sizing: border-box;
  font-size: 15px;
  font-weight: 500;

}

*, *:before, *:after {
  box-sizing: inherit;
}

.container {
  margin: 70px;
  margin-top:50px;
  width: 1200px;

}

.u-float-right {
  float: right;
}


.subtle {
	color: #0092F2;
  font-size: 20px;
}

.card-media {
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .12);
  height: 200px;
  margin-bottom: 25px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover {
  box-shadow: 0 5px 14px rgba(0, 0, 0, .2);
}

.card-media-object-container {
  background: none;
  float: left;
  height: 100%;
  width: 35%;
  position: relative;

}

.card-media-object {
  background-position: center center;
  background-size: cover;
  height: 100%;

}


.card-media-object:after {
  content: " ";
  display: block;
  height: 100%;
  left: 0;
  opacity: 0;
  position: absolute;
  right: 0;
  top: 0;
  transition: all 300ms ease-out;
  z-index: 10;
}

.card-media:hover .card-media-object:after {
  background: -moz-linear-gradient(top,  rgba(0,0,0,0) 0%, rgba(0,0,0,0) 52%, rgba(0,0,0,0.4) 100%);
  background: -webkit-linear-gradient(top,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  background: linear-gradient(to bottom,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6000000',GradientType=0 );
  opacity: 1;
}

.card-media-object-tag {
  background-color: #fff;
  border-radius: 2px;
  padding: 2px 7px;
  position: absolute;
  right: 10px;
  top: 10px;
}

.card-media-object-social-list {
  bottom: 4px;
  left: 10px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  position: absolute;
  z-index: 20;
}

.card-media-object-social-list li {
  border-radius: 50%;
  display: inline-block;
  height: 30px;
  margin-right: 6px;
  opacity: 0;
  overflow: hidden;
  transform: translateY(5px);
  transition: all 300ms ease-out;
  width: 30px;
}

.card-media:hover .card-media-object-social-list li {
  opacity: 1;
  transform: translateY(0);
}

.card-media-object-social-list li:nth-child(1) {
  transition-delay: 0;
}
.card-media-object-social-list li:nth-child(2) {
  transition-delay: 75ms;
}
.card-media-object-social-list li:nth-child(3) {
  transition-delay: 150ms;
}

.card-media-object-social-list-item-additional {
  border: 1px solid #fff;
  color: #fff;
  font-size: 12px;
  padding-top: 7px;
  text-align: center;
}

.card-media-body {
  background-color: #fff;
  float: left;
  height: 100%;
  padding: 12px 15px;
  position: relative;
  width: 65%;
}

.card-media-body-top {
  display: block;
}

.card-media-body-top-icons {
  margin-top: -2px;
  opacity: 0;
  transition: all 300ms ease-out;
  transform: translateY(-5px);
}

.card-media:hover .card-media-body-top-icons {
  opacity: 1;
  transform: translateY(0);
}

.card-media-body-top-icons > svg {
  cursor: pointer;
  margin-left: 10px;
  transition: all 300ms ease-out;
}

.card-media-body-top-icons > svg:hover {
  fill: #444;
}

.card-media-body-heading {
  display: block;
  margin-top: 10px;
 margin-left: 20px;
}

.card-media-body-supporting-bottom {
  position: absolute;
  bottom: 10px;
  left: 0;
  opacity: 1;
  padding: 0 15px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover .card-media-body-supporting-bottom {
  opacity: 0;
  transform: translateY(-8px);
}

.card-media-body-supporting-bottom-text {
  display: inline-block;
}

.card-media-body-supporting-bottom-reveal {
  opacity: 0;
  transform: translateY(8px);
  transition: all 300ms ease-out;
}

.card-media:hover .card-media-body-supporting-bottom-reveal {
  opacity: 1;
  transform: translateY(0);
}

.card-media-link {
  color: #41C1F2;
  text-decoration: none;
}

body{
font-family: 'Jeju Gothic', sans-serif;	
}
#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
}


.tab-wrapper {
	width: 95%;
  margin: 60px auto;
 margin-top: 50px;

}

.tab-menu li {
	
  position:relative;
  background-color: #fff;
  color:#bcbcbc;
  display: inline-block;
  padding: 20px 40px;
  width: 100px;
  text-align: center;
  cursor:pointer;
  z-index:0;
 border: thin solid #bcbcbc;

}

.tab-menu li:hover {
  color:#464646;
}

.tab-menu li.active {
  color:#191919;
  opacity: 1;
}

.tab-menu li.active:hover {
  color:#464646;
}

.tab-content>div {

  box-sizing:border-box;
  width:100%;
	margin-top: 50px;
  min-height:200px;
}

.line {
  position:absolute;
  width: 0;
  height: 7px;
  background-color: #ABDDFF;
  top: 0;
  left: 0;
}




.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 100%;
 	font-size:12pt;
 	margin: auto; 
 	position: relative;
 	background-color: #fff;

}

#mychild th{
 border-top: double #464646;
background-color: #f5f5f5;
}


#mychild th, #mychild td {
    padding: 20px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    
}

#mychild tr:hover {
background-color:#f5f5f5;
}


h2{
padding-left: 50px;
}


#discript_2{
font-size: 17px;

padding: 25px;
margin: auto;
position: relative;
width: 85%;
 border: thin solid #bcbcbc;

}
#discript_2 ul{
margin-left: 300px;
}

#discript_2 li{
list-style: square;
}

.link {
  text-decoration: none;
  color: #55acee;
  border-bottom: 2px dotted #55acee;
  transition: .3s;
  -webkit-transition: .3s;
  -moz-transition: .3s;
  -o-transition: .3s;
  cursor: url(http://cur.cursors-4u.net/symbols/sym-1/sym46.cur), auto;
}

.link:hover {
  color: #2ecc71;
  border-bottom: 2px dotted #2ecc71;
}

/* button div */
#buttons {
  padding-top: 50px;
  text-align: center;
}

/* start da css for da buttons */
.btn {
  float: right;
  border-radius: 5px;
  padding: 5px 15px;
  font-size: 15px;
  text-decoration: none;
  margin: 10px;
  margin-right: 60px;
  color: #fff;
  position: relative;
  display: inline-block;
}

.btn:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}

.blue {
  background-color: #55acee;
  box-shadow: 0px 5px 0px 0px #3C93D5;
}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
	opacity: 0.7;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.button3 {
    background-color: #f44336;
    color: white; 
    border: 2px solid #f44336;
}

.button3:hover {
    background-color: white;
    color: black;
}

.button2 {
	border-radius: 10px;
    background-color: #008CBA;
    color: white; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: white;
    color: black;
}



table.type05 {
	width:95%;
	height:50%;
	font-size: 16px;
    border-collapse: separate;
    border-spacing: 1px;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 0 auto;
    position: relative;

}


table.type05 th {
	padding: 15px;
	width:20%;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
	
	padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}



.ly_pop{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:99}
.ly_pop .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.4}
.ly_pop .popcls{position:absolute;top:0px;right:3px; font-size: 15px;}
.ly_pop .cont{width: 100%;height: 100%;position: absolute;top: 0;left: 0;z-index:999;text-align: center;}
.ly_pop .cont:before{height:100%;content:'';display:inline-block;vertical-align:middle}
.ly_pop .ele{
width:40%; height:50%; position:relative;display:inline-block;vertical-align:middle;margin:0 auto 0 -2px;
background:white;
padding:15px;border-radius:5px;
}

#class_info{
text-align: center;
margin-bottom: 25px;
}

#child_list {
text-align: center;
height: 175px;
overflow: auto;
}


table.type09 {
	width:95%;
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    font-size: 12px;
    border-spacing: 1px;
    margin: 0 auto;
	font-family: sans-serif;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>
</head>
<body>
<div id="headdiv">
<h2>┃원생 관리</h2>
	<div class="tab-wrapper">
  		<ul class="tab-menu">
    		<li class="active">원생 관리</li>
    		<li>반 관리</li>
  		</ul>
 	<div class="tab-content">
    	<div>
		<table id="mychild">
  		<tr>
	<th>번호</th>
    <th>아동이름</th>
    <th>나이</th>  
    <th>성별</th>
	<th>주소</th>      
  	<th>반</th>
   	<th>보호자 연락처</th>
   	<th>반 변경</th>
  </tr>

<c:forEach items="${sellist3}" var="i">
<form action="update_class" method="POST">
  <input type="hidden" name="ccode" value="${i.ccode}">
  <tr>
    <td>${i.ccode}</td>
	<td style="color:#003399;"><a onclick="childinfo(${i.ccode})" style="cursor:pointer;">${i.cname}</a></td>
    <td>${i.cage}</td>
    <td>${i.cgen}</td>
    <td>${i.caddress}</td>
    <td>${i.clname}</td>
    <td>${i.memphone}</td>
    <td><select name="clcode" id="clcode" style="height:25px;">
     <c:forEach items="${sellist2}" var="g">
    <option value="${g.clcode}">${g.clname}</option>
    </c:forEach>
    </select>
    <button class="button button3" type="button" onclick="upclass(ccode.value,clcode.value)">변경</button></td>
  </tr>
</form>
</c:forEach>
</table>
    </div>
    
       <div>
		  <a href="#" class="btn blue" onclick="window.location.href='manage'">신규반 추가하기</a><br>
<c:forEach items="${sellist4}" var="i" varStatus="k"> 
<div class="container">
  <div class="card-media">
    <!-- media container -->
    <div class="card-media-object-container">
	
	<c:choose>
	<c:when test="${k.count%3 == 1}">
	  <div class="card-media-object" style="background-image: url(https://payload412.cargocollective.com/1/9/288451/10556351/prt_400x400_1444841446_2x.jpg);"></div>
	</c:when>
	<c:when test="${k.count%3 == 0}">
	  <div class="card-media-object" style="background-image: url(https://img-cache.oppcdn.com/fixed/13962/assets/nXz2sms48YVIBrt7.jpg);"></div>
	
	</c:when>
	<c:otherwise>
	 <div class="card-media-object" style="background-image: url(https://previews.123rf.com/images/lenm/lenm1502/lenm150200294/36586572-stickman-illustration-of-kids-reading-their-choice-of-books-for-reading-time.jpg);"></div>
	</c:otherwise>
	</c:choose>

    </div>
    <!-- body container -->
    <div class="card-media-body">
      <div class="card-media-body-top">
        <span class="subtle" style="margin-left: 10px;">${i.clname}</span>
        <div class="card-media-body-top-icons u-float-right">
          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0h24v24H0z" fill="none"/>
            <path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"/>
          </svg>
          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
            <path d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"/>
            <path d="M0 0h24v24H0z" fill="none"/>
          </svg>
        </div>
      </div>
      <span class="card-media-body-heading">담당교사 : ${i.memname} 선생님</span>
       <span class="card-media-body-heading">상세정보 : ${i.clage}</span>
       <span class="card-media-body-heading">연령대 : ${i.detail}</span>

      <div class="card-media-body-supporting-bottom">
        <span class="card-media-body-supporting-bottom-text subtle" style="font-size: 17px; margin-left: 10px;">현인원 : ${i.re} 명</span>
      
      </div>
      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
       
        <a onclick="layer_open('modal');" class="card-media-body-supporting-bottom-text card-media-link u-float-right" style="font-size: 17px; cursor: pointer;" >반 상세보기</a>
      </div>
    </div>
  </div>
</div>
</c:forEach>
    </div>
   </div>
  </div><!-- //tab-content -->
</div><!-- //tab-wrapper -->
<div>
</div>

<div class="ly_pop">
	<div class="bg"><!-- shadow --></div>
	<div class="cont">
		<section id="modal" class="ele">
			<a href="" class="ico_com popcls">[닫기]</a>
			<div id="class_info">
			<h3>꽃님반 상세정보</h3>
			<table class="type05">
    <tr>
        <th  scope="row">담당교사</th>
        <td>이인아 선생님</td>
        <th  scope="row">연령대</th>
        <td>1-2세반</td>        
    </tr>
    <tr>
        <th scope="row">상세정보</th>
        <td>특수반</td>
        <th scope="row">현인원</th>
        <td>5명</td>        
    </tr>

</table>
			</div>
			<div id="child_list">
<table class="type09">
    <thead>
    <tr>
        <th scope="cols">이름</th>
        <th scope="cols">성별</th>
         <th scope="cols">나이</th>
        <th scope="cols">보호자 연락처</th>
       <th scope="cols">출석현황</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>이인아</td>
        <td>여아</td>
        <td>25세</td>
        <td>01082785778</td>
        <td><a href="#">출석▶</a></td>
    </tr>
    <tr>
        <td>이인아</td>
        <td>여아</td>
        <td>25세</td>
        <td>01082785778</td>
        <td><a href="#">출석▶</a></td>
    </tr>
    <tr>
        <td>이인아</td>
        <td>여아</td>
        <td>25세</td>
        <td>01082785778</td>
        <td><a href="#">출석▶</a></td>
    </tr>
        <tr>
        <td>이인아</td>
        <td>여아</td>
        <td>25세</td>
        <td>01082785778</td>
        <td><a href="#">출석▶</a></td>
    </tr>
    </tbody>
</table>
			</div>
		</section>
	</div>
</div>



</body>
</html>