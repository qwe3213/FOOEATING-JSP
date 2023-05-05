<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이페이지 (회원)</h1>
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		<input type="button" value="회원 정보 수정" onclick="location.href='./MemberUpdate.foo';">
		<input type="button" value="리뷰 관리" onclick="location.href='./MyReview.foo';">


</body>
</html>