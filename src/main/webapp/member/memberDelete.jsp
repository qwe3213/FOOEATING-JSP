<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
		<div style="text-align: center; margin-top: 20%;">
		<div style="margin: 2%;">
			<h2> 회원정보 삭제(탈퇴)</h2>
			
			
			<c:if test="${empty user_id}">
				<c:redirect url="./MemberLogin.foo"/>
			</c:if>
			
			
			<fieldset style="border: hidden;">
			 <legend> 회원 탈퇴시 비밀번호를 입력하세요! </legend>
		 
			<form action="./MemberDeleteAction.foo" method="post">
		  	  <input type="hidden" name="id" value="${user_id}"><br>
				비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
				<div style="margin: 5%;">
				<input type="submit" value="탈퇴" style="background-color: #ff4742;
															color: #fff;
															border: none;
															border-radius: 10px;
															font-size:medium;
															font-weight: bold;">
				</div>	
			</form>
		</fieldset>
		</div>
	</div>
</body>
</html>