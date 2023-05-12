<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="./js/jquery-3.6.4.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.4.js" 
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" 
        crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
	
	$('.errorDiv').css({
		'font-size' : '0.7em',
		'color' : 'red'
	});
	
	$('#newPw').keyup(function() {
	    let newPw = document.fr.newPw.value;
	    let number = newPw.search(/[0-9]/g);
	    let english = newPw.search(/[a-z]/ig);
	    let spece = newPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	    
	    if (newPw.length < 8 || newPw.length > 20) {
	    	$(function(){
	    		$('#newPwDiv').html("8자리 ~ 20자리 이내로 입력해주세요.");
	    	});

	    } else if (newPw.search(/\s/) != -1) {
	    	$(function(){
	        	$('#newPwDiv').html("비밀번호는 공백 없이 입력해주세요.");
	        });

	    } else if (number < 0 || english < 0 || spece < 0) {
	    	$(function(){
	    		$('#newPwDiv').html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			});

	    } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
	    	$(function(){
	    		$('#newPwDiv').html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			});

	    } else if (/(\w)\1\1\1/.test(newPw)) {
	    	$(function(){
	    		$('#newPwDiv').html('같은 문자를 4번 이상 사용하실 수 없습니다.');
			});

	    } else{
	    	$(function(){
	    		$('#newPwDiv').html("");
			});
	    }

	});
	
	
	$('#checkNewPw').keyup(function(){
		let newPw = document.fr.newPw.value;
	    let checkNewPw = document.fr.checkNewPw.value;
		if(newPw != checkNewPw){
	     	$('#checkNewPwDiv').html("비밀번호가 일치하지 않습니다.");
		} else {
			$('#checkNewPwDiv').html("");
		}
	 	
	});
	
	
	
	
});

function checkData() {
	let pw = document.fr.pw.value;
    let newPw = document.fr.newPw.value;
    let checkNewPw = document.fr.checkNewPw.value;
    
	if (pw == ""){
		document.fr.pw.focus();
		return false;

	}else if (newPw == ""){
		document.fr.newPw.focus();
		return false;
		
	}else if(checkNewPw == ""){
		document.fr.checkNewPw.focus();
		return false;
	} else {
		return true;
	}
	
	
}



</script>
</head>
<body>
		<h1>changePw.jsp</h1>
		
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		<form action="./ChangePwAction.foo" method="post" name="fr" onsubmit="return checkData()" id="fr">
		현재 비밀번호<input type="password" name="pw"><br>
		새 비밀번호<input type="password" name="newPw" id="newPw"><br>
		<div id="newPwDiv" class="errorDiv"></div>
		새 비밀번호 확인<input type="password" name="checkNewPw" id="checkNewPw">
		<div id="checkNewPwDiv" class="errorDiv"></div>
		
		<button>비밀번호 변경</button>
		</form>
		
		
</body>
</html>