<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- css파일 -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/ownerwait.css">

<link href="./css/sideMenu.css" rel="stylesheet">

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

<!-- ***** Preloader Start ***** --> <!-- !!가운데 로딩 점!! -->
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<!-- ***** Preloader End ***** -->


<!-- ***** Header Area Start ***** -->
	<jsp:include page="../inc/headerDiv.jsp" />
<!-- ***** Header Area End ***** -->

<!-- sideMune -->
<div style="float: left;">
<jsp:include page="../inc/sideMenuDiv.jsp" />
<jsp:include page="../inc/sideMenuMember.jsp" />
</div>
<!-- sideMune -->

<!-- main -->
<main>
<div id="top">
	<div id="category" style="margin: 85px 410px 0 410px; text-align:-webkit-center;">
		<!-- 유저 로그인 제어 -->
		<c:if test="${empty user_id }">
			<c:redirect url="./MemberLogin.foo" />
		</c:if>

		<c:if test="${empty wDto.wait_num }">
		 현재 줄서기 중인 가게가 없습니다!
		</c:if>
		<c:if test="${!empty wDto.wait_num }">
			<h2>대기 중인 가게</h2>
			<br>
			<table border="1">
				<thead>
				<tr>
					<th>가게명</th>
					<th>나의 대기번호</th>
					<th>남은 팀 수</th>
				</tr>
				</thead>
				<tr>
					<td><a href="./restaurantForm.fd?rest_id=${wDto.rest_id}">${wDto.rest_name}</a></td>
					<td>${wDto.wait_num}</td>
					<td>${qDto.wait_team}</td>
				</tr>
			</table>
			<form action="./MemberCancelWaiting.foo" method="post" onsubmit="return cancelWaiting()">
				<input type="hidden" name="wait_num" value="${wDto.wait_num}">
				<input type="submit" value="대기 취소" class="btn-2" style="background-color: #ff4742;
																			color: #fff;
																			border: none;
																			border-radius: 10px;
																			font-size:medium;
																			font-weight: bold;
																			margin-top: 10px;">
			</form>
		</c:if>
		<br> <br> <br>
		
		<!-- 과거 대기 내역 -->
		<jsp:include page="memberWaitingBeforeList.jsp" />
	</div>	
</div>
</main>
<!-- main -->


<!-- ***** Footer Start ***** -->
	<jsp:include page="../inc/footerDiv.jsp" />
<!-- ***** Footer End ***** -->

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script> 
<script src="assets/js/slick.js"></script> 
<script src="assets/js/lightbox.js"></script> 
<script src="assets/js/isotope.js"></script> 

<!-- Global Init -->
<script src="assets/js/custom.js"></script>
<script>
    $(function() {
        var selectedClass = "";
        $("p").click(function(){
        selectedClass = $(this).attr("data-rel");
        $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("."+selectedClass).fadeOut();
        setTimeout(function() {
          $("."+selectedClass).fadeIn();
          $("#portfolio").fadeTo(50, 1);
        }, 500);
            
        });
    });
</script>


</body>
</html>