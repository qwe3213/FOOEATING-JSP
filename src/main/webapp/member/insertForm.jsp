<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="../js/jquery-3.6.4.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.4.js" 
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" 
		crossorigin="anonymous"></script>

<script type="text/javascript">

$(function() {
	$('.errorDiv').css({
		'font-size' : '0.7em',
		'color' : 'red'
	});
	
	$('#id').keyup(function() {
	
		let id = document.fr.id.value;
		let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
		if(regIdPw.test(id)){
		$('#idd').html("");
		
		}else if(!regIdPw.test(id)){
		$('#idd').html("4~12자 영문 대소문자, 숫자만 입력하세요.");	
		}
		
	});
	
	
	
	$("#fr").on("submit", function (e) { 
		let id = document.fr.id.value;
	    let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
       
		  if (pw.length < 8 || pw.length > 20) {
	    		 e.preventDefault();
		  } else if (pw.search(/\s/) != -1) {
	        	e.preventDefault();
	 	  } else if (number < 0 || english < 0 || spece < 0) {
	    		e.preventDefault();
	  	  } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
	    		e.preventDefault();
	  	  } else if (/(\w)\1\1\1/.test(pw)) {
	    		e.preventDefault();
	  	  } else if (pw.search(id) > -1) {
	    		e.preventDefault();
	  	  } else if(pw != cpw){
		     	e.preventDefault();
	  	  }
	    });
		
		

	
	
	$('#pw').keyup(function() {
		let id = document.fr.id.value;
	    let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	    
	    if (pw.length < 8 || pw.length > 20) {
	    	$(function(){
	    	$('#pwd').html("8자리 ~ 20자리 이내로 입력해주세요.");
	    	});

	    } else if (pw.search(/\s/) != -1) {
	    	$(function(){
	        	$('#pwd').html("비밀번호는 공백 없이 입력해주세요.");
	        });

	    } else if (number < 0 || english < 0 || spece < 0) {
	    	$(function(){
	    		$('#pwd').html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			});

	    } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
	    	$(function(){
	    		$('#pwd').html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			});

	    } else if (/(\w)\1\1\1/.test(pw)) {
	    	$(function(){
	    		$('#pwd').html('같은 문자를 4번 이상 사용하실 수 없습니다.');
			});

	    } else if (pw.search(id) > -1) {
	    	$(function(){
	    		$('#pwd').html("비밀번호에 아이디가 포함되었습니다.");
			});
	    } else{
	    	$(function(){
	    		$('#pwd').html("");
			});
	    }

	});
	
	
	$('#cpw').keyup(function(){
		let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
		if(pw != cpw){
	     	$('#cpwd').html("비밀번호가 다릅니다.");
		} else {
			$('#cpwd').html("");
		}
	 	
	});
	
	
});

	
		function checkData() {
			let id = document.fr.id.value;
			let pw = document.fr.pw.value;
		    let cpw = document.fr.cpw.value;
		    let name = document.fr.name.value;
		    let email = document.fr.email.value;
		    let phone = document.fr.phone.value;
		    let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
		    let regName = /^[가-힣a-zA-Z]{2,15}$/;
		    
			// 아이디가 입력되어 있는지 체크
			if(id == ""){
				document.fr.id.focus();
				return false;
			}
			else if (pw == ""){
				document.fr.pw.focus();
				return false;
		
			}else if (cpw == ""){
				document.fr.cpw.focus();
				return false;
				
			}else if(name == ""){
				document.fr.name.focus();
				return false;
			}else if(email == ""){
				document.fr.email.focus();
				return false;
			}else if(phone == ""){
				document.fr.phone.focus();
				return false;
			} else {
				alert('오류 없음');
				return true;
			}
			
			
		}
		 
	
	</script>

</head>
<body>
 		<h1>insertForm.jsp(team4)</h1>
 		<!-- itwill_member 테이블에 저장될 정보를 입력 -->
 		
 		<fieldset>
 			<legend>team4 회원가입</legend>
 			
 			<!-- action주소가 없으면 자신의 페이지 호출 -->
	 		<form action="./MemberJoinAction.foo" method="post" name="fr" onsubmit="return checkData()" id="fr">
 			 	아이디 <br>
 			 	<input type="text" name="id" maxlength="20" id="id" ><br>
 			 	<div id="idd" class="errorDiv"></div>
 			 	비밀번호<br>
 			 	<input type="password" name="pw" maxlength="20" id="pw"><br>
 			 	<div id="pwd" class="errorDiv"></div>
 			 	비밀번호 재확인<br>
 			 	<input type="password" name="cpw" maxlength="20" id="cpw"><br>
 			 	<div id="cpwd" class="errorDiv"></div>
 			 	이름<br>
 			 	<input type="text" name="name"><br>
 			 	이메일<br>
 			 	<input type="email" name="email"><br>
 			 	휴대전화<br>
 			 	<input type="text" name="phone"><br>
 			 	       
 			 	<hr>      
 			 	<input type="submit" value="회원가입">
 			 	
 		
 			</form>
 		</fieldset>
 	
 	
 	
</body>
</html>