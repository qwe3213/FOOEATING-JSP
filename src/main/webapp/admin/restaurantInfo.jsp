<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 상세 목록</title>

<!-- css파일 -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="css/main.css">
<link href="./css/sideMenu.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="css/ownerwait.css"> -->
<link rel="stylesheet" href="css/question.css">

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
	<jsp:include page="../inc/headerDiv.jsp" />
	<!-- header -->

	<!-- sideMune -->
	<jsp:include page="../inc/sideMenuAdmin.jsp" />
	<!-- sideMune -->


	<!-- main -->
	<main>
		<br>
		<br>
		<div id="top">
			<div id="category"
				style="margin: 85px 50px 0 410px; min-width: 800px;">
				<table>
					<tbody>
						<tr>
							<th>상호명</th>
							<td>${restInfo.name}</td>
							<td rowspan="6"><img src="./upload/${restInfo.outfile}" width="230px" style="margin-left: 20px;"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${restInfo.addr_city}${restInfo.addr_district}
								${restInfo.addr_etc}</td>
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
							<th>편의시설</th>
							<td>${restInfo.convenience}</td>
						</tr>
						<tr>
							<th>가게 공지사항</th>
							<td>${restInfo.rest_notice}</td>
						</tr>
					</tbody>
				</table>

				<c:set var="rstatus" value="<%=request.getParameter(\"rstatus\")%>" />
				<c:set var="rest_id" value="${param.rest_id}" />

				<!-- 대기 중인 가게 목록에서 진입  -->
				<c:if test="${rstatus.equals('no')}"><br>
					<button
						style="padding-right: 10px;"
						onclick="opener.parent.location.reload(); winopen(${rest_id})"
						class="btn-2">입점 승인</button>
					<button
						onclick="location.href='./RestaurantWaitList.ad?pageNum=${pageNum}'"
						class="btn-2">목록으로</button>
				</c:if>

				<!-- 입점 중인 가게 목록에서 진입  -->
				<c:if test="${rstatus.equals('yes')}"><br>
					<button
						onclick="location.href='./RestaurantList.ad?pageNum=${pageNum}'"
						class="btn-2">목록으로</button>
				</c:if>
			</div>
		</div>
	</main>
	<!-- main -->


	<!-- footer -->
	<jsp:include page="../inc/footerDiv.jsp" />
	<!-- footer -->

</body>
</html>