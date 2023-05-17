<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurantList</title>

<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

<script type="text/javascript">
	function cancelWaiting() {
		var cancelConfirm = confirm('정말 취소하시겠습니까?');
		if (cancelConfirm) {
			return true;
		} else {
			return false;
		}
	}
	function winopen(wait_num){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
		window.open("ReviewWrite.foo?wait_num="+wait_num+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		
	}
	
</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	<!-- header -->

	<!-- sideMune -->
	<jsp:include page="../inc/sideMenuMember.jsp" />
	<!-- sideMune -->

	<!-- main -->
	<main>
	<br><br>
		<!-- 유저 로그인 제어 -->
		<c:if test="${empty user_id }">
			<c:redirect url="./MemberLogin.foo" />
		</c:if>

		<c:if test="${empty wDto.wait_num }">
		 현재 줄서기 중인 가게가 없습니다!
		</c:if>
		<c:if test="${!empty wDto.wait_num }">
			<h2>대기 중인 가게</h2>
			<table border="1">
				<tr>
					<td>가게명</td>
					<td>나의 대기번호</td>
					<td>남은 팀 수</td>
				</tr>
				<tr>
					<td>${wDto.rest_name}</td>
					<td>${wDto.wait_num}</td>
					<td>${qDto.wait_team}</td>
				</tr>
			</table>
			<form action="MemberCancelWaiting.foo" method="post" onsubmit="return cancelWaiting()">
				<input type="hidden" name="wait_num" value="${wDto.wait_num}">
				<input type="submit" value="대기 취소" >
			</form>
		</c:if>
		<br> <br> <br>
		<hr>
		<h2>과거 대기 내역</h2> <!-- include 해보기.! 페이징처리 -->
		<c:forEach var="list" items="${queueHistory}">
			<table border="1">
				<tr>
					<td>가게명</td>
					<td>방문일자</td>
				</tr>
				<tr>
					<td>${list.rest_name}</td>
					<td>${list.regdate}</td>
				</tr>
			</table>
			<c:if test="${list.review_check == 1 }">
			<script>
   				var currentDate = new Date();  // 현재 날짜
    			var reviewDate = new Date('${list.regdate}');  // 리뷰 작성 가능한 날짜
    			var threeDaysLater = new Date(reviewDate.setDate(reviewDate.getDate() + 3));  // 리뷰 작성 가능한 날짜로부터 3일 뒤의 날짜

   				if (currentDate <= threeDaysLater) {
      				document.write('<button onclick="winopen(${list.wait_num})">리뷰 작성</button>');
    			} else {
      			// 작성 가능한 날짜 이전이므로 버튼을 비활성화하거나 보여주지 않음
    			}
  			</script>
			</c:if>
			<hr>
		
		</c:forEach>
	</main>
	<!-- main -->


	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->

</body>
</html>