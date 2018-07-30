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
	
	
</script>
<style>
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
 	font-size:11pt;
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

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
	opacity: 0.8;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
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
    background-color: #008CBA;
    color: white; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: white;
    color: black;
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
    <th>아동 이름</th>
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
	<td>${i.cname}</td>
    <td>${i.cage}</td>
    <td>${i.cgen}</td>
    <td>${i.caddress}</td>
    <td>${i.clname}</td>
    <td>${i.memphone}</td>
    <td><select name="clcode" id="clcode" style="height: 25px;">
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
 	      <table id="mychild">
  <tr>

	<th>반 번호</th>
    <th>반 이름</th>
    <th>담당 교사</th>  
   <th>연령대</th>      
   	<th>현 인원수</th>
  </tr>

<c:forEach items="${sellist4}" var="i">
  <tr>
    <td>${i.clcode}</td>
	<td>${i.clname}</td>
    <td>${i.memname} 선생님</td>
    <td>${i.clage}</td>
    <td>${i.re}명</td>
  </tr>

</c:forEach>
</table>
    </div>
   </div>
  </div><!-- //tab-content -->
</div><!-- //tab-wrapper -->

<div>
</div>
</div>


</body>
</html>