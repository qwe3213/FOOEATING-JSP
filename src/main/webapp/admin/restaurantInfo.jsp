<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurantInfo</title>

<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">

<script type="text/javascript">
	function winopen(rest_id){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height / 2) - (300 / 2);
		
		window.open("ApprovalCheck.ad?rest_id=" + rest_id, "", 
		"width=500,height=300,left="+ popupX + ',top='+ popupY + ',screenX='+ popupX + 
		 ',screenY= '+ popupY);
	}
</script>


</head>
<body>
	
<!-- header -->
<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sideMune -->
<jsp:include page="adminSidMenu.jsp" />
<!-- sideMune -->
	
	<table border="1">
		<tr>
			<th>상호명</th>
			<td>${restInfo.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${restInfo.addr_city} ${restInfo.addr_district} ${restInfo.addr_etc}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${restInfo.rest_tel}</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>${restInfo.category}</td>
		</tr>
		<tr>
			<th>영업 시간</th>
			<td>${restInfo.runtime}</td>
		</tr>
		<tr>
			<th>메뉴</th>
			<td></td>
		</tr>
		<tr>
			<th>편의시설</th>
			<td>${restInfo.convenience}</td>
		</tr>
		<tr>
			<th>가게 공지사항</th>
			<td>${restInfo.rest_notice}</td>
		</tr>
	</table>
	
	<c:if test="${user_id.equals(dto.owner_user_id)}">
		<button onclick="winopen(${rest_id})">입점 승인</button>
	</c:if>
	
	<button onclick="location.href='./RestaurantList.ad?pageNum=${pageNum}'">입점 목록으로</button>
	
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
	
</body>
</html>