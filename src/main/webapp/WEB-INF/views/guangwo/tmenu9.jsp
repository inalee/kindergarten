<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/tmenu9.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
select {
    width: 80px;
    height: 25px;
    padding-left: 10px;
    font-size: 15px;
    border-radius: 3px;
}
</style>

<script type="text/javascript">
function del_schedule(val) {
	alert("해당 스케쥴을 삭제하시겠습니까?");
	$.get("del_schedule",{ccode:val},function(result){
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
						<h2>${teacher.kinname}-차량스케쥴</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addbusModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>스케쥴추가</span></a>
											
					</div>
                </div>
            </div>

            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>차량명</th>
                        <th>운행교사</th>
                        <th>운행시각</th>
						<th>정거장목록</th>
                        <th>탑승아이목록</th>
                        <th>기타</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 1번테이블 -->
              <c:forEach var="i" items="${sdlist}">
                    <tr class="a">
						<td>${i.carname}</td>
						<td>${i.memname}</td>
						<td>${i.svtime}</td>
						<td>${i.stname}</td>
						<td>${i.cname}</td>
						<td><a href="#deletebusModal" class="btn btn-info"  onclick="del_schedule(${i.ccode})"> <span>삭제</span></a></td>
                  </tr>
                 
                </c:forEach>
                </tbody>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addbusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/kinder/guangwo/tmenu9" method="POST">
					<div class="modal-header" style="background-color: #bce8f1;">			
						<h4 class="modal-title" >스케쥴등록</h4>
						
					</div>
					<div class="modal-body">
					<div>
							<label>차량선택
		          <select class="car" name="carcode">
		          <option value="0" selected="selected">전체</option>
		          	<c:forEach var="i" items="${sdteacher}">
		          		<option value="${i.carcode}">${i.carname}-${i.memname}선생님</option>
		          	</c:forEach>
		          	</select>
		          	</label>
		          	</div>
		          	
		          	<div>
							<label>운행시각
		          	<select class="time" id="starttime" name="svtime1" onchange="possibleEndtime()">
		          	<c:forEach begin="1" end="22" var="i">
		          		<option value="${i}">${i}</option>
		          	</c:forEach>
		          	</select>
		          	<span>시</span>
		          	<select class="time" id="starttime" name="svtime2" onchange="possibleEndtime()">
		          	<c:forEach begin="1" end="59" var="i">
		          		<option value="${i}">${i}</option>
		          	</c:forEach>
		          	</select>
		          	<span>분</span>
						</label>
						</div>
						
						<div>
							<label>정거장선택
		          <select class="time" id="starttime" name="stcode">
		          	<option value="0" selected="selected">전체</option>
		          	<c:forEach var="i" items="${sdstation}">
		          		<option value="${i.stcode}">${i.stname}</option>
		          	</c:forEach>
		          	</select>
		          	</label>
		          	</div>
		          	
		          	<div>
							<label>탑승자보기
		          	<c:forEach var="i" items="${sdchildren}">
		          	<input type="checkbox" name="ccode" value="${i.ccode}">${i.cname}</input>
		          	</c:forEach>
		          	</label>
		          	</div>
		          	
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-success" value="Add">
					</div>
				</form>
				</div>
			</div>
		</div>

	
	
</body>
</html>                                		                            