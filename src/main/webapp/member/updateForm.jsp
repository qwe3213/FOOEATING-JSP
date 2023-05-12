<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

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
			
			window.open("ChangePw.foo","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			
		}
		
		function winopen2(){
			let popupX = (window.screen.width / 2) - (500 / 2);
			let popupY= (window.screen.height /2) - (300 / 2);
			
			window.open("MemberDelete.foo","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			
		}
	
	</script>

</head>
<body>

<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sideMenu -->
	<jsp:include page="../inc/sideMenu.jsp" />
<!-- sideMenu -->

<!-- main -->
<main>

 		<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id }" >
		<c:redirect url="./MemberLogin.foo"/>
	</c:if>
 		
 		<br><br>
 		<fieldset>
 			<legend>FOOEATING 회원 정보 수정</legend>
 			
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
 			 	<input type="button" value="회원 탈퇴" onclick="winopen2()"><br>
 		
 		
 			</form>
 		</fieldset>
 </main>
 <!-- main -->
 	
<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
 	
</body>
</html>