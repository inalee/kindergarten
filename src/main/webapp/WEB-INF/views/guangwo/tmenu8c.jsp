<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/tmenu8.css" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>C차량상세정보</h2>
	<button  type="button" onclick="Add()">정거장추가</button>
	<button type="button"  onclick="Remove()">정거장초기화</button>
	<button type="button"  onclick="dbsave()">정거장저장</button>
<!-- 정거장 생성 -->
<script>

function Add()  
{  
    $("#ul_id").append("<li><p>정거장</p>정차시간</li>");  
}  
</script> 
</script>

<!-- 정거장 제거 -->
<script>
    function Remove()
    {
       $("#ul_id *").remove();
 
       var tmpHtml = "";
       tmpHtml = tmpHtml + "<li><p>정거장</p>정차시간</li>";
 
       $("#ul_id").append(tmpHtml).trigger("create");
    }
</script>
<!-- 정거장 저장 -->
<script>
    function dbsave()
    {
       
    }
</script>

	<div class="step-box">
		<div class="step-state step">
			<ul id="ul_id" >
				<li><p>정거장</p>정차시간</li>
			</ul>
		</div>
		<div>
			<ul>
				<li><button>정거장등록</button></li>
			</ul>
		</div>
		<div>
			<ul>
				<li>운행안내</li>
			</ul>
		</div>
</body>
</html>