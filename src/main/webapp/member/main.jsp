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


<h1>MAIN</h1>


<!-- 로그인 세션 제어 -->
<c:if test="${empty user_id }" >
	<c:redirect url="./MemberLogin.foo"/>
</c:if>

ID : ${user_id }

<hr>

<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.foo';">

<hr>

<!-- 관리자 계정(real_admin) 제어 -->
<c:if test="${!empty user_id && user_id.equals('real_admin')}">
	<input type="button" value="회원 목록" onclick="location.href='./UserInfoList.ad'">
	<input type="button" value="입점 가게 목록" onclick="location.href='./RestaurantList.ad'">
</c:if>


</body>
</html>