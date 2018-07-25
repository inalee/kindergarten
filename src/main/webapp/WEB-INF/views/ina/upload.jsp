<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	var pencode = "${param.encode}";

	$("#upload_file button").click(function(){
		
		if (confirm("자료를 제출하시겠습니까?") == true){   
			$.post("upload", {encode: pencode}, function(result){
				alert("제출이 완료되었습니다.");

				window.close();
				opener.parent.location.reload();
		    });
		
		}else{   
		    return;
		}
	

	});

});


</script>
<style type="text/css">

body{
background-color: #EAEAEA;
}

#upload{
margin: auto;
position: relative;
text-align: center;
}
</style>
<body>

<div id="upload">
<form id="upload_file"  method="POST">
<h2>입소 우선순위 배점 관련 자료 제출</h2>
<input name="myFile" type="file">
<button type="button">제출하기</button>
</form>
</div>
</body>
</html>