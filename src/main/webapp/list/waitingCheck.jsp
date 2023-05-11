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
	
	<h1>WaitingCheck.jsp</h1>
	
	<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id}">
		<c:redirect url="./MemberLogin.foo" />
	</c:if>
	
	대기 하시겠습니까?
	
	<form action="./WaitingCheckPro.fd" method="post">
		<input type="hidden" name="rest_id" value="<%=request.getParameter("rest_id")%>">
		<input type="hidden" name="user_id" value="${sessionScope.user_id}">
		<input type="submit" value="대기">
		<input type="button" value="취소" onclick="window.close();">
	</form>
	
</body>
</html>