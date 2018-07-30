<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
$(function() {
	$.ajax({
		url : '/kinder/getSearch',
		type : 'get',
		dataType : 'json',
		success : function(data) {
// 			location.href= data.items[0].link
			alert(data.items[0].link)
			document.write("<iframe id='test' src='"+data.items[0].link+"'>");
// 			document.write(data.items[0].description);
		
		setTimeout(function() {
			alert($('#test').contents())}, 1000);	
		
// 			$('#test').get(0).click(function(event) {
// 				alert(event.html());
// 			});
		},
		error : function(state) {
			alert(state)
		}
	})
})



</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>