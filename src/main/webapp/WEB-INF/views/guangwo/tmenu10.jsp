<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<h2>배차일지</h2>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1500px;
    margin: 0 auto;
  }
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.min.css" media ="print" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>

<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month',
        default: 'bootstrap3'
      },
      defaultDate: '2018-03-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2018-03-01'
        },
        {
          title: 'Long Event',
          start: '2018-03-07',
          end: '2018-03-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2018-03-11',
          end: '2018-03-13'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T10:30:00',
          end: '2018-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-03-12T20:00:00'
        },
        {
            title: 'Birthday Party',
            start: '2018-03-13T07:00:00'
          },
          {
              title: 'Birthday Party',
              start: '2018-03-13T07:00:00'
            },
            {
                title: 'Birthday Party',
                start: '2018-03-13T07:00:00'
              },
              {
                  title: 'Birthday Party',
                  start: '2018-03-13T07:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2018-03-13T07:00:00'
                  },
        
                  
                  
                  
                  {
                      title: 'Birthday Party',
                      start: '2018-03-14T07:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2018-03-14T07:00:00'
                      },
                      {
                          title: 'Birthday Party',
                          start: '2018-03-14T07:00:00'
                        },
                        {
                            title: 'Birthday Party',
                            start: '2018-03-14T07:00:00'
                          },
                          {
                              title: 'Birthday Party',
                              start: '2018-03-14T07:00:00'
                            },
                  
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2018-03-28'
        }
      ]
    });

  });

</script>

<div class="container">
<br/><br/>
  <div id='calendar'></div>
<br/><br/>
</div>
</body>