<%@page import="java.util.List"%>
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

<script type="text/javascript">
	function deleteReview() {
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
	  	 return true;
		}
		else {
	  	 alert('삭제가 취소되었습니다.');
	  	 return false;
		}	
	}
	
	function winopen(review_num){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
		
		window.open("ReviewUpdate.foo?review_num="+review_num+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		
	}
	
</script>

<style type="text/css">
fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
fieldset legend{
    text-align: right;
}
input[type=radio]{
    display: none;
}
label{
    font-size: 1em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
label:check{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* #myform label:hover ~ label{ */
/*     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); */
/* } */
input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}


</style>


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

<!-- sideMenu -->
	<jsp:include page="../inc/sideMenuMember.jsp" />
<!-- sideMenu -->

<!-- main -->
<main>
	<div id="top">
	<div id="category" style="margin: 85px 0 0 410px;">
	<h1>리뷰 관리</h1>
	<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id }">
		<c:redirect url="./MemberLogin.foo" />
	</c:if>


	<c:forEach var="dto" items="${reviewList}">
		<table border="1">
			<tr>
				<td colspan="2">${dto.name }</td>
			</tr>
			<tr>
				<td>
				<fieldset>
				<input type="radio" name="grade" value="5" disabled id="rate1"  
					<c:if test="${dto.grade == 5 }"> checked </c:if>
				><label
					for="rate1">★</label>
				<input type="radio" name="grade" value="4" disabled id="rate2" 
					<c:if test="${dto.grade == 4 }"> checked </c:if>
				><label
					for="rate2">★</label>
				<input type="radio" name="grade" value="3" disabled id="rate3" 
					<c:if test="${dto.grade == 3 }"> checked </c:if>
				><label
					for="rate3">★</label>
				<input type="radio" name="grade" value="2" disabled id="rate4" 
					<c:if test="${dto.grade == 2 }"> checked </c:if>
				><label
					for="rate4">★</label>
				<input type="radio" name="grade" value="1" disabled id="rate5" 
					<c:if test="${dto.grade == 1 }"> checked </c:if>
				><label
					for="rate5">★</label>
			</fieldset>
			</td>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<td colspan="2">${dto.content }</td>
			</tr>

		</table>
		<form action="" method="post">
			<input type="hidden" name="user_id" value="${user_id }"> <input
				type="hidden" name="review_num" id="review_num"
				value="${dto.review_num }">
			<button onclick="winopen(${dto.review_num });">수정</button>
		</form>

		<form action="ReviewDelete.foo" method="post"
			onsubmit="return deleteReview()">
			<input type="hidden" name="user_id" value="${user_id }"> <input
				type="hidden" name="review_num" id="review_num"
				value="${dto.review_num }">
			<button>삭제</button>
		</form>

	</c:forEach>
	
	
	
<!-- 페이징처리 -->
<%
int count = (int)request.getAttribute("count");
int pageSize = (int)request.getAttribute("pageSize");
int currentPage = (int)request.getAttribute("currentPage");
String pageNum = (String)request.getAttribute("pageNum");

if(count != 0) {
	int pageBlock = 5;
	int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
	int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	
	if(startPage > pageBlock) {
%>

		<a href="./MyReview.foo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


		<a href="./MyReview.foo?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


		<a href="./MyReview.foo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>
	
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



</body>
</html>