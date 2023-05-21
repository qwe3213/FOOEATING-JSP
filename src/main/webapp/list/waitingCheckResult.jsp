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
	<fieldset style="text-align: center; border: none; margin-top: 15%;">
		<div style="text-align: center;">
			<h2>대기가 완료되었습니다.</h2>
			
			사용자 : ${sessionScope.user_id}<br>
			대기 중인 가게 : ${wdto.rest_id}<br>
			대기 번호 : ${wdto.wait_num} <br>
			대기 인원 : ${wdto.people} 명
			
			<hr>
			
		</div>
			<span>
				<button onclick="opener.parent.location.reload(); window.close();" 
				style="background-color: #ff4742; color: #fff; border: none; border-radius: 10px; font-size:medium; font-weight: bold;">
					닫기
				</button>
			</span>
	</fieldset>
</body>
</html>