<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:url var="glogin" value="resources/css/glogin.css"></c:url>
<link href="${glogin}" rel="stylesheet" type="text/css" />
<c:if test="${exist eq true}">
<script>
alert("선생님으로 가입되어 있습니다. 선생님으로 로그인 해주세요")
location.href="/kinder/tlogin";
</script>
<% session.removeAttribute("exist"); %>
</c:if>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){

var join = '${jointest}';
	if (join=='ok') {
		alert("가입을 환영합니다.");
	}
	
	
});

var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "nZ6hOsd_vBKNiin5JPzT",
		callbackUrl: "http://localhost:8080/kinder/glogin",
		isPopup: false , /* 팝업을 통한 연동처리 여부 */
		callbackHandle: false
	}
);
window.addEventListener('load', function () {		
	$("#naverIdLogin").on("click", function(){
/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var memname = naverLogin.user.getName();
				console.log(memname)
				var gender = naverLogin.user.getGender();
				var memid = naverLogin.user.getId();
				var profileimage = naverLogin.user.getProfileImage();
				console.log(memid)
				if( memname == undefined || memname == null) {
					alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				if( gender == undefined || gender == null) {
					alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				// 로그인 컨트롤러 다녀오기
				$.post("/kinder/nLoginPost", {memid:memid, memsort : 0}).done(function(data, state){
					if(data=="success"){
						//alert(data)
						location.href = "/kinder/gmain"
					}
					else{
						$.post("/kinder/naverJoinPost", {memid:memid, memname : memname, gender : gender, profileimage : profileimage}).done(function(data, state){
							//alert(state);
							location.href = "/kinder/naverJoinPost"
						})
						
					}
				})
				
//					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/naverloginpop.jsp");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
})
	
</script>


<!-- Join & login for Kakao  -->
<script type='text/javascript'>

    // Application key
    Kakao.init('5f223662ebf0e3a3b6c8816122c75d43');

    function loginWithKakao() {
    	// create login button
         Kakao.Auth.login({
          success: function(authObj) {
        	  Kakao.API.request({
        		url: '/v1/user/me',
        		success: function(res){
        			$.ajax({
        				type : "post",
        				url : "/kinder/gJoinWithKakao",
        				data : {
        					'id' : res.id,
        					'nickname' : res.properties['nickname'],
        					'kakaoID' : (res.account_email ? res.account_email : 'noInfo'),
        					'gender' : (res.gender ? res.gender : 'noInfo' ),
        					'token' : authObj.access_token,
        					'profile' : res.properties['profile_image'],
        					'thumImg' : res.properties['thumbnail_image'] 
        					}
        			, success : function() {
						location.href="/kinder/gLoginWithKakao"
					}

        			})  
        	  }
        	  })
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        })
	}
    
</script>


</head>
<body>
<div class="login-page">
  <div class="form">
  <img alt="guardian" src="resources/images/parents.png" style="width: 150px; z-index: 2; margin-top: -200px;">
  <a href="/kinder/"><img alt="logo" src="resources/images/logo.png" style="width: 300px; z-index: 2; margin-top: -30px;"></a>
	<form class="login-form" action="/kinder/gloginPost" method="post">
      <input type="text" placeholder="ID" name="memid"/>
      <input type="password" placeholder="Password" name="mempw"/>
      <button>보호자 로그인</button>
    </form>
    <div class="snslogin" style="display: inline-block; width: 400px; margin-top: 16px;">
    	<div id="naverIdLogin"><a id="naverIdLogin_loginButton" href="#" role="button"><span style="float: right; width: 195px; margin-left: 5px;"><button class="naverlogin"></button></span></a></div>
    		<span style="float: right; width: 195px; margin-left: 5px;"><a id="kakao-login-btn" href="javascript:loginWithKakao()">
<button class="kakaologin" type="button"></button></a></span>
    </div>
    <div class="joinlink">
    	<span class="message">아직 회원이 아니신가요?</span> <span class="join"><a href="join">회원가입하기</a></span>
    </div>
  </div>
</div>
</body>
</html>