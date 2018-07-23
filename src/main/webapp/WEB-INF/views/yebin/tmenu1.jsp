<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/commons/teachermenu.jsp" flush="true"></jsp:include>
<c:url var="calendar" value="resources/css/yebin-calendar.css"></c:url>
<c:url var="tab" value="resources/css/yebin-tab.css"></c:url>
<link href="${calendar}" rel="stylesheet" type="text/css" />
<link href="${tab}" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.min.css"
	media="print" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/locale/ko.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<style>
.container {
	max-width: 800px;
}

.container con {
	width: 40%;
	text-align: left;
	margin: 0 auto;
}

.tab-1-search {
	text-align: center;
}

.searchlabel {
	background-color: #FFE70A;
	padding: 3px;
	margin: 5px;
	border-radius: 3px;
}

.helptext {
	margin-top: 30px;
	font-size: 25px;
	color: gray;
}
</style>
<script>
	// Tab 
	$(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	})

	// Calendar
	$(function() {

		$('#calendar')
				.fullCalendar(
						{
							themeSystem : 'bootstrap4',
							lang : "ko",
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay,listMonth'
							},
							width : 100,
							selectable : true,
							weekNumbers : true,
							editable : true,
							eventLimit : true, // allow "more" link when too many events
							events : 'https://fullcalendar.io/demo-events.json?overload-day',
							dayClick : function(date) {
								alert('clicked ' + date.format());
							},
							select : function(startDate, endDate) {
								alert('selected ' + startDate.format() + ' to '
										+ endDate.format());
							}
						});
	});
</script>

</head>
<body>
	<div class="tabContainer">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">일지 작성</li>
			<li class="tab-link" data-tab="tab-2">목록</li>
			<li class="tab-link" data-tab="tab-3">우리반 통계</li>
		</ul>

		<div id="tab-1" class="tab-content current" style="text-align: left;">

			<div class="tab-1-search">
				<span class="helptext">할 일 또는 일정을 기록해 보세요.<br /></span> <label
					class="searchlabel">일정/할 일</label><input type="text" size="50"
					placeholder="예) @8/18 야외수업">
				<button style="border-radius: 3px; margin: 5px">등록</button>
			</div>

			<table border="1px" style="text-align: center; align-content: center; align-items: center; text-valign: top;" >
				<tr
					style="text-align: center; align-content: center; align-items: center; text-valign: top;">
					<td><div class="container con">
							<br /> <br />
							<div id='calendar'></div>
							<br /> <br />
						</div>
					</td>
					<td
						style="width: 40%; text-align: center; text-valign: top; align-content: center; align-items: center;">
						<table border="1px"
							style=" margin-left: 34%; align: center; text-valign: top; align-content: center; align-items: center;">
							<th>[할 일 목 록]</th>
							<tr>
								<td>adsfadsfasdfadsfadsf</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

		</div>

		<div id="tab-2" class="tab-content">---- ---- ★------ ---- ----
			---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- --------
			---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ----
			-------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----</div>
		<div id="tab-3" class="tab-content">---- ★-- -------- ---- ----
			---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- --------
			---- ---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ----
			-------- ---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>
	</div>
</body>
</html>