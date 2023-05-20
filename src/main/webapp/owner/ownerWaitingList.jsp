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

<!-- javaScript -->
<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('waitlist');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}


function winopen(wait_num){  
	let popupX = (window.screen.width / 2) - (500 / 2);
	let popupY= (window.screen.height / 2) - (300 / 2);
	
	window.open("OwnerWaitingListPopup.on?wait_num=" + wait_num, "", 
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

<!-- sidemenu -->
<div style="float: left;">
	<jsp:include page="../inc/sideMenuOwner.jsp" />
</div>
<!-- sidemenu -->


<!-- main -->
<main>
<div id="top">
<div id="category" style="margin: 85px 0 0 410px; 	">
	<c:set var="wait_num" value="${dto.wait_num }" />
	<table>
	<thead>
		<tr>
			<th>대기 번호</th>
			<th>회원 이름</th>
			<th>전화번호</th>
			<th>인원수</th>
			<th>대기 등록 시간</th>
			<th>완료</th>
		</tr>
		</thead>
		<c:forEach var="dto" items="${requestScope.waitingList }">
			<c:if test="${dto.status == 1 }">
			<tr>
				<td>${dto.wait_num }</td>
				<td>${dto.name }</td>
				<td>${dto.phone }</td>
				<td>${dto.people }</td>
				<td>${dto.regdate }</td>
				<td><button  onclick="winopen('${dto.wait_num}');" 
				style="background-color: #fd9991;
			    color: #fff;
			    border: none;
			    border-radius: 10px;
			    font-size:medium;
			    font-weight: bold;"
				>완료</button></td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
<div style="text-align: center; "> 
<br><br><br>
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

				<a href="./OwnerWaitingList.on?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


				<a href="./OwnerWaitingList.on?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


				<a href="./OwnerWaitingList.on?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
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