<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>리뷰 관리</h1>
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		

		<c:forEach var="dto" items="${reviewList}" >
		<table border="1">
		<tr>
			<td colspan="2">${dto.name }</td>
		</tr>	
		<tr>
			<td>${dto.grade }</td>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<td colspan="2">${dto.content }</td>
		</tr>
		
		</table>
		<button onclick="location.href='./reviewUpdate.foo">수정</button>
		<button onclick="location.href='./reviewDelete.foo">삭제</button>
		
		</c:forEach>
		
		
		
</body>
</html>