<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<style>
body{
    font-family: 'Jeju Gothic', sans-serif;	

    	
}

table.type05 {
	width:600px;
	height:500px;
	font-size: 16px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 0 auto;
    position: relative;
}
table.type05 th {
	
	width: 70px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
	

    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

#headtitle{
margin: auto;
position: relative;
text-align: center;
height: 100%;
padding-left: 160px;


}

</style>
<body leftmargin="0" topmargin="0">
<div id="headtitle">
<img style="width: 42px; height: 42px; float: left;" src="https://www.arete-methodos.com/wp-content/uploads/2017/02/icon-Info.png">
<h1 style="float: left; margin: 10px;">아동 상세 정보</h1>
</div>
<table class="type05">
<c:set var="cid" value="${info.cidnum}"/>
    <tr>
        <th style="height:20px;  background-color: #F7F8E0;" scope="row">아동 이름</th>
        <td>${info.cname}</td>
        <th style="background-color: #F7F8E0;" scope="row">나이</th>
        <td style=" text-align: center;">${info.cage}세</td>        
    </tr>
    <tr>
        <th scope="row" style="height:50px; ">성별</th>
        <td>${info.cgen}</td>
        <th scope="row">주소</th>
        <td>${info.caddress}</td>        
    </tr>
    <tr>
        <th scope="row" style="height:50px; ">주민번호</th>
        <td>${fn:substring(cid,0,6)}-${fn:substring(cid,6,14)}</td>
        <th scope="row">관심사</th>
        <td>${info.cinterest}</td>        
    </tr>
    <tr>
        <th scope="row">주의사항</th>
        <td scope="row">${info.ccaution}</td>
   		<td></td>
   		<td></td>
    </tr>

</table>
</body>
</html>