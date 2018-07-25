<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../commons/teachermenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<style>
.container {
      width: 1300px;
    position: relative;
	margin: auto;

  }
  

  .progressbar {
      counter-reset: step;
  }
  
  .progressbar li {
      list-style-type: none;
      width: 20%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
  }
  .progressbar li:before {
      width: 30px;
      height: 30px;
      content: counter(step);
      counter-increment: step;
      line-height: 30px;
      border: 2px solid #7d7d7d;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background-color: white;
  }
  .progressbar li:after {
      width: 100%;
      height: 2px;
      content: '';
      position: absolute;
      background-color: #7d7d7d;
      top: 15px;
      left: -50%;
      z-index: -1;
  }
  .progressbar li:first-child:after {
      content: none;
  }
  .progressbar li.active {
      color: #4374D9;
  }
  .progressbar li.active:before {
      border-color: #4374D9;
 
        
  }
  .progressbar li.active + li:after {
      background-color: #4374D9;
 
  }

#header{
position: relative;
margin: 50px auto;
margin-bottom: 30px;
width: 1300px;

}

#contain2{
width: 1200px;

/* border: solid thin black; */
position: relative; 
margin: auto;
margin-top: 80px;

}

table.type04 {
	width: 1050px;
	font-size: 15px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : auto;
  position: relative;

}
table.type04 th {
    width: 150px;
    padding: 15px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}


  .my-hr3 {
    border: 0;
    height: 2px;
    background: #D5D5D5;
    width: 800px;
    margin-top: 70px;
    margin-bottom: 70px;


  }





#btnid{

text-align:center;
 	margin: auto; 
 	position: relative;
 	margin-top: 60px;
 	margin-bottom: 40px;
}


.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #FAECC5;
  border: none;
  color: black;
  text-align: center;
  font-size: x-large;

  width: 400px;
  transition: all 0.1s;
  cursor: pointer;

  height: 60px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}


#before:after {
  content: '\00ab';
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;	
}


}

#contain3{
width: 1200px;
position: relative; 
margin: auto;
}

#contain4{
width: 1200px;
position: relative; 
margin: auto;


}

#mychild{

    border-collapse: collapse;
    width: 90%;
 	font-size:11pt;
 	margin: auto; 
 	position: relative;

}

#mychild th{

background-color: #D9E5FF;
}


#mychild th, #mychild td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

#mychild tr:hover {
background-color:#EBF3FB;
}


.button2 {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
  
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.1s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.button4 {
    background-color: white;
    color: black;
    border: 2px solid #E6E6E6;
}

.button4:hover {background-color: #e7e7e7;}

</style>
<body>
<div id="header">
<h2>┃ 반 만들기</h2>
</div>
<div id="contain2">
<h4 style=" margin-left: 30px;">생성할 반의 상세정보를 입력해주세요.</h4><br>

<form action="make_class" method="POST">
<table class="type04">
    <tr>
    
        <th scope="row">반이름</th>
        <td><input type="text" name="clname">
        <input type="hidden" name="kincode" value="${teacher.kincode}"></td>
         <th scope="row">반 연령대</th>
        <td><select id="agecode" name="agecode" style="width: 150px; height: 25px;">
			<option value="1">0-1세</option>
			<option value="2">1-2세</option>
			<option value="3">2-3세</option>
			<option value="4">3-4세</option>
			<option value="5">4-5세</option>
			<option value="6">5-6세</option>				
        </select></td>
    </tr>
    <tr>
        <th scope="row">상세나이</th>
        <td><input type="text" name="clage"></td>
 			 <th scope="row" >담당 선생님</th>
        <td><select style="width: 150px; height: 25px;">
        <option>이인아</option>
        <option>원호정</option>
        </select></td>
    </tr>
    <tr>
         <th scope="row" colspan="4" style="text-align: center; border-bottom: none;"><button type="submit" style="width: 200px; height: 60px;  margin-top: 15px; font-size: 20px;" class="button2 button4">만들기</button></th>
    </tr>
</table>
</form>
</div>

	

</body>
</html>