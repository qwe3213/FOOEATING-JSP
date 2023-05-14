<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	<!-- header -->

	<!-- sideMenu -->
	<jsp:include page="../inc/sideMenu.jsp" />
	<!-- sideMenu -->

	<!-- main -->
	<main>

		<h1>찜한 매장</h1>
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }">
			<c:redirect url="./MemberLogin.foo" />
		</c:if>


		<c:forEach var="dto" items="${likeList}">
			<table border="1">
				<tr>
					<td colspan="2"><a
						href="./restaurantForm.fd?rest_id=${dto.rest_id}">${dto.name }</td>
				</tr>
				<tr>
					<td colspan="2">${dto.rest_tel }</td>
				</tr>
				<tr>
					<td colspan="2">${dto.descriptions }</td>
				</tr>
			</table>
			<br>
			<br>
		</c:forEach>
	</main>

<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
<!-- footer -->

</body>
</html>