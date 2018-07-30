<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<link href="resources/gwcss/gmenu12.css" rel="stylesheet" type="text/css">
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
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>운행교사정보</h2>
					</div>
					
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>
							
							 <!-- 전체목록 -->
						</th>
                        <th>사진</th>
                        <th>교사명</th>
						<th>운전경력</th>
                        <th>운전면허</th>
                        <th>범죄여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
						<td>
							
						</td>
						<!-- 목록 -->
                        <td><button>사진</button></td>
                        <td><button>교사명</button></td>
						<td><button>운전경력</button></td>
                        <td><button>운전면허</button></td>
                        <td><button>범죄여부</button></td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
						<td>
							
						</td>
						<!-- 목록 -->
                        <td><button>사진</button></td>
                        <td><button>교사명</button></td>
						<td><button>운전경력</button></td>
                        <td><button>운전면허</button></td>
                        <td><button>범죄여부</button></td>
                        <td>
                           </td>
                    </tr>
					<tr>
						<td>
							
						</td>
						<!-- 목록 -->
                        <td><button>사진</button></td>
                        <td><button>교사명</button></td>
						<td><button>운전경력</button></td>
                        <td><button>운전면허</button></td>
                        <td><button>범죄여부</button></td>
                        <td>
                          </td>
                    </tr>
                    <tr>
						<td>
							
						</td>
						<!-- 목록 -->
                       <td><button>사진</button></td>
                        <td><button>교사명</button></td>
						<td><button>운전경력</button></td>
                        <td><button>운전면허</button></td>
                        <td><button>범죄여부</button></td>
                        <td>
                        </td>
                    </tr>					
					<tr>
						<td>
							
						</td>
                        <td><button>사진</button></td>
                        <td><button>교사명</button></td>
						<td><button>운전경력</button></td>
                        <td><button>운전면허</button></td>
                        <td><button>범죄여부</button></td>
                        <td>
                          </td>
                    </tr> 
                </tbody>
            </table>
            <!-- 페이지 목록 -->
			<div class="clearfix">
                <div class="hint-text"> 총 <b>5</b> 페이지 <b>25</b> 항목</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">이전</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">다음</a></li>
                </ul>
            </div>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
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
							<input type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>운행교사명</label>
							<input type="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label>정거장명</label>
							<textarea class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>탑승자명</label>
							<input type="text" class="form-control" required>
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
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">차량삭제</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>차량명</label>
							<input type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>운행교사명</label>
							<input type="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label>정류장</label>
							<textarea class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>탑승자명</label>
							<input type="text" class="form-control" required>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					
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