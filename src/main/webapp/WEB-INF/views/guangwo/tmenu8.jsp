<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/tmenu9.css" rel="stylesheet" type="text/css">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
						<a href="#deletebusModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE14C;</i> <span>차량삭제</span></a>
						<a href="#addbusModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>차량추가</span></a>					
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
                        <th>번호판</th>
                        <th>구입금액</th>
						<th>연료종류</th>
                        <th>차종명</th>
                        <th>제조사명</th>
                        <th>연식</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${list}" >
                <tr>
                <td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
                <td>${i.carname}</td>
                <td>${i.carnum}</td>
                <td>${i.carpay}원</td>
                <td>${i.oilname}</td>
                <td>${i.faname}</td>
                <td>${i.vtlname}</td>
                 <td>${i.fayear}년식</td>
                </tr>
                </c:forEach>
                </tbody>
        </div>
    </div>
	
	<div id="addbusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">차량등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>차량명</label>
							<input type="text" class="form-control" placeholder="ex)달님"  required >
						</div>
						<div class="form-group">
							<label>번호판</label>
							<input type="text" class="form-control" placeholder="ex)서울00가0000"  required " >
						</div>
						<div class="form-group">
							<label>구입금액</label>
							<input type="text" class="form-control" placeholder="ex)7000000" required>
						</div>
						<div class="form-group">
							<label>연료종류</label>
							<input type="" class="form-control" placeholder="ex)휘발류" required>
						</div>		
						<div class="form-group">
							<label>차종명</label>
							<input type="text" class="form-control" placeholder="ex)중형25인승" required>
						</div>
						<div class="form-group">
							<label>제조사명</label>
							<input type="text" class="form-control" placeholder="ex)기아" required>
						</div>
						<div class="form-group">
							<label>연식</label>
							<input type="text" class="form-control" placeholder="ex)2018" required>
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