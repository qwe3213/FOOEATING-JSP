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
<link rel="stylesheet" href="css/ownerwait.css">
<link rel="stylesheet" href="css/question.css">

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
<div style="float: left;">
	<jsp:include page="../inc/sideMenuMember.jsp" />
</div>
<!-- sideMenu -->

<!-- main -->
<main>
	<div id="top">
	<div id="category" style="margin: 85px 410px 0 410px; text-align:-webkit-center;">
	<h2 style="margin-bottom: 15px;">리뷰 관리</h2>
	<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id }">
		<c:redirect url="./MemberLogin.foo" />
	</c:if>


	<c:forEach var="dto" items="${reviewList}">
		<div >
		<table border="1" style="text-align: center;">
			
			<tr>
				<td colspan="2">${dto.name }</td>
			</tr>
			<tr>
			<td width="50%">
			
				<c:forEach begin="1" end="${dto.grade }" step="1"> 
					<img src="./img/free-icon-favorite-5379602.png" width="15px">
				</c:forEach>
				<c:forEach begin="1" end="${5-dto.grade  }" step="1"> 
					<img src="./img/free-icon-star-3384828.png" width="15px">
				</c:forEach>
			
			</td>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<td colspan="2">${dto.content }</td>
			</tr>
		</table>
		</div>
		<div style="margin-top: 10px;">
			<div style="float: left; margin-left: 28%;">
				<form action="" method="post">
					<input type="hidden" name="user_id" value="${user_id }"> <input
						type="hidden" name="review_num" id="review_num"
						value="${dto.review_num }">
					<button onclick="winopen(${dto.review_num });" class="btn-2">수정</button>
				</form>
			</div>
			<div style="float: right; margin-right: 28%;">
				<form action="ReviewDelete.foo" method="post"
					onsubmit="return deleteReview()">
					<input type="hidden" name="user_id" value="${user_id }"> <input
						type="hidden" name="review_num" id="review_num"
						value="${dto.review_num }">
					<button class="btn-2" >삭제</button>
				</form>
				<br>
			</div>
		</div>
	</c:forEach>

	
	
<div style=" text-align: center; margin-top: 7%;"> 	
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

		<a class="asdfasdf" href="./MyReview.foo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>

		
		<a class="asdfasdf" href="./MyReview.foo?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


		<a class="asdfasdf" href="./MyReview.foo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>
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



</body>
</html>