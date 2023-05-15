<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">


</head>
<body>

<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sidemenu -->
	<jsp:include page="../inc/sideMenuOwner.jsp" />
<!-- sidemenu -->







<!-- main -->
<main>
<br><br>

<h1></h1>

<table border="1">
	<tr>
		<th>대기 번호</th>
		<th>회원 이름</th>
		<th>전화번호</th>
		<th>인원수</th>
	</tr>
	
	<c:forEach var="dto" items="${requestScope.waitingList }">
	<tr>
		<td>${dto.wait_num }</td>
		<td>${dto.name }</td>
		<td>${dto.phone }</td>
		<td>${dto.people }</td>
	</tr>
	</c:forEach>

</table>



</main>
<!-- main -->








<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
<!-- footer -->


</body>
</html>