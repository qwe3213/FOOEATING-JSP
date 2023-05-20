<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="css/question.css">

<link href="./css/sideMenu.css" rel="stylesheet">

<script type="text/javascript">
	function winopen(menuNum){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
	
		window.open("OwnerMenuUpdate.on?menuNum="+menuNum+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
		}
	
	function winopen2(rest_id){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
	
		window.open("OwnerMenuAdd.on?rest_id="+rest_id+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
		}
	
	function deleteMenu() {
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
  		 return true;
		} else {
  		 alert('삭제가 취소되었습니다.');
  	 	return false;
		}	
	}

</script>

<title>Insert title here</title>
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
<div style="float: left">
	<jsp:include page="../inc/sideMenuOwner.jsp" />
</div>
<!-- sidemenu -->

<!-- main -->
<main>
<div id="top">
	<div id="category" style="margin: 85px 0 0 410px;">
 			<h2> FOOEATING 가게 메뉴 정보</h2>
 			
 			<c:forEach var="list"  items="${menuList }">
			<table border="1">
				<tr>
					<td>
					<img src="./upload/${list.menufile}" width="100px" height="150px"><br>
					${list.menu_name }<br>
					${list.price }<br>
					${list.menu_descriptions }<br>
					</td>
				</tr>
			</table>
			<button class="btn-2" onclick="winopen(${list.rest_menu_num})">메뉴 수정</button>
			<form action="./OwnerMenuDelete.on" method="post"
				onsubmit="return deleteMenu()">
				<input type="hidden" name="rest_menu_num" id="rest_menu_num"
					value="${list.rest_menu_num }">
				<button class="btn-2">삭제</button>
			</form>
			</c:forEach>
			<c:if test="${fn:length(menuList)< 3 }">
			<hr>
			
			<button class="btn-2" onclick="winopen2(${menuList[0].rest_id});">메뉴 추가</button>
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