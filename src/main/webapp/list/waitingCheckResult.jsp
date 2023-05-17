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
	
	<h1>waitingCheckResult.jsp</h1>
	
	사용자 : ${sessionScope.user_id}<br>
	대기 중인 가게 : ${wdto.rest_id}<br>
	대기 번호 : ${wdto.wait_num} <br>
	대기 인원 : ${wdto.people} 명
	
	<hr>
	
	<button onclick="opener.parent.location.reload(); window.close();">닫기</button>
	
</body>
</html>