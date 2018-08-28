<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/tmenu9.css" rel="stylesheet" type="text/css">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

function delete_car(val) {
	alert("해당 차량을 삭제하시겠습니까?");
	$.get("delete_car",{carcode:val},function(result){
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
						<h2>${teacher.kinname}-차량관리</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addbusModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>차량추가</span></a>					
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>
						</th>
						<th>차량명</th>
						<th>담당교사</th>
                        <th>번호판</th>
                        <th>구입금액</th>
						<th>연료종류</th>
                        <th>차종</th>
                        <th>제조사</th>
                        <th>연식</th>
                        <th>기타</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${list}" >
                <tr>
                <td>	
						</td>
                <td>${i.carname}</td>
                <td>${i.memname}</td>
                <td>${i.carnum}</td>
                <td>${i.carpay}원</td>
                <td>${i.oilname}</td>
                <td>${i.vtlname}</td>
                <td>${i.faname}</td>
                 <td>${i.fayear}년식</td>
                 <td><a href="#deletebusModal" class="btn btn-info"  onclick="delete_car(${i.carcode})"> <span>삭제</span></a></td>
                </tr>
                </c:forEach>
                </tbody>
        </div>
    </div>

	<div id="addbusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/kinder/guangwo/tmenu8" method="POST" >
					<div class="modal-header">						
						<h4 class="modal-title">차량등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>차량명</label>
							<input type="text" class="form-control" name="carname" placeholder="ex)달님"  required >
						</div>
						<div>
							<label>교사선택
		          <select class="car" name="tecode">
		          <option value="0" selected="selected">전체</option>
		          	<c:forEach var="i" items="${ctlist}">
		          		<option value="${i.tecode}">${i.memname}선생님</option>
		          	</c:forEach>
		          	</select>
		          	</label>
		          	</div>
		          	
						<div class="form-group">
							<label>번호판</label>
							<input type="text" class="form-control" name="carnum" placeholder="ex)서울00가0000"  required " >
						</div>
						
						<div class="form-group">
							<label>구입금액</label>
							<input type="text" class="form-control" name="carpay" placeholder="ex)7000000" required>
						</div>
						
						<div class="form-group">
							<label>연료종류</label>
							<select class="time" id="starttime" name="oilname" >
							<option value="">전체</option>
		          		<option value="휘발류">휘발류</option>
		          		<option value="고급휘발류">고급휘발류</option>
		          		<option value="경유">경유</option>
		          		<option value="가솔린">가솔린</option>
		          		<option value="디젤">디젤</option>
		          		<option value="전기">전기</option>
		          	</select>
						</div>		
						
						<div class="form-group">
							<label>차종명</label>
							<select class="time" id="starttime" name="vtlname1" >
		          		<option value="">전체</option>
		          		<option value="소형">소형</option>
		          		<option value="중형">중형</option>
		          		<option value="대형">대형</option>
		          		
		          	</select>
							<input type="text" class="form-control" name="vtlname2" placeholder="ex)중형25인승" required>
						</div>
						
						<div class="form-group">
							<label>제조사명</label>
							<select class="time" id="starttime" name="faname" >
		          		<option value="">전체</option>
		          		<option value="기아">기아</option>
		          		<option value="현대">현대</option>
		          		<option value="쌍룡">쌍룡</option>
		          		<option value="르노삼성">르노삼성</option>
		          		<option value="대창모터스">대창모터스</option>
		          	</select>
						</div>
						
						<div class="form-group">
							<label>연식</label>
								<select class="time" id="starttime" name="fayear1" >
		          	<c:forEach begin="1988" end="2100" var="i">
		          		<option value="${i}">${i}년식</option>
		          	</c:forEach>
		          	</select>
						</div>		
							
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