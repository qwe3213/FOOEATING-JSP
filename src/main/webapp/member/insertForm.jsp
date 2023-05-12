<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.4.js"></script>

<script type="text/javascript">

$(function() {
	$('.errorDiv').css({
		'font-size' : '0.7em',
		'color' : 'red'
	});
	
	
	
	$('#id').keyup(function() {
	
		let id = document.fr.user_id.value;
		let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
		if(regIdPw.test(id)){
		$('#idd').html("");
		
		}else if(!regIdPw.test(id)){
		$('#idd').html("4~12자 영문 대소문자, 숫자만 입력하세요.");	
		$('#idd').css('color', 'red');
		}
		
		$.ajax({
			url:"./IdCheckAction.foo",
			data : {user_id:id},
			success: function(data) {
				if(data ==1 && regIdPw.test(id)){
					$('#idd').html("사용 가능한 아이디 입니다.");	
					$('#idd').css('color', 'green');
					$('#fr').unbind();
				} else if(data ==0 && regIdPw.test(id)){
					$('#idd').html("이미 존재하는 아이디 입니다.");	
					$('#idd').css('color', 'red');
					$("#fr").on("submit", function (e) { 
                        e.preventDefault();
                   });
				}
			
			},
			error : function() {
				alert("서버요청실패");
			}
		});
		
		
		
	});
	
	
	
	$("#fr").on("submit", function (e) { 
		let id = document.fr.user_id.value;
	    let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	    let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
	    let email = document.fr.email.value;
		let regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let name = document.fr.name.value;
		let regName = /^[가-힣a-zA-Z]{2,15}$/;
		let phone = document.fr.phone.value;
		let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		
		  if(!regMail.test(email)){
	     		e.preventDefault();
		  } else if (pw.length < 8 || pw.length > 20) {
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
	  	  } else if(!regIdPw.test(id)){
		  		e.preventDefault();
		  } else if(!regName.test(name)){
			  e.preventDefault();
		  } else if(!regPhone.test(phone)){
			  e.preventDefault();
		  }
		  
	    });
		
		

	
	
	$('#pw').keyup(function() {
		let id = document.fr.user_id.value;
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
	     	$('#cpwd').html("비밀번호가 일치하지 않습니다.");
		} else {
			$('#cpwd').html("");
		}
	 	
	});
	
	$('#email').keyup(function(){
		let eamil = document.fr.email.value;
		let regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!regMail.test(eamil)){
	     	$('#emaildiv').html("잘못된 이메일 형식입니다.");
		} else {
			$('#emaildiv').html("");
		}
	 	
	});
	
	$('#name').keyup(function(){
		let name = document.fr.name.value;
		let regName = /^[가-힣a-zA-Z]{2,15}$/;
		if(!regName.test(name)){
	     	$('#namediv').html("최소 2글자 이상, 한글과 영어만 입력하세요.");
		} else {
			$('#namediv').html("");
		}
	 	
	});
	
	$('#phone').keyup(function(){
		let phone = document.fr.phone.value;
		let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		if(!regPhone.test(phone)){
	     	$('#phonediv').html("연락처 형식에 맞지 않습니다");
		} else {
			$('#phonediv').html("");
		}
	 	
	});
	
	
	
});

	
		function checkData() {
			let id = document.fr.user_id.value;
			let pw = document.fr.pw.value;
		    let cpw = document.fr.cpw.value;
		    let name = document.fr.name.value;
		    let email = document.fr.email.value;
		    let phone = document.fr.phone.value;
		    
			// 아이디가 입력되어 있는지 체크
			if(id == ""){
				document.fr.user_id.focus();
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
 			 	<input type="text" name="user_id" maxlength="20" id="id" ><br>
 			 	<div id="idd" class="errorDiv"></div>
 			 	비밀번호<br>
 			 	<input type="password" name="pw" maxlength="20" id="pw"><br>
 			 	<div id="pwd" class="errorDiv"></div>
 			 	비밀번호 재확인<br>
 			 	<input type="password" name="cpw" maxlength="20" id="cpw"><br>
 			 	<div id="cpwd" class="errorDiv"></div>
 			 	이름<br>
 			 	<input type="text" name="name" id="name"><br>
 			 	<div id="namediv" class="errorDiv"></div>
 			 	이메일<br>
 			 	<input type="email" name="email" id="email"><br>
 			 	<div id="emaildiv" class="errorDiv"></div>
 			 	휴대전화<br>
 			 	<input type="text" name="phone" id="phone"><br>
 			 	<div id="phonediv" class="errorDiv"></div>       
 			 	<hr>      
 			 	<input type="submit" value="회원가입">
 			 	
 		
 			</form>
 		</fieldset>
 	
 	
 	
</body>
</html>