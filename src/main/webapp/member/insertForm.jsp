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
<link rel="stylesheet" href="css/question.css">


<title>membership</title>
<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

$(function() {
	$('.errorDiv').css({
		'font-size' : '0.7em',
		'color' : 'red'
	});
	
	
	
	$('#id').keyup(function() {
	
		let id = document.fr.user_id.value;
		let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
		if(regIdPw.test(id)){
		$('#idd').html("");
		
		}else if(!regIdPw.test(id)){
		$('#idd').html("4~12자 영문 대소문자, 숫자만 입력하세요.");	
		$('#idd').css('color', 'red');
		}
		
		$.ajax({
			url:"./IdCheckAction.foo",
			data : {user_id:id},
			success: function(data) {
				if(data ==1 && regIdPw.test(id)){
					$('#idd').html("사용 가능한 아이디 입니다.");	
					$('#idd').css('color', 'green');
					$('#fr').unbind();
				} else if(data ==0 && regIdPw.test(id)){
					$('#idd').html("이미 존재하는 아이디 입니다.");	
					$('#idd').css('color', 'red');
					$("#fr").on("submit", function (e) { 
                        e.preventDefault();
                   });
				}
			
			},
			error : function() {
				alert("서버요청실패");
			}
		});
		
		
		
	});
	
	
	
	$("#fr").on("submit", function (e) { 
		let id = document.fr.user_id.value;
	    let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	    let regIdPw = /^[a-zA-Z0-9]{4,12}$/;
	    let email = document.fr.email.value;
		let regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let name = document.fr.name.value;
		let regName = /^[가-힣a-zA-Z]{2,15}$/;
		let phone = document.fr.phone.value;
		let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		
		  if(!regMail.test(email)){
	     		e.preventDefault();
		  } else if (pw.length < 8 || pw.length > 20) {
	    		e.preventDefault();
		  } else if (pw.search(/\s/) != -1) {
	        	e.preventDefault();
	 	  } else if (number < 0 || english < 0 || spece < 0) {
	    		e.preventDefault();
	  	  } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
	    		e.preventDefault();
	  	  } else if (/(\w)\1\1\1/.test(pw)) {
	    		e.preventDefault();
	  	  } else if (pw.search(id) > -1) {
	    		e.preventDefault();
	  	  } else if(pw != cpw){
		     	e.preventDefault();
	  	  } else if(!regIdPw.test(id)){
		  		e.preventDefault();
		  } else if(!regName.test(name)){
			  e.preventDefault();
		  } else if(!regPhone.test(phone)){
			  e.preventDefault();
		  }
		  
	    });
		
		

	
	
	$('#pw').keyup(function() {
		let id = document.fr.user_id.value;
	    let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	    
	    if (pw.length < 8 || pw.length > 20) {
	    	$(function(){
	    	$('#pwd').html("8자리 ~ 20자리 이내로 입력해주세요.");
	    	});

	    } else if (pw.search(/\s/) != -1) {
	    	$(function(){
	        	$('#pwd').html("비밀번호는 공백 없이 입력해주세요.");
	        });

	    } else if (number < 0 || english < 0 || spece < 0) {
	    	$(function(){
	    		$('#pwd').html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			});

	    } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
	    	$(function(){
	    		$('#pwd').html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			});

	    } else if (/(\w)\1\1\1/.test(pw)) {
	    	$(function(){
	    		$('#pwd').html('같은 문자를 4번 이상 사용하실 수 없습니다.');
			});

	    } else if (pw.search(id) > -1) {
	    	$(function(){
	    		$('#pwd').html("비밀번호에 아이디가 포함되었습니다.");
			});
	    } else{
	    	$(function(){
	    		$('#pwd').html("");
			});
	    }

	});
	
	
	$('#cpw').keyup(function(){
		let pw = document.fr.pw.value;
	    let cpw = document.fr.cpw.value;
		if(pw != cpw){
	     	$('#cpwd').html("비밀번호가 일치하지 않습니다.");
		} else {
			$('#cpwd').html("");
		}
	 	
	});
	
	$('#email').keyup(function(){
		let eamil = document.fr.email.value;
		let regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!regMail.test(eamil)){
	     	$('#emaildiv').html("잘못된 이메일 형식입니다.");
		} else {
			$('#emaildiv').html("");
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
	
	$('#phone').keyup(function(){
		let phone = document.fr.phone.value;
		let regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		if(!regPhone.test(phone)){
	     	$('#phonediv').html("연락처 형식에 맞지 않습니다");
		} else {
			$('#phonediv').html("");
		}
	 	
	});
	
	
	
});

	
		function checkData() {
			let id = document.fr.user_id.value;
			let pw = document.fr.pw.value;
		    let cpw = document.fr.cpw.value;
		    let name = document.fr.name.value;
		    let email = document.fr.email.value;
		    let phone = document.fr.phone.value;
		    
			// 아이디가 입력되어 있는지 체크
			if(id == ""){
				document.fr.user_id.focus();
				return false;
			}
			else if (pw == ""){
				document.fr.pw.focus();
				return false;
		
			}else if (cpw == ""){
				document.fr.cpw.focus();
				return false;
				
			}else if(name == ""){
				document.fr.name.focus();
				return false;
			}else if(email == ""){
				document.fr.email.focus();
				return false;
			}else if(phone == ""){
				document.fr.phone.focus();
				return false;
			} else {
				return true;
			}
			
			
		}
		
		
		 
	
	</script>
	
<style type="text/css">
	.panel {
	border: 1px solid;
	width: 460px;
	height: 530px;
	display: flex;
	justify-content: center;
	align-items: center;
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

<main>
	<div id="top" style="text-align: -webkit-center;"> <!-- ** main -> div id="top" 해주기 ** -->
	
 		<!-- itwill_member 테이블에 저장될 정보를 입력 -->
 		<div class="panel">
 		<fieldset style="margin: 5%; text-align: center;">
 			<legend>회원가입</legend>
 			
 			<!-- action주소가 없으면 자신의 페이지 호출 -->
 			
	 		<form action="./MemberJoinAction.foo" method="post" name="fr" onsubmit="return checkData()" id="fr">
 			 	<div style="text-align: left;">아이디</div>
 			 	<input type="text" name="user_id" maxlength="20" id="id" ><br>
 			 	<div id="idd" class="errorDiv" style="text-align: left;"></div>
 			 	<div style="text-align: left;">비밀번호</div>
 			 	<input type="password" name="pw" maxlength="20" id="pw"><br>
 			 	<div id="pwd" class="errorDiv" style="text-align: left;"></div>
 			 	<div style="text-align: left;">비밀번호 재확인</div>
 			 	<input type="password" name="cpw" maxlength="20" id="cpw"><br>
 			 	<div id="cpwd" class="errorDiv" style="text-align: left;"></div>
 			 	<div style="text-align: left;">이름</div>
 			 	<input type="text" name="name" id="name"><br>
 			 	<div id="namediv" class="errorDiv" style="text-align: left;"></div>
 			 	<div style="text-align: left;">이메일</div>
 			 	<input type="email" name="email" id="email"><br>
 			 	<div id="emaildiv" class="errorDiv" style="text-align: left;"></div>
 			 	<div style="text-align: left;">휴대전화</div>
 			 	<input type="text" name="phone" id="phone"><br>
 			 	<div id="phonediv" class="errorDiv" style="text-align: left;"></div>       
 			 	<hr>      
 			 	<input class="btn-2" type="submit" value="회원가입">
 			 	
 		
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