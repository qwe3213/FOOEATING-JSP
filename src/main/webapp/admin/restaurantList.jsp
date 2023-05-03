<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurantList</title>
</head>
<body>
	
	<h1>restaurantList.jsp</h1>
	
	<table border="1">
		<tr>
			<th>No.</th>
			<th>상호명</th>
			<th>업종</th>
			<th>점주 아이디</th>
			<th>전화번호</th>
			<th>등록일</th>
			<th>상세</th>
		</tr>
		
		<c:forEach var="dto" items="${requestScope.restList}" varStatus="no">
		<tr>
			<td>${no.count}</td>
			<td>${dto.name}</td>
			<td>${dto.category}</td>
			<td>${dto.owner_user_id}</td>
			<td>${dto.rest_tel}</td>
			<td>${dto.regdate}</td>
			<td>
				<form action="./RestaurantInfo.ad" method="post">
					<input type="hidden" name="rest_id" value="${dto.rest_id}">
					<input type="submit" value="상세보기">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>