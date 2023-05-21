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
<link href="./css/sideMenu.css" rel="stylesheet">
<link rel="stylesheet" href="css/ownerwait.css">


<title>회사소개</title>
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


<!-- header -->
	<jsp:include page="../inc/headerDiv.jsp" />
<!-- header -->

<!-- sideMune -->
<div style="float: left;">
	<jsp:include page="../inc/sideMenuNotice.jsp" />
</div>
<!-- side menu -->

<!-- main -->
<main>
<div id="top">
	<div id="category" style="margin: 85px 250px 0 410px; min-width: 800px;">

	<div style="text-align: center;">
		<h1>푸이팅</h1>
		<p>푸이팅은 수많은 SME와 창작자, 파트너들이 미래 기술을 활용해 글로벌 시장에서 더 큰 성장을 이룰 수 있도록
			지원하는 글로벌 테크 플랫폼입니다.</p>
			<img src="./img/logo.png">
		<div>
		<table class="type03">
			<tr>
				<th style="color: white; background: #fb5849;">FOOEATING</th>
				<td>푸이팅(주)는 글로벌 ICT 기업으로서 한국 최소 대기 시스템을 서비스하고 있고 줄 서기는 싫지만 맛있는
					음식들을 먹고 싶어 하는 분들을 위해 서비스를 운영하고 있습니다. 또한 지속적인 개발을 통하여 수많은 이용자들을 위해
					더욱더 편리하게 사용할 수 있도록 노력하고 있습니다.</td>
			</tr>
		</table><br>
		<table class="type04" style="text-align-last: center;">
			<tr>
				<th style="color: white; background: #fb5849;">설립연도</th>
				<td>2023년 5월</td>
			</tr>
			<tr>
				<th style="color: white; background: #fb5849;">주요 서비스</th>
				<td>온라인 검색포털</td>
			</tr>
			<tr>
				<th style="color: white; background: #fb5849;">주요 사업</th>
				<td>온라인 웨이팅 사업</td>
			</tr>
			<tr>
				<th style="color: white; background: #fb5849;">매출액</th>
				<td>0원(2023)</td>
			</tr>
			<tr>
				<th style="color: white; background: #fb5849;">전체인력</th>
				<td>8명(2023년 기준)</td>
			</tr>
		</table><br><br>
		</div>
	</div>
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