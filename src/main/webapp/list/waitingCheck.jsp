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
	
<!-- 	<h1>WaitingCheck.jsp</h1> -->
	
	<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id}">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			opener.location.href = "./MemberLogin.foo";
			window.close();
		</script>
	</c:if>
	
<%-- 	<%=request.getParameter("rest_id")%><br> --%>
	<div class="cd-popup" style="text-align: center; margin-top: 25%;">
		<h2>대기 하시겠습니까?</h2>
			<form action="./WaitingCheckPro.fd" method="post">
				<input type="hidden" name="rest_id" value="<%=request.getParameter("rest_id")%>">
				<h2>대기 인원 : <input type="number" name="people" min="1" max="5" value="1">(최대 5명)</h2><br>
				<input type="submit" value="대기" style="background-color: #ff4742;
															color: #fff;
															border: none;
															border-radius: 10px;
															font-size:medium;
															font-weight: bold;">
				<input type="button" value="취소" onclick="window.close();" style="background-color: #ff4742;
																					color: #fff;
																					border: none;
																					border-radius: 10px;
																					font-size:medium;
																					font-weight: bold;">
			</form>
	</div>
	
</body>
</html>