<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>approvalCheck</title>
<link rel="stylesheet" href="css/question.css">
</head>
<body>
	<fieldset style="text-align: center; border: none; margin-top: 100px;">
	<div style="text-align: center;">
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id || !user_id.equals('real_admin')}" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		입점을 승인하시겠습니까? <br><br>
		<form action="./ApprovalCheckPro.ad" method="post">
			<input type="hidden" name="rest_id" value="${param.rest_id}">
			<input type="submit" value="승인" class="btn-2">
			<input type="button" value="거절" onclick="opener.parent.location.reload(); window.close();" class="btn-2">
		</form>
	</div>
	</fieldset>
		
</body>
</html>