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

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

	$(function() {
		$('.errorDiv').css({
			'font-size' : '0.7em',
			'color' : 'red'
		});
		
		$('#phone').keyup(function(){
			let phone = document.fr.phone.value;
			let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			if(!regPhone.test(phone)){
		     	$('#phonediv').html("연락처 형식에 맞지 않습니다");
			} else {
				$('#phonediv').html("");
			}
		 	
		});
		
		$('#name').keyup(function(){
			let name = document.fr.name.value;
			let regName = /^[가-힣a-zA-Z]{2,15}$/;
			if(!regName.test(name)){
		     	$('#namediv').html("최소 2글자 이상, 한글과 영어만 입력하세요.");
			} else {
				$('#namediv').html("");
			}
		 	
		});
		
		$("#fr").on("submit", function (e) { 
			let name = document.fr.name.value;
			let regName = /^[가-힣a-zA-Z]{2,15}$/;
			let phone = document.fr.phone.value;
			let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			
			if(!regName.test(name)){
				  e.preventDefault();
			} else if(!regPhone.test(phone)){
				  e.preventDefault();
			}
			
		});
		
		
	});

		function checkData() {
			
			// 아이디가 입력되어 있는지 체크
			
			if(document.fr.pw.value == ""){
				alert(" 비밀번호를 입력하시오!");
				document.fr.pw.focus();
				return false;
			}
			
		}
		
		function winopen(){
			let popupX = (window.screen.width / 2) - (500 / 2);
			let popupY= (window.screen.height /2) - (300 / 2);
			
			window.open("ChangePw.foo","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			
		}
		
		function winopen2(){
			let popupX = (window.screen.width / 2) - (500 / 2);
			let popupY= (window.screen.height /2) - (300 / 2);
			
			window.open("MemberDelete.foo","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			
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

	<jsp:include page="../inc/sideMenuDiv.jsp" />
<c:choose>
	<c:when test="${user_id.equals(owner_user_id) }" >
		<jsp:include page="../inc/sideMenuOwner.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../inc/sideMenuMember.jsp" />
	</c:otherwise>
</c:choose>
<!-- sideMenu -->


<!-- main -->
<main>
	<div id="top">
 		<!-- 로그인 세션 제어 -->
	<c:if test="${empty user_id }" >
		<c:redirect url="./MemberLogin.foo"/>
	</c:if>
 		
 		<br><br>
 		<fieldset>
 			<legend>FOOEATING 회원 정보 수정</legend>
 			
	 		<form action="./MemberUpdateProAction.foo" method="post" name="fr" onsubmit="return checkData();" id="fr">
 			 	아이디 : <input type="text" name="user_id" value="${dto.user_id }" readonly="readonly"><br>
 			 	비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
 			 	<input type="button" value="비밀번호 변경" onclick="winopen()"><br>
 			 	이름 : <input type="text" name="name" value="${dto.name }" id="name"><br>
 			 	<div id="namediv" class="errorDiv"></div>
 			 	이메일 : <input type="email" name="email" value="${dto.email }" readonly="readonly"><br>
 			 	휴대전화 : <input type="text" name="phone" value="${dto.phone }" id="phone"> 
 			 	<div id="phonediv" class="errorDiv"></div>       
 			 	<hr>      
 			 	<input type="submit" value="회원정보 수정">
 			 	<input type="button" value="회원 탈퇴" onclick="winopen2()"><br>
 		
 		
 			</form>
 		</fieldset>
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