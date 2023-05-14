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
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			opener.location.href = "./MemberLogin.foo";
			window.close();
		</script>
	</c:if>
	
<%-- 	<%=request.getParameter("rest_id")%><br> --%>
	
	대기 하시겠습니까?
	<form action="./WaitingCheckPro.fd" method="post">
		<input type="hidden" name="rest_id" value="<%=request.getParameter("rest_id")%>">
		<input type="submit" value="대기">
		<input type="button" value="취소" onclick="window.close();">
	</form>
	
</body>
</html>