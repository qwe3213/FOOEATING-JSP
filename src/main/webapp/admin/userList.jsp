<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList</title>
</head>
<body>
	
	<h1>userList.jsp</h1>
	
	<c:forEach var="dto" items="${requestScope.userList }">
	아이디 : ${dto.id}<br>
	비밀번호 : ${dto.pw}<br>
	이름 : ${dto.name}<br>
	이메일 : ${dto.email}<br>
	전화번호 : ${dto.phone}<br>
	가입일 : ${dto.regdate}<br>
	점주 유무 : <br>
	</c:forEach>
	
</body>
</html>