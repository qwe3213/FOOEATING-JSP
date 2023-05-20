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

<title> FAQ </title>
<script src="./js/jquery-3.6.4.js"></script>

<style type="text/css">
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	top: '50%';
	left: '50%';
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#list {
    font-size: 13px;
    color: #fb5849;
    background-color: white;
    padding: 12px 25px;
    display: inline-block;
    border-radius: 60px;
    font-weight: 600;
    transition: all .3s;
    }
.alinkstyle {
	color: #fff;
	background: #fd9991;
    border: none;
	border-radius: 10px;
	font-size: medium;
    font-weight: bold;
    display: inline-block;
    width: 75px;
    height: 25px;
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

<!-- sideMune -->
<div style="float: left;">
	<jsp:include page="../inc/sideMenuNotice.jsp" />
</div>
<!-- sideMenu -->

<!-- main -->
<main>
	<div id="top">
		<div id="category" style="margin: 85px 0 0 410px; min-width: 75%;">
		<div style="float: left;">
			<h1>F A Q</h1>
			<h3>카테고리</h3>
		</div>
		
		<div>
		<ul style="margin-top: 30px; padding-top:40px;">
			<li style="float: left; list-style: none; margin: 15px 40px 15px 40px; padding-left: 10%;">
				<a class="alinkstyle" href="#" title="all" style="text-align: center;">전체보기</a></li>
			<li style="float: left; list-style: none; margin: 15px 40px 15px 40px">
				<a class="alinkstyle" href="#" title="계정관리" style="text-align: center;">계정관리</a></li>
			<li style="float: left; list-style: none; margin: 15px 40px 15px 40px">
				<a class="alinkstyle" href="#" title="도용보안" style="text-align: center;">도용보안</a></li>
			<li style="float: left; list-style: none; margin: 15px 40px 15px 40px">
				<a class="alinkstyle" 	href="#" title="예약" style="text-align: center;">예약</a></li>
<!-- 				<li style="float: left; list-style: none; margin: 2%"><a href="#" title="d" style="text-align: center;">4번</a></li> -->
		</ul>
		</div>
		
		<div style="padding: 110px 10% 110px 55px">
			<!-- 첫 번째 Modal을 여는 클래스 -->
			<c:forEach var="dto" items="${faqList }">
				<div id="list" style="float:left; margin: 0 2% 1% 0; width: 258px; height: 100px; ">
					<ul>
						<li class="${dto.category}" style="padding-bottom: 10%;">
							<h6 class="btn" style="font-size: 15px; color: #fb5849; background-color: #fff; padding: 12px 25px; font-weight: 600; border-radius: 75px;">Q.${dto.subject }</h6>
						</li>
					</ul>
				</div>
				<!-- 첫 번째 Modal -->
				<div class="modal">
	
					<!-- 첫 번째 Modal의 내용 -->
					<div class="modal-content">
						<span class="close" style="text-align: right;">&times;</span>
						<p style="text-align: center;">${dto.content }</p>
					</div>
				</div>
			</c:forEach>
		</div>
		

		</div>
	</div>
</main>
<!-- main -->

</body>

<script type="text/javascript">
	//Modal을 가져옵니다.
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("btn");
	// Modal을 닫는 close 클래스를 가져옵니다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];

	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
		return function() {
			// 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
			btns[num].onclick = function() {
				modals[num].style.display = "block";
				console.log(num);
				document.body.style.overflow = 'hidden';
			};

			// <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
			spanes[num].onclick = function() {
				modals[num].style.display = "none";
				document.body.style.removeProperty('overflow');
			};
		};
	}

	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
	for (var i = 0; i < btns.length; i++) {
		funcs[i] = Modal(i);
	}

	// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
	for (var j = 0; j < btns.length; j++) {
		funcs[j]();
	}

	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
		if (event.target.className == "modal") {
			event.target.style.display = "none";
			document.body.style.removeProperty('overflow');
		}
	};
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#category a").click(function(e) {
			e.preventDefault();
			var category = $(this).attr("title");
			$("#list li").fadeOut("slow");
			if (category == "all") {
				$("#list li").fadeIn("slow");
			} else {
				$("#list li[class*=" + category + "]").fadeIn("slow");
			}
		});
	});
</script>


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