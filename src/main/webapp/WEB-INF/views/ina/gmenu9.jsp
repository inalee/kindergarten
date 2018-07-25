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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
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
  background-color: #FFE70A;
  top: 0;
  left: 0;
}




.phead{
text-align: center;
font-weight: bold;
}



#mychild {

    border-collapse: collapse;
    width: 95%;
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
</style>
</head>
<body>
<div id="headdiv">
<h2>┃ 입소대기 신청현황</h2>
<br>
<div id="discript_2">
<img src="https://library.sfsu.edu/sites/default/files/alert_300.gif" style="float: left; height: 220px; margin-left: 20px;">
<ul>
<li><b>입소대기 신청수 제한</b></li>
<p>-재원중인 아동: 2곳까지 입소대기 신청 가능</p>
<p>-미재원중인 아동: 3곳까지 입소대기 신청 가능</p>
<li><b>같은 어린이집에 중복 대기 신청 불가</b></li>
<br>
<li><b>정해진 기일 이내에 입소 대기 순위 관련 서류를 제출하지 않을 시, 자동으로 입소 대기가 취소됩니다.</b></li>
</ul>
</div>
<div class="tab-wrapper">
  
  <ul class="tab-menu">
    <li class="active">전체보기</li>
    <li>대기현황</li>
    <li>취소현황</li>
  </ul>
	
  <div class="tab-content">
    <div>
      <table id="mychild">
  <tr>

	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
	<th>신청일</th>
    <th>상태</th>    
   
  </tr>

<c:forEach items="${wait1}" var="i">
 <fmt:formatDate var="date_re" value="${i.enlog}" pattern="yyyy-MM-dd" />
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td>${date_re}</td>
    <td>${i.status}</td>
  </tr>
</c:forEach>

</table>
    
    
    </div>
    <div>
          <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
	<th>입소순번</th>
	<th>입소우선순위 배점</th>
    <th>상태</th>    
    <th>-</th>        
  </tr>

<c:forEach items="${wait2}" var="i">
<fmt:parseNumber var="ranking" value="${i.rank}" integerOnly="true" />
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td> ${ranking}번째 / ${i.number}명</td>
    <td>${i.crank}</td>
    <td>${i.status}</td>
    <td><a href="#">[자료제출]</a><a href="#">[신청취소]</a></td>
  </tr>
</c:forEach>
</table>
 
    </div>
    <div>
 <table id="mychild">
  <tr>
	<th>번호</th>
    <th>아동 이름</th>
    <th>어린이집</th>
    <th>입소희망일</th>
    <th>취소 사유</th>    
   
  </tr>

<c:forEach items="${wait3}" var="i">
  <tr>
    <td>${i.encode}</td>
	<td>${i.cname}</td>
    <td>${i.kinname}</td>
    <td>${i.hopedate}</td>
    <td style="color: red;">${i.status}</td>
  </tr>
</c:forEach>

</table>
    
   </div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->


</div>


<br><br>

<br>


<br><br>


</body>
</html>