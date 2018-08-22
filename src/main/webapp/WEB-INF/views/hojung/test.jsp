<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<script type="text/javascript">
$('#pagination-demo').twbsPagination({
    totalPages: 16,
    visiblePages: 6,
    next: 'Next',
    prev: 'Prev',
    onPageClick: function (event, page) {
        //fetch content and render here
        $('#page-content').text('Page ' + page) + ' content here';
    }
});
</script>
<style type="text/css">
.wrapper {
	margin: 60px auto;
	text-align: center;
}

h1 {
	margin-bottom: 1.25em;
}

#pagination-demo {
	display: inline-block;
	margin-bottom: 1.75em;
}

#pagination-demo li {
	display: inline-block;
}

.page-content {
	background: #eee;
	display: inline-block;
	padding: 10px;
	width: 100%;
	max-width: 660px;
}
</style>
</head>
<body>
<div class="wrapper">
  <div class="container">
    
    <div class="row">
      <div class="col-sm-12">
        <h1>jQuery Pagination</h1>
        <p>Simple pagination using the TWBS pagination JS library. Click the buttons below to navigate to the appropriate content</p>
        <ul id="pagination-demo" class="pagination-sm"></ul>
      </div>
    </div>

    <div id="page-content" class="page-content">Page 1</div>
  </div>
</div>
</body>
</html>