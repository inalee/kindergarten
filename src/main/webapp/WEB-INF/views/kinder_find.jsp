<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<c:url var="search_kinder" value="resources/hjcss/search_kinder.css"></c:url>
<link href="${search_kinder}" rel="stylesheet" type="text/css" />
<link href="${kinder_search}" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function search_btn() {

	var psigungu = $("#sigungu").val();
	var pkinkind = $("#kinkind").val();
	var pkinname = $("#kinname").val();
	
	var target = document.getElementById("sigungu");
	var sigunguname = target.options[target.selectedIndex].text;


	$.get("search_kinder",	{ sigungucode: psigungu, kinkind:0, kinname:pkinname }).done(function(data,state){

		$("#total").remove();
		$("#contain3").before("<h5 id='total' style='padding-left: 60px;'>총 "+data.length+"개의 어린이집이 검색되었습니다.</h5>"); 
		$("#mychild").empty();
		$("#mychild").append(" <tr><th>위치</th><th>어린이집</th><th>유형</th><th>정원</th><th>현원</th><th>-</th></tr>");
		
		for (var i = 0; i < data.length; i++) {
			
			if(data[i].kinkindcode==1){
				var kinkind = "가정";
			}
			else if(data[i].kinkindcode==2){
				var kinkind = "국공립";
			}			
			else if(data[i].kinkindcode==3){
				var kinkind = "민간";
			}
			else if(data[i].kinkindcode==4){
				var kinkind = "법인·단체 등";
			}
			else if(data[i].kinkindcode==5){
				var kinkind = "사회복지법인";
			}
			else if(data[i].kinkindcode==6){
				var kinkind = "직장";
			}
			else if(data[i].kinkindcode==7){
				var kinkind = "협동";
			}
			
	
			$("#mychild").append("<tr id='trresult'><td>"+data[i].sido+" "+sigunguname+"</td><td>"+data[i].kinname+"</td><td>"+kinkind+"</td><td>"+data[i].kinmax+"명</td><td>"+data[i].kincurrent+"명</td>"+   
				    "<td><a href='javascript:selkinder("+data[i].kincode+");'>[선택]</a></td></tr>");
		}
		
		});

}

function selkinder(dat) {

	$.get("search_kinder2",	{kincode: dat}).done(function(data,state){
		var name = data.kinname;
		var address = data.kinaddress;
		window.opener.document.twin.kincode_1.value = name+"("+address+")";
		window.opener.document.twin.kincode2.value = dat;
		self.close();
	});

}
</script>
<style>
#contain4{
	width: 1200px;
	position: relative; 
	margin: auto;
}
#mychild{

    border-collapse: collapse;
    width: 680px;
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
.my-hr3 {
  border: 0;
  height: 2px;
  background: #D5D5D5;
  width: 800px;
  margin-top: 100px;
  margin-bottom: 70px;
}

</style>
</head>
<body>

<div class="page_name" style="margin-top: 10px; width:700px;">
	<h2>통합검색</h2><br>
</div>
	
<div class="kinder_search" style="width:700px;">
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	<ul style="margin-bottom: 0;">
		<li class="basis"><p>시도</p>
			<select title="시도 선택">
              <option disabled="disabled">== 선택 ==</option>
              <option value="" selected="selected">서울특별시</option>
            </select>
		</li>
		<li class="basis"><p>시군구</p>
			<select id="sigungu" name="sigungucode" title="시군구 선택">
             <option value="0">전체</option>
              <option value="1">강남구</option>
              <option value="2">강동구</option>
              <option value="3">강북구</option>
              <option value="4">강서구</option>
              <option value="5">관악구</option>
              <option value="6">광진구</option>
              <option value="7">구로구</option>
              <option value="8">금천구</option>
              <option value="9">노원구</option>
              <option value="10">도봉구</option>
              <option value="11">동대문구</option>
              <option value="12">동작구</option>
              <option value="13">마포구</option>
              <option value="14">서대문구</option>
              <option value="15">서초구</option>
              <option value="16">성동구</option>
              <option value="17">성북구</option>
              <option value="18">송파구</option>
              <option value="19">양천구</option>
              <option value="20">영등포구</option>
              <option value="21">용산구</option>
              <option value="22">은평구</option>
              <option value="23">종로구</option>
              <option value="24">중구</option>
              <option value="25">중랑구</option>
            </select>
		</li>
		<li class="basis">
          <input type="text" name="kinname"  id="kinname"  title="어린이집명을 입력하세요." placeholder="기관명" style="padding: 0;"/>
        </li><br>
        <li class="basis" style="margin-top: 0px;">
         <button type="button" onclick="search_btn()" class="btn search_btn">검색</button>
        </li>
	</ul>
</div>
  <div id="contain3">
<form name="rechild">
   <table id="mychild">

 
</table>
</form>
</div>
</body>
</html>