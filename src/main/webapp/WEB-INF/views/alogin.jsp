<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<c:url var="alogin" value="resources/css/alogin.css"></c:url>
<link href="${alogin}" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login-page">
  <div class="form">
  <img alt="admin" src="resources/images/admin_profile.jpg" style="width: 150px; z-index: 2; margin-top: -200px; border-radius: 50%; border: 1px solid #d8d8d8">
  <a href="/kinder/"><img alt="logo" src="resources/images/logo.png" style="width: 300px; z-index: 2; margin-top: -30px;"></a>
	<form class="login-form" action="" method="">
      <input type="text" placeholder="ID" name="memid"/>
      <input type="password" placeholder="Password" name="mempw"/>
      <button>관리자 로그인</button>
    </form>
  </div>
</div>
</body>
</html>