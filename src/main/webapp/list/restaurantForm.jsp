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


<title>Post detail page</title>
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

<!-- main -->
<main>
<br><br>
		<h1>상세페이지</h1>
		
		<table border="1">
		<tr>
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
		<tr>
			<th>조회수</th>
			<td>${restForm.read_count}</td>
		</tr>
	</table>
	
	<br>
	
	<hr>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>외관사진</th>			
			<th>평점</th>
			<th>내용</th>
			<th>등록일</th>
		</tr>
		
		<c:forEach var="re" items="${requestScope.re }" varStatus="no">
	
		<tr>
			<td>${no.count}</td>
			<td>${re.user_id}</td>
			<td>${re.file}</td>
			<td>${re.grade}</td>
			<td>${re.content}</td>
			<td>${re.regdate}</td>


		</tr>
		</c:forEach>
	</table>
	
	
	
<%-- 	${wdto.user_id} ${wdto.rest_id} ${wdto.wait_num} <br> --%>
<%-- 	${sessionScope.user_id} ${restForm.rest_id} --%>
	
	<c:if test="${restForm.on_off == true}">
		<c:if test="${!wdto.rest_id.equals(restForm.rest_id) && !wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen1('${restForm.rest_id}');">대기하기</button>
		</c:if>
		
		<c:if test="${wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen2();">대기하기</button>
		</c:if>
	</c:if>
	<c:if test="${restForm.on_off == false}">
		<button>영업 준비 중입니다...(T^T)</button>
	</c:if>
	
	
	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
	<br>
	<br>
	<br>
		<c:choose>
			<c:when test="${!empty user_id && heart_check ==1}">
				<img id="heart" src="./img/fullheart.png" class="full_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:when test="${empty user_id}">
				<img id="heart" src="./img/emptyheart.png" class="empty_heart_login" onclick="moveLogin();" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:otherwise>
				<img id="heart" src="./img/emptyheart.png" class="empty_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:otherwise>
		</c:choose>
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