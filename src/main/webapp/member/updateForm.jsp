<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		$('#phone').keyup(function(){
			let phone = document.fr.phone.value;
			let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			if(!regPhone.test(phone)){
		     	$('#phonediv').html("연락처 형식에 맞지 않습니다");
			} else {
				$('#phonediv').html("");
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
		
		$("#fr").on("submit", function (e) { 
			let name = document.fr.name.value;
			let regName = /^[가-힣a-zA-Z]{2,15}$/;
			let phone = document.fr.phone.value;
			let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			
			if(!regName.test(name)){
				  e.preventDefault();
			} else if(!regPhone.test(phone)){
				  e.preventDefault();
			}
			
		});
		
		
	});

		function checkData() {
			
			// 아이디가 입력되어 있는지 체크
			
			if(document.fr.pw.value == ""){
				alert(" 비밀번호를 입력하시오!");
				document.fr.pw.focus();
				return false;
			}
			
		}
		
		function winopen(){
			let popupX = (window.screen.width / 2) - (500 / 2);
			let popupY= (window.screen.height /2) - (300 / 2);
			
			window.open("changePw.foo","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			
		}
	
	</script>

</head>
<body>
 		<h1>updateForm.jsp(team4)</h1>
 		<!-- itwill_member 테이블에 저장될 정보를 입력 -->
 		<fieldset>
 			<legend>FOOEATING 회원 정보 수정</legend>
 			
 			<!-- action주소가 없으면 자신의 페이지 호출 -->
	 		<form action="./MemberUpdateProAction.foo" method="post" name="fr" onsubmit="return checkData();" id="fr">
 			 	아이디 : <input type="text" name="user_id" value="${dto.user_id }" readonly="readonly"><br>
 			 	비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
 			 	<input type="button" value="비밀번호 변경" onclick="winopen()"><br>
 			 	이름 : <input type="text" name="name" value="${dto.name }" id="name"><br>
 			 	<div id="namediv" class="errorDiv"></div>
 			 	이메일 : <input type="email" name="email" value="${dto.email }" readonly="readonly"><br>
 			 	휴대전화 : <input type="text" name="phone" value="${dto.phone }" id="phone"> 
 			 	<div id="phonediv" class="errorDiv"></div>       
 			 	<hr>      
 			 	<input type="submit" value="회원정보 수정">
 		
 		
 			</form>
 		</fieldset>
 	
 	
 	
 	
</body>
</html>