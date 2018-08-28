<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/tmenu9.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function del_station(val) {
	alert("해당 차량을 삭제하시겠습니까?");
	$.get("del_station",{stcode:val},function(result){
		alert("삭제가 완료되었습니다.");
		location.reload();
	});
}
</script>
 
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>${teacher.kinname}-정거장</h2>
					</div>
					<div class="col-sm-6">
					<a href="map_view" class="btn btn-info">정거장등록</a>
											
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>
						</th>
                        <th>정거장명</th>
                        <th>위도</th>
                        <th>경도</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 1번테이블 -->
              <c:forEach var="i" items="${stlist}">
                    <tr>
						<td>
						</td>
						<td>${i.stname}</td>
						<td>${i.stx}</td>
						<td>${i.sty}</td>
<td><a href="#deletebusModal" class="btn btn-info"  onclick="del_station(${i.stcode})"> <span>삭제</span></a></td>
                  </tr>
                </c:forEach>
                </tbody>
        </div>
    </div>
	
	
</body>
</html>                                		                            