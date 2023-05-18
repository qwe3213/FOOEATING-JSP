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


<title>Login</title>

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

// ID & PW 유효성 체크
$(document).ready(function(){
	
	$(document).ready(function(){
	    $('div').css({
	        'font-size' : '0.7em',
	        'color' : 'red'
	    });
	    
	     $("#fr").on("submit", function(e) {
	         if(fr.user_id.value ==""){
	             e.preventDefault();
	             $('#divid').html("아이디를 입력하세요.");
	         } else{
	             $('#divid').html("");
	         }
	         
	         if(fr.pw.value ==""){
	             e.preventDefault();
	             $('#divpw').html("비밀번호를 입력하세요.");
	         } else{
	             $('#divpw').html("");
	         }
	         
	     }); 
	});
	
});

</script>

<style type="text/css">
	.panel { border: 1px solid;
		width: 460px;
		height: 257px;
		display: flex;
		justify-content: center;
		align-items: center;
		
	}
	
#input_row {
    display: table;
    table-layout: fixed;
    width: 100%;
    padding: 14px 17px 13px;
    box-sizing: border-box;
}

.input_text {
    position: relative;
    display: block;
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    line-height: 19px;
    letter-spacing: -.5px;
    color: #222;
    box-sizing: border-box;
    z-index: 4;
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

<h1>LOGIN</h1>

<main>
	<div id="top"> <!-- ** main -> div id="top" 해주기 ** -->
		<div class= "panel">
		<fieldset style="margin: 5%; text-align: center;">
			<legend>FOOEATING 로그인</legend>
			
			<form action="./MemberLoginAction.foo" id="fr" method="post" >
				<div id="input_row">
				<input type="text" id="id" name="user_id" class="input_text" placeholder="아이디"> <br>
				<div id="divid"></div>
				<input type="password" id="pw" name="pw" class="input_text" placeholder="비밀번호"> <br>
				<div id="divpw"></div>
				</div>
				<hr>
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='./MemberJoin.foo';">
			</form>
			
		</fieldset>
		</div>
	</div> <!-- ***** Main End ***** -->
</main>

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