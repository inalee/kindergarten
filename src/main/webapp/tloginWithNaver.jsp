<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
 <h1></h1>

</body>
<script>
//window.close()


var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "nZ6hOsd_vBKNiin5JPzT",
		callbackUrl: "http://192.168.0.15:8080/tloginWithNaver.jsp",
		isPopup: true , /* 팝업을 통한 연동처리 여부 */
		callbackHandle: true
	}
);
window.addEventListener('load', function () {		
	/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
			naverLogin.getLoginStatus(function (status) {
				//alert(status)
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
					$.post("/kinder/nLoginPost", {memid:memid, memsort : 1}).done(function(data, state){
						//alert(data)
						if(data=="success"){
							//alert("login!!")
							location.href = "/kinder/tmain"
						}
						else{
							$.post("/kinder/naverJoinPost", {memid:memid, memname : memname, gender : gender, profileimage : profileimage}).done(function(data, state){
								//alert(state);
								location.href = "/kinder/naverJoinPost"
							})
							
						}
					})
					
						//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/kinder/gmain");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		
	})

</script>
</html>