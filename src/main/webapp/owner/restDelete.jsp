<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>restDelete.jsp(team4)</h1>
		<h2> 가게 삭제 삭제(탈퇴)</h2>

		
		<fieldset>
		 <legend> 가게 삭제시 비밀번호를 입력하세요! </legend>
	 
		<form action="./RestaurantDeleteProAction.on" method="post">
			비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
	
			<input type="submit" value="삭제">
		</form>
	</fieldset>
</body>
</html>