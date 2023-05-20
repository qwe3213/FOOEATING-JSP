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
<jsp:include page="../inc/sideMenuAdmin.jsp" />
<!-- sideMune -->

<!-- main -->
<main>
	<div id="top">
	<table border="1">
		<tr>
			<th>No.</th>
			<th>상호명</th>
			<th>업종</th>
			<th>점주 아이디</th>
			<th>전화번호</th>
			<th>등록일</th>
			<th>승인/반려</th>
			<th>상세</th>
		</tr>
		
		<c:forEach var="dto" items="${restWaitList}">
		<tr>
			<td>${dto.rno}</td>
			<td>${dto.name}</td>
			<td>${dto.category}</td>
			<td>${dto.owner_user_id}</td>
			<td>${dto.rest_tel}</td>
			<td>${dto.regdate}</td>
			<td>
				<button type="submit" onclick="winopen('${dto.rest_id}');">승인/반려</button>
			</td>
			<td>
				<form action="./RestaurantInfo.ad" method="post">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="rest_id" value="${dto.rest_id}">
					<input type="hidden" name="rstatus" value="no">
					<input type="submit" value="상세보기">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
	
		<%
		int count = (int)request.getAttribute("count");
		int pageNum = Integer.parseInt((String)request.getAttribute("pageNum"));
		int pageSize = (int)request.getAttribute("pageSize");
		
		if(count != 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > pageBlock) {
	%>
				<a href="./RestaurantWaitList.ad?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
			}
			for(int i = startPage; i <= endPage; i++) {
	%>
				<a href="./RestaurantWaitList.ad?pageNum=<%=i%>">[<%=i%>]</a>
	<%
			}
			if(endPage < pageCount) {
	%>
				<a href="./RestaurantWaitList.ad?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
			}
		}
	%>
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