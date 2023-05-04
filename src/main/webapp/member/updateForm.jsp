<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function checkData() {
			
			// 아이디가 입력되어 있는지 체크
			
			if(document.fr.pw.value == ""){
				alert(" 비밀번호를 입력하시오!");
				document.fr.pw.focus();
				return false;
			}
			
		}
	
	</script>

</head>
<body>
 		<h1>updateForm.jsp(team4)</h1>
 		<!-- itwill_member 테이블에 저장될 정보를 입력 -->
 		<fieldset>
 			<legend>FOOEATING 회원 정보 수정</legend>
 			
 			<!-- action주소가 없으면 자신의 페이지 호출 -->
	 		<form action="./MemberUpdateProAction.foo" method="post" name="fr" onsubmit="return checkData();">
 			 	아이디 : <input type="text" name="user_id" value="${dto.user_id }" readonly="readonly"><br>
 			 	비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
 			 	<button onclick="winopen()">비밀번호 변경</button><br>
 			 	이름 : <input type="text" name="name" value="${dto.name }"><br>
 			 	이메일 : <input type="email" name="email" value="${dto.email }" readonly="readonly"><br>
 			 	휴대전화 : <input type="text" name="phone" value="${dto.phone }">      
 			 	<hr>      
 			 	<input type="submit" value="회원정보 수정">
 		
 		
 			</form>
 		</fieldset>
 	
 	
 	
 	
</body>
</html>