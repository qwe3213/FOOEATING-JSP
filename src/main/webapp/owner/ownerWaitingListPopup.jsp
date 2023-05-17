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

<h1>입장 완료 !</h1>




해당 손님의 입장을 완료하시겠습니까? <br>
<form action="./OwnerWaitingListPopupAction.on" method="post">
	<input type="hidden" name="wait_num" value="<%=request.getParameter("wait_num") %>">
	<input type="submit" value="완료">
	<input type="button" value="취소" onclick="window.close();">
</form>









</body>
</html>