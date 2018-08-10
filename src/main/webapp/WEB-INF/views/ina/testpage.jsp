<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../commons/guardianmenu.jsp" flush="true" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-text-size-adjust:none;-webkit-tap-highlight-color:rgba(0,0,0,0);-webkit-font-smoothing: antialiased}
html,body{height:100%;margin:0;padding:0}
body,p,ul,menu,ol,li,dl,dt,dd,form,table,th,td,fieldset,input,textarea,select,button,h1,h2,h3,h4,h5,h6,pre,address {margin:0; padding:0}

.ly_pop{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:99}
.ly_pop .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.4}
.ly_pop .popcls{position:absolute;top:-30px;right:3px;}
.ly_pop .cont{width: 100%;height: 100%;position: absolute;top: 0;left: 0;z-index:999;text-align: center}
.ly_pop .cont:before{height:100%;content:'';display:inline-block;vertical-align:middle}
.ly_pop .ele{width:70%; height:80%; position:relative;display:inline-block;vertical-align:middle;margin:0 auto 0 -2px;background:#fff;padding:15px;border-radius:5px}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript"> 
//Layer Popup
function layer_open(obj) {
    var temp = $('#' + obj);
    var bg = temp.parent().parent().find('.bg').hasClass('bg');
    if(bg) {
        $('html, body').css('overflow-y','hidden');
        temp.parent().parent().show();
        temp.parent().css('overflow-y','auto');
    }
    temp.find('.popcls').on('click', function(e){
        if(bg) {
            $('html, body, .ly_pop, .ly_pop .cont').removeAttr('style');
        }
        e.preventDefault();
    });
};
</script>
</head>
<body>

<button type="button" onclick="layer_open('modal');">popup view</button>

<div class="ly_pop">
	<div class="bg"><!-- shadow --></div>
	<div class="cont">
		<section id="modal" class="ele">
			<a href="" class="ico_com popcls">닫기</a>
				내용내용
		</section>
	</div>
</div>

</body>
</html>

