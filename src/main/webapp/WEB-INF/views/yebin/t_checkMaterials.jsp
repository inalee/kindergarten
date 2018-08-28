<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체험학습 준비물 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

.ck-container {
	width: 100%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}

h1 {
	font-family: 'Alegreya Sans', sans-serif;
	font-weight: 300;
	margin-top: 0;
}

.control-group {
	display: inline-block;
	vertical-align: top;
	background: #fff;
	text-align: left;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 20%;
/* 	height: 210px; */
	margin: 10px;
}

.control {
	display: block;
	position: relative;
	padding-left: 30px;
	margin-bottom: 15px;
	cursor: pointer;
	font-size: 18px;
}

.control input {
	position: absolute;
	z-index: -1;
	opacity: 0;
}

.control__indicator {
	position: absolute;
	top: 2px;
	left: 0;
	height: 20px;
	width: 20px;
	background: #e6e6e6;
}

.control input:checked ~ .control__indicator {
	background: #fdc645;
}

.control:hover input:not ([disabled]):checked ~ .control__indicator,
	.control input:checked:focus ~ .control__indicator {
	background: #0e647d;
}

.control input:disabled ~ .control__indicator {
	background: #e6e6e6;
	opacity: 0.6;
	pointer-events: none;
}

.control__indicator:after {
	content: '';
	position: absolute;
	display: none;
}

.control input:checked ~ .control__indicator:after {
	display: block;
}

.control--checkbox .control__indicator:after {
	left: 8px;
	top: 4px;
	width: 3px;
	height: 8px;
	border: solid #fff;
	border-width: 0 2px 2px 0;
	transform: rotate(45deg);
}

.control--checkbox input:disabled ~ .control__indicator:after {
	border-color: #7b7b7b;
}
</style>


<script>

var materials = ['체험학습 소책자', '필기도구', '카메라', '원복/교복', '체육복', '속옷/양말', '셔츠/바지'
	, '가디건', '잠옷', '비옷/우산', '신발', '칫솔/치약', '자외선차단크림', '티슈/손수건', '개인비상약', '비닐봉지', '가방'];

var mtrCode = ['mtrbook', 'mtrpen', 'mtrcamera', 'mtruniform', 'mtrgymsuit' , 'mtrinnerware',
'mtrshirts', 'mtrcardigan', 'mtrraincoat', 'mtrshoes', 'mtrtooth', 'mtrsuncream',
'mtrtissue', 'mtrmedice', 'mtrplasticbag', 'mtrbag' ,'mtrpajamas'];

$(function() {
$('.control-group').empty();

for(var i = 0; i < materials.length; i++){
	$('.control-group').append("<label class='control control--checkbox'>"+materials[i]+"<input type='checkbox' id='mcheck' value='"+materials[i]+"'/><div class='control__indicator'></div></label>");
}

	var checkedMtr = [];
	var materialsName = [];

// 	$("#saveMaterials").on('click', function() {
// 	alert("daf")	
	
	window.parent.$("#saveMaterials").on('click', function() {
		 var cbchecked = $("input[id=mcheck]:checked");
		 
			for(var i = 0; i < mtrCode.length; i++){
		 		var flag = false;				
				cbchecked.each(function(){
				if(materials[i] == $(this).val()){
					flag = true;
					checkedMtr.push(1);
					materialsName.push(materials[i]);
					}
				})
				if(flag == false){
					checkedMtr.push(0);						
				}
			}
				console.log(checkedMtr)
				console.log(materialsName)
				
				jQuery.ajaxSettings.traditional = true;
				
				$.ajax({
					url:'/kinder/postSaveMaterials',
					type:'post',
					data: {
						//수정 필요..
						mtrbook : checkedMtr[0],
						mtrpen : checkedMtr[1],
						mtrcamera : checkedMtr[2],
						mtruniform : checkedMtr[3],
						mtrgymsuit : checkedMtr[4],
						mtrinnerware : checkedMtr[5],
						mtrshirts : checkedMtr[6],
						mtrcardigan : checkedMtr[7],
						mtrraincoat : checkedMtr[8],
						mtrsuncream : checkedMtr[9],
						mtrtissue : checkedMtr[10],
						mtrmedice : checkedMtr[11],
						mtrplasticbag : checkedMtr[12],
						mtrbag : checkedMtr[13],
						mtrshoes : checkedMtr[14],
						mtrtooth : checkedMtr[15],
						mtrpajamas : checkedMtr[16],
						mtrList : materialsName
					},
					success : function() {
						console.log("전달 완료");
						window.parent.$("#step8").append("<iframe id='mtrCheck' src='/kinder/yebin/approvalForm' frameborder = 0  style='margin-left:1%; width: 100%;  height: 100vh;'></iframe>")				  
						}
						
					})
				

	})
	
})
</script>
</head>

<body>
	<div class="ck-container">
		<div class="control-group">
		</div>
<!-- 		<button id='saveMaterials'>버튼</button> -->
	</div>
	
</body>
</html>