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
	
	<c:if test="${empty waiting_dto}">
		<c:redirect url="./WaitingCheck.fd" />
	</c:if>
	
	<c:if test="${waiting_dto.user_id.equals(user_id) && waiting_dto.rest_id.equals(rest_id)}">
		<c:if test="${waiting_dto.status == 1}">
			대기 번호 : ${waiting_dto.wait_num} <br>
			<button onclick="window.close();">닫기</button>
		</c:if>
	</c:if>
	
</body>
</html>