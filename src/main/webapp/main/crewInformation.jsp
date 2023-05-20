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
<link rel="stylesheet" href="css/ownerwait.css">

<title>직원소개</title>
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

<!-- sideMune -->
<div style="float: left;">
	<jsp:include page="../inc/sideMenuNotice.jsp" />
</div>
<!-- side menu -->

<!-- main -->
<main>
<div id="top">
	<div id="category" style="margin: 85px 250px 0 410px;">
	
	<h2>직원소개</h2><br>
	<table>
		<thead>
			<tr>
				<th width="140px" style="text-align: center;">이름</th>
				<th width="140px" style="text-align: center;">사진</th>
				<th style="text-align: center;">특성</th>
			</tr>
		</thead>
			<tr>
					<td style="text-align: center;">박언효</td>
					<td style="text-align: center;"><img src="./img/team4jo/uh.png" width="70px" height="70px"></td>
					<td>코드 구현의 대부분을 맡으심 그러다보니 30초마다 빡이 치심... 탈모조심해요 형.. </td>
			</tr>
			<tr>
					<td style="text-align: center;">김태령</td>
					<td style="text-align: center;"><img src="./img/team4jo/tr.png" width="70px" height="70px"></td>
					<td>팀장님답게 팀원을 잘이끌어주신다(가끔) 그러나 자기할말만하며 다른 사람의 의견은 듣기는 잘들어주는데 10초뒤 까먹는다. 걍듣지마라;; </td>
			</tr>
			<tr>
					<td style="text-align: center;">정창원</td>
					<td style="text-align: center;"><img src="./img/team4jo/cw.png" width="70px" height="70px"></td>
					<td>4조중에서 제일 재미있으신 형님! 그러나 요즘 주춤하더니 기리형에게 따잇당함.  </td>
			</tr>
			<tr>
					<td style="text-align: center;">이소라</td>
					<td style="text-align: center;"><img src="./img/team4jo/sr.png" width="70px" height="70px"></td>
					<td>이분도 코드구현의 대부분에 손을 담으심. 말걸면 맨날바쁘다함. 감정기복이 심하여 DB수정얘기를하면 화냄...  </td>
			</tr>
			<tr>
					<td style="text-align: center;">윤선길</td>
					<td style="text-align: center;"><img src="./img/team4jo/sg.png" width="70px" height="70px"></td>
					<td>하나에 꽂히면 끝까지 죽어라팜 그 결과 제일 힘든 기능 구현 성공 및 css 개고수가됨.  그러나 그러고 없어짐.  </td>
			</tr>
			<tr>
					<td style="text-align: center;">정하윤</td>
					<td style="text-align: center;"><img src="./img/team4jo/hy.png" width="70px" height="70px"></td>
					<td>묵묵히 자기에게 주어진일을 성실히 수행함. 아주 훌륭함! </td>
			</tr>
			<tr>
					<td style="text-align: center;">김혜진</td>
					<td style="text-align: center;"><img src="./img/team4jo/hj.png" width="70px" height="70px"></td>
					<td> 표정으로 대답을함 대부분의 답은 싫어임.. 너무 냉정함 T99인듯. </td>
			</tr>
				<tr>
					<td style="text-align: center;">이도희</td>
					<td style="text-align: center;"><img src="./img/team4jo/dh.png" width="70px" height="70px"></td>
					<td> 아멘  </td>
			</tr>
	</table><br><br>
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