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
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// 선택삭제
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	//전체삭제
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
<script type="text/javascript">

$(function() { 
	$("#addTR").click(function () { 
		var row = "<tr>"; 
		row += "<td><span>날 누르면 삭제가 됨</span></td>";
		row += "<td><input type='text' name='idx[]' value='' /></td>";  
		row += "</tr>";
		$("#table").append(row); }); 
	
	$("#table").on("click", "span", function() { 
		$(this).closest("tr").remove(); }); });

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
						<a href="#deletebusModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE14C;</i> <span>스케쥴삭제</span></a>
						<a href="#addbusModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>스케쥴추가</span></a>
											
					</div>
                </div>
            </div>

            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>
						<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
                        <th>차량명</th>
                        <th>운행교사</th>
                        <th>운행시각</th>
						<th>정거장목록</th>
                        <th>탑승아이목록</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 1번테이블 -->
                
              <c:forEach var="i" items="${sdlist}">
                    <tr class="a">
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
						<td>${i.carname}</td>
						<td>${i.memname}</td>
						<td>${i.svtime}</td>
						<td>${i.stname}</td>
						<td>${i.cname}</td>
                  </tr>
                </c:forEach>
                 
                </tbody>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addbusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/kinder/guangwo/tmenu9" method="POST" >
					<div class="modal-header">			
						<h4 class="modal-title">스케쥴등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
							<label>차량명</label>
							<input type="text" name="carcode" class="form-control" placeholder="ex)숫자를입력해주세요"  required >
							
							<div class="form-group">
							<label>차량보기</label>
		          <select class="time" id="starttime" onchange="possibleEndtime()">
		          	<c:forEach var="i" items="${sdteacher}">
		          		<option value="${i.carcode},${i.memname}-${i.carname}">${i.carcode},${i.carname}-${i.memname}</option>
		          	</c:forEach>
		          	</select>
		          	</div>
		          	
						<div class="form-group">
							<label>운행시각</label>
		          <input type="text" name="svtime" class="form-control" placeholder="ex)오전,09:15"  required >
						</div>
						
						<div class="form-group">
							<label>정거장명</label>
		          	<input type="text" name="stname2" class="form-control" placeholder="ex)신규 정거장명을 입력해주세요"  required >
						</div>
						
						<div class="form-group">
							<label>기존정거장선택</label>
		          <select class="time" id="starttime" name="stname1" onchange="possibleEndtime()">
		          	<c:forEach var="i" items="${sdstation}">
		          		<option value="${i.stname}">${i.stname}</option>
		          	</c:forEach>
		          	</select>
		          	</div>
		          	
						<div class="form-group">
							<label>x좌표</label>
							<input type="text" name="sty" class="form-control" placeholder="ex)000.00000000"  required >
						<input type="checkbox" name="samecheck" id="sameAddr" onclick="javascript:addrCheck()" ><font style="font-size: 12px;">기존 정류장과 동일</font>
						</div>
							
						<div class="form-group">
							<label>y좌표</label>
							<input type="text" name="sty" class="form-control" placeholder="ex)000.00000000"  required >
						<input type="checkbox" name="samecheck" id="sameAddr" onclick="javascript:addrCheck()" ><font style="font-size: 12px;">기존 정류장과 동일</font>
						</div>	
						
						<div class="form-group">
							<label>탑승자명</label>
							<input type="text" name="ccode" class="form-control" placeholder="ex)숫자를입력해주세요"  required >
						</div>
							
							<div class="form-group">
							<label>탑승자보기</label>
		          <select class="time" id="starttime" onchange="possibleEndtime()">
		          	<c:forEach var="i" items="${sdchildren}">
		          		<option value="${i.ccode},${i.cname}-${i.cage}">
		          		${i.ccode},${i.cname}-${i.cage}살</option>
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
	
	<!-- Delete Modal HTML -->
	<div id="deletebusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">스케쥴삭제</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>삭제하시겠습니까</p>
						<p class="text-warning"><small>삭제시 정보를 다시 입력하셔야합니다.</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>                                		                            