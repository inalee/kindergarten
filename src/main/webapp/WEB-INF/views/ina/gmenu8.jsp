<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{

font-family: 'Jeju Gothic', sans-serif;	
}

#headdiv{
position: relative;
margin: auto;
width: 1400px;
margin-top: 50px;
/* border: thin solid black; */
}


.phead{
text-align: center;

}


details > summary::-webkit-details-marker {
  display: none;
}



#discript{
position: relative;
margin: auto;
width: 1100px;
background-color: #fff7ac;
padding: 10px;
/* border: thin solid black; */
}

h3{
padding-left: 150px;
}


#discript2{
text-align: center;
position: relative;
margin: auto;
width: 1100px;
height: 400px;
padding: 10px;
border: thin dotted black;

}

#discript3{

position: relative;
margin: auto;
width: 1100px;

padding: 10px;
border: thin dotted black;

}

#discript4{
text-align: center;
position: relative;
margin: auto;
width: 1100px;
padding: 10px;

}
.prodiv{


background-color: #d2edff;
width: 25%; 
height: 150px;
margin: 20px;
display:inline-block;
box-shadow: 2px 2px 10px #aaaaaa;

-webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    -ms-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    
    -webkit-transform: scale(1.0);
    -moz-transform: scale(1.0);
    -ms-transform: scale(1.0);
    -o-transform: scale(1.0);
    transform: scale(1.0);
    

}

.prodiv:hover{

    
    
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    -webkit-transform: scale(1.05);
    -moz-transform: scale(1.05);
    -ms-transform: scale(1.05);
    -o-transform: scale(1.05);
    transform: scale(1.05);
    
    

}




.li{
list-style: square;
}

.button {
width: 300px; 
height: 80px;
font-size: 20px;
  background-color: #f4511e;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
	font-family: 'Jeju Gothic', sans-serif;	
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button:hover {opacity: 1}

h2{
padding-left: 50px;
}

</style>
</head>
<body>
<div id="headdiv">

<h2>┃ 입소신청 수시모집 안내</h2>
<br>
<div id="discript">
<p class="phead">어린이집 원장은 입소대기자를 실시간으로 공개하여 투명하게 운영하고</p>
<p class="phead">어린이집 이용을 원하는 보호자는 시간·장소의 제한없이 온라인으로 입소대기 신청이 가능합니다.</p>
</div>
</div>
<br><br>
<div id="headdiv">
<h3>■ 입소신청방법</h3>
<div id="discript2">
<div class="prodiv">
<h4>1.아동등록</h4>
<p style="font-size: 14px; margin-bottom: 0px;">어린이집에 입소할 자녀를 등록합니다.</p>
</div>
▶
<div class="prodiv">
<h4>2.추가정보입력</h4>
<p style="font-size: 14px;">입소우선순위와 관련된 사항을 입력합니다.</p>
</div>
▶
<div class="prodiv">
<h4>3.입소신청</h4>
<p style="font-size: 14px;">원하는 어린이집에 입소를 신청합니다.</p>
</div>
<div class="prodiv">
<h4>4.입소대기확정</h4>
<p style="font-size: 14px;">입소우선순위에 따른 대기 번호를 부여받습니다.</p>
</div>
▶
<div class="prodiv">
<h4>5.자료제출</h4> 
<p style="font-size: 14px;">입소우선순위와 관련한 자료를 제출하여 반드시 검토 절차를 거칩니다.</p>
</div>
▶
<div class="prodiv">
<h4>6.입소완료</h4>
<p style="font-size: 14px;">자료 검토후, 해당 어린이집에서 대기 순서대로 입소 처리를 진행합니다.</p>
</div>
<br>
</div>
</div>

<br><br>
<div id="headdiv">
<h3>■ 입소우선순위 배점 기준</h3>
<div id="discript3">
<ul>
<li class="li">3자녀 이상 가구 자녀 및 맞벌이의 경우 각 200점</li><br>
<li class="li">맞벌이면서 3자녀 이상이면 추가 300점 부여</li><br>
<li class="li">기초생활수급자 , 다문화가정의 경우 각 100점</li><br>
<li class="li">어린이집 재원 중인 아동의 형제·자매인 경우 50점</li><br>
<details>
   			<summary><p style="font-size: 15px; color: red;">>입소우선순위 관련 규정 자세히보기</p></summary>
<p style="font-size: 13px;">
<b>※1 순위(법 제28조, 시행령 제21조의4, 시행규칙 제29조)</b><br>
국민기초생활 보장법에 따른 수급자(법정)<br>
한부모가족지원법 제5조의 규정에 의한 보호대상자의 자녀<br>
국민기초생활 보장법 제24조의 규정에 의한 차상위계층의 자녀(중위소득의 50% 이하)<br>
장애인복지법 제2조의 규정에 의한 장애인 중 보건복지부령이 하는 장애등급 이상에 해당하는 자(장애부모*)의 자녀<br>
아동복지시설에서 생활중인 영유아<br>
｢국가유공자 등 예우 및 지원에 관한 법률｣ 제4조제1항에 따른 국가유공자 중 전몰자(제3호), 순직자(제5호･제14호･제16호), <br>
상이자(제4호･제6호･제12호･제15호･제17호) 로서 보건복지부령으로 정하는 자의 자녀<br>
부모가 모두 취업중이거나 취업을 준비 중인 영유아<br>
다문화가족지원법 제2조 제1호에 따른 다문화가족*의 영유아<br>
* ｢재한외국인 처우 기본법｣ 제2조제3호의 결혼이민자와 ｢국적법｣ 제2조부터 제4조까지의 규정에 따라 대한민국 국적을 취득한 자로 이루어진 가족<br>
* ｢국적법｣ 제3조 및 제4조에 따라 대한민국 국적을 취득한 자와 같은 법 제2조부터 제4조까지의 규정에 따라 대한민국 국적을 취득한자로 이루어진 가족<br>

제1형 당뇨를 가진 경우로서 의학적 조치가 용이하고 일상생활이 가능하여 보육에 지장이 없는 영유아<br>
자녀가 3명 이상인 가구 또는 영유아가 2자녀 가구의 영유아<br>
ex) 3월 신학기 입소 시, 첫째 아이가 초등학교에 입학하거나 취학연령에 도달하는 경우에는 영유아 2자녀 가구에 해당되지 않습니다.<br>
※ 입소일 기준으로 영유아 2자녀 가구 요건이 충족되어야 함<br>

산업단지 입주기업체 및 지원기관 근로자의 자녀로서 산업단지에 설치된 어린이집을 이용하는 영유아<br>
법인･단체 등이 어린이집을 국가 또는 지방자치단체에 기부채납하여 국공립어린이집으로 전환된 경우<br>
해당 법인･단체 등의 근로자 자녀로서 그 어린이집을 이용하는 영유아<br>
법 제24조제2항제3호에 따라 ｢주택법｣ 제2조제2호에 따른 공동주택에 설치된 민간어린이집이 국공립어린이집으로 전환된 경우<br>
해당 공동주택의 거주자 자녀로서 그 어린이집을 이용하는 영유아<br>
* 기부채납 또는 무상임대한 주체와 지자체 간 협의한 범위(30~70%)를 기준으로 거주자 자녀에게 우선 입소권을 부여하며, <br>
협의한 범위 외(70~30%)에서는 거주자와 비거주자 구분 없이 일반적인 입소우선순위에 따라서 입소자 결정. 다만, 어느 한쪽의 <br>
현원이 부족하거나 입소대기자가 없을 경우에는 통합하여 운영할 수 있음.<br>
<br>
<b>※2 순위</b><br>
기타 한부모, 조손 가족, 입양된 영유아<br>
어린이집 재원 중인 아동의 형재·자매<br>
ex) 3월 신학기 입소시, 재원중인 형제·자매가 초등학교에 입학하는 경우에는 해당되지 않습니다.<br>
※ 입소일 기준으로 형제·자매가 재원 중이어야 함<br><br>
<b>※3 순위</b><br>
1, 2순위에 해당하지 않는 일반 영유아
</p>
</details>

</p>
</ul>
</div>
</div>
<div id="headdiv">
<div id="discript4">
<button class="button" onclick="location.href='gmenu4'">내 아이 등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="button" onclick="location.href='enroll_page'">입소신청하러가기</button>
<br><br><vr>
</div>
</div>
</body>
</html>