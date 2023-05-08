<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<!-- 로그인 세션 제어 -->
<c:if test="${empty user_id }" >
	<c:redirect url="./MemberLogin.foo"/>
</c:if>



<!-- header -->
<jsp:include page="../inc/header.jsp" />
<!-- header -->



<!-- sideMenu -->
<jsp:include page="../inc/sideMenu.jsp" />
<!-- sideMenu -->
	


<!-- main -->
<main>
	<br><br><br>
	<input type="button" value="회원 정보 수정" onclick="location.href='./MemberUpdate.foo';">
	<input type="button" value="리뷰 관리" onclick="location.href='./MyReview.foo';">
</main>
<!-- main -->



<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->



</body>
</html>