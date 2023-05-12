<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="./css/header.css" rel="stylesheet">
<script type="text/javascript">
	function winopen1(rest_id){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height / 2) - (300 / 2);
		
		window.open("WaitingCheck.fd?rest_id=" + rest_id, "", 
		"width=500,height=300,left="+ popupX + ',top='+ popupY + ',screenX='+ popupX + 
		 ',screenY= '+ popupY);
	}
	
	function winopen2(){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height / 2) - (300 / 2);
		
		window.open("WaitingCheckResult.fd", "", 
		"width=500,height=300,left="+ popupX + ',top='+ popupY + ',screenX='+ popupX + 
		 ',screenY= '+ popupY);
	}
</script>

</head>
<body>

<!-- header -->
<jsp:include page="../inc/header.jsp" />
<!-- header -->

		<h1>상세페이지</h1>
		
		<table border="1">
		<tr>
			<th>상호명</th>
			<td>${restForm.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${restForm.rest_tel}</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>${restForm.category}</td>
		</tr>
		<tr>
			<th>영업 시간</th>
			<td>${restForm.runtime}</td>
		</tr>
		<tr>
			<th>메뉴</th>
			<td></td>
		</tr>
		<tr>
			<th>편의시설</th>
			<td>${restForm.convenience}</td>
		</tr>
		<tr>
			<th>가게 공지사항</th>
			<td>${restForm.rest_notice}</td>
		</tr>
	</table>
	
	<br>
	
	${wdto.user_id} ${wdto.rest_id} ${wdto.wait_num} <br>
	
	<c:if test="${wdto == null}">
		<button onclick="winopen1('${restForm.rest_id}');">대기하기</button>
	</c:if>
	
	<c:if test="${wdto != null}">
		<button onclick="winopen2();">대기하기</button>
	</c:if>
	
	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
</body>
</html>