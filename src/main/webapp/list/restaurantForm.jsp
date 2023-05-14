<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="./css/header.css" rel="stylesheet">
<script src="./js/jquery-3.6.4.js"></script>
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
	
	function moveLogin() {
		alert("로그인이 필요한 기능입니다!")
		location.href = "./MemberLogin.foo";
	}
	
	function heart_check(user_id, rest_id) {
		
		if($('img').attr('class') == "empty_heart" ){
		
			$.ajax({
				url:"./RestaurantInfoHeartAdd.fd",
				data : {
					user_id:user_id, 
					rest_id:rest_id,
					},
				success: function(data) {
					$('img').attr("src", "./img/fullheart.png");
					$('img').attr("class", "full_heart");
					
					$('.heartNo').html(data);
					
				},
				error : function() {
					alert("서버요청실패");
				}
				
			});
			
			} else if($('img').attr('class') == "full_heart" ){
					
					$.ajax({
						url:"./RestaurantInfoHeartRemove.fd",
						data : {
							user_id:user_id, 
							rest_id:rest_id,
							},
						success: function(data) {
							$('img').attr("src", "./img/emptyheart.png");
							$('img').attr("class", "empty_heart");
							
							$('.heartNo').html(data);
							
						},
						error : function() {
							alert("서버요청실패");
						}
						
			});
		
		}
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
			<td rowspan="8"></td>
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
	
<%-- 	${sessionScope.wdto.user_id} ${sessionScope.wdto.rest_id} ${sessionScope.wdto.wait_num} <br> --%>
	
	<c:if test="${wdto == null}">
		<button onclick="winopen1('${restForm.rest_id}');">대기하기</button>
	</c:if>
	
	<c:if test="${wdto != null}">
		<button onclick="winopen2();">대기하기</button>
	</c:if>
	
	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
	<br>
	<br>
	<br>
		<c:choose>
			<c:when test="${!empty user_id && heart_check ==1}">
				<img src="./img/fullheart.png" class="full_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="20" height="20">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:when test="${empty user_id}">
				<img src="./img/emptyheart.png" class="empty_heart_login" onclick="moveLogin();" width="20" height="20">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:otherwise>
				<img src="./img/emptyheart.png" class="empty_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="20" height="20">
				<div class="heartNo">${heartNo }</div> 
			</c:otherwise>
		</c:choose>
	
</body>
</html>