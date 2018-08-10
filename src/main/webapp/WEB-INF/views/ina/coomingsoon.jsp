<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<style>
/* @font-face { */
/*   font-family: 'Youth'; */
/*   font-style: normal; */
/*   font-weight: 400; */
/*   src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff') format('woff'); */
/* } */

body, html {
    height: 100%;
    margin: 0;
/*     font-family: 'Youth', sans-serif; */
}



.bgimg {
	background-image: url('resources/images/cute4.gif');
    height: 100%;
    background-position: center;
    background-size: cover;
    position: relative;
    color: black;
    font-family: 'Jeju Gothic', sans-serif;	
    font-size: 25px;
}



.topleft {
    position: absolute;
    top: 0;
    left: 16px;
}

.bottomleft {
    position: absolute;
    bottom: 0;
    left: 16px;
}

.middle {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
}

hr {
    margin: auto;
    width: 40%;
}
</style>
<body>

<div class="bgimg">
  <div class="topleft">
    <img src="resources/images/logo.png" width="200px;">
  </div>
  <div class="middle">
    <h2>${kininfo.kinname} 정기모집 신청까지</h2>
    <hr>
    <p id="demo" style="font-size:70px; font-weight: bolder;"></p>
  </div>
  <div class="bottomleft">
  </div>
</div>

<script>
// Set the date we're counting down to

var kincode = "${kininfo.kincode}";
var recode = "${reinfo.recode}";
var a = "${reinfo.reopen}";
var countDownDate = new Date(a).getTime();

// Update the count down every 1 second
var countdownfunction = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = days + "일 " + hours + "시간 "
    + minutes + "분 " + seconds + "초 ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
		location.href = "enroll_form?kincode="+kincode+"&recode="+recode;
//         clearInterval(countdownfunction);
//         document.getElementById("demo").innerHTML = "<button>신청하기</button>";
    }
}, 1000);
</script>

</body>
</html>
