<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 My page 대기 관리</title>
</head>
<body>

<fieldset style="text-align: center; border: none; margin-top: 50px;">

	<h1>입장 완료 !</h1>
	
	
	
	
	해당 손님의 입장을 완료하시겠습니까? <br>
	<form action="./OwnerWaitingListPopupAction.on" method="post">
		<input type="hidden" name="wait_num" value="<%=request.getParameter("wait_num") %>">
		<div style="margin-top: 15px;">
			<input type="submit" value="완료" style="background-color: #ff4742;
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
		</div>
	</form>

</fieldset>







</body>
</html>