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
	
	<table border="1">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>가입일</th>
			<th>점주유무</th>
		</tr>
		
		<c:forEach var="dto" items="${requestScope.userList }" varStatus="no">
		<tr>
			<td>${no.count}</td>
			<td>${dto.user_id}</td>
			<td>${dto.pw}</td>
			<td>${dto.name}</td>
			<td>${dto.email}</td>
			<td>${dto.phone}</td>
			<td>${dto.regdate}</td>
			<td></td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>