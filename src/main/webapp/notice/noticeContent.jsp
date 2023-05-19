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


<title>FOOEATING - Notice</title>
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

<!-- sideMenu -->
<div style="float: left;">
	<jsp:include page="../inc/sideMenuNotice.jsp" />
</div>
<!-- sideMenu -->

<!-- main -->
<main>
<div id="top">
<div id="category" style="margin: 85px 0 0 410px;">
<table border="1">
	<tr>
		<th>No</th>
		<td>${dto.notice_num}</td>
		<th>제목</th>
		<td>${dto.subject }</td>
		<th>작성일</th>
		<td>${dto.regdate }</td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
		<td colspan="6">${dto.content }</td>
	</tr>
</table>


<!-- dto 객체 저장 -->
<c:set var="dto" value="${dto }" scope="request"/>





<!-- 모두 가능 -->
<input type="button" value="목록으로" onclick="location.href='./NoticeList.foo?pageNum=${pageNum}';">

<!-- 관리자만 가능 -->
<c:if test="${user_id.equals('real_admin') }" >
	<form action="./NoticeUpdateAction.foo?pageNum=${pageNum }&notice_num=${dto.notice_num }" method="post">
		<input type="hidden" name="dto" value="${dto }">
		<input type="submit" value="수정하기">
	</form>
	
	<form action="./NoticeDeleteAction.foo?pageNum=${pageNum }&notice_num=${dto.notice_num }" method="post">
		<input type="hidden" value="${dto }">
		<input type="submit" value="삭제하기" >
	</form>
</c:if>
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