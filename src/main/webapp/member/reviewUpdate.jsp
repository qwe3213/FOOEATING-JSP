<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.4.js"></script>

</head>
<body>
	

	<h1> 리뷰 수정</h1>
		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		<table border="1">
		<tr>
			<td colspan="2">가명 : ${dto.name }</td>
		</tr>	
		<tr>
			<td>별점 : ${dto.grade }</td>
		</tr>
		
		</table>
		
		<form action="./ReviewUpdateAction.foo" method="post">
			<input type="hidden" name="user_id" value="${user_id }">
			<input type="hidden" name="review_num" id="review_num" value="${dto.review_num }">
			<input type="text" name="newContent" value="${dto.content}"><br>
			<button>수정</button>
		</form>
	
</body>
</html>