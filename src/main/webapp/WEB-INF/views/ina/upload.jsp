<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(function () {
	$("#upload_file button").click(function(){

		event.preventDefault();
		var frm = $("#upload_file")[0];
		var data = new FormData(frm);
		
		  $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "upload",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function(data){
		                alert("자료 제출이 완료되었습니다.");		     
		                window.close();
		                opener.location.reload();
	            }
	           
	        });
	});
	
});


</script>
<style type="text/css">

 
body {
    margin: 0;
    padding: 0;
    font-family: 'Jeju Gothic', sans-serif;	
}


#upload{
margin: auto;
position: relative;
text-align: center;
margin: 10px;
background-color: #F6F6F6;
padding: 25px;
}

.button {
width: 170px; 
height: 50px;
font-size: 18px;
  background-color: #f4511e;
  border: none;
  color: white;
  text-align: center;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  font-family: 'Jeju Gothic', sans-serif;	
}

.button:hover {opacity: 1}



#headline{
background-color: #FFE400;
width: 440px;
height: 30px;
margin-top: -20px;
padding-left: 10px;
margin-bottom: 30px;

}


#caution{
margin: 20px;
font-size: 13px;
}
</style>

<body>
<form id="upload_file" enctype="multipart/form-data" method="POST" action="upload">
<div id="headline">
<h4>입소신청관련 자료제출</h4>
</div>
<div id="upload">
<input name="file" type="file" style="background-color: white; ">
<input type="hidden" value="${param.encode}" name="encode">
<p style="font-size: 12px;">※ 최대 50MB까지 파일을 올리실 수 있습니다. </p>
</div>
<div id="caution">
<img src="http://cafeimgs.naver.net/img/ico_copyright_img.gif" style="float: left; height: 110px; margin: 5px;">
<p style="color: red; font-size: 15px;">■ 자료제출 시 유의사항</p>
<p>1. 입소 등록 시 체크했던 사항에 적합한 자료인지 한번 더 확인해주세요.</p>
<p>2. 제출기한을 넘겨 제출된 자료는 무효합니다.</p>
<br><br>
<center>
<button type="button"  class='button' >제출하기</button>
</center>
</form>
</div>


</body>
</html>