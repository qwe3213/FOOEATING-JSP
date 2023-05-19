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
<link rel="stylesheet" href="css/sideMenuright.css">

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
		
		if($('#heart').attr('class') == "empty_heart"){
		
			$.ajax({
				url:"./RestaurantInfoHeartAdd.fd",
				data : {
					user_id:user_id, 
					rest_id:rest_id,
					},
				success: function(data) {
					$('#heart').attr("src", "./img/fullheart.png");
					$('#heart').attr("class", "full_heart");
					
					$('.heartNo').html(data);
				},
				error : function() {
					alert("서버요청실패");
				}
			});
			
			} else if($('#heart').attr('class') == "full_heart" ){
					
					$.ajax({
						url:"./RestaurantInfoHeartRemove.fd",
						data : {
							user_id:user_id, 
							rest_id:rest_id,
							},
						success: function(data) {
							$('#heart').attr("src", "./img/emptyheart.png");
							$('#heart').attr("class", "empty_heart");
							
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
<div style="margin-top: 190px">

	
	<div class="container">
	<aside id="left-sidebar"></aside>

		<h1 class="restname" style="padding-top: 80px">${restForm.name}

		</h1>

		<th>&#128065</th>
		<td>&nbsp;${restForm.read_count}&nbsp;</td>
		<th>&nbsp;&#128150&nbsp;</th>
		<td>&nbsp;
		<c:choose>
			<c:when test="${!empty user_id && heart_check == 1}">
				<img id="heart" src="./img/fullheart.png" class="full_heart" onclick="heart_check('${user_id}','${restForm.rest_id }');" width="40" height="40">
				<span class="heartNo">${heartNo }</span> 
			</c:when>
			<c:when test="${empty user_id}">
				<img id="heart" src="./img/emptyheart.png" class="empty_heart_login" onclick="moveLogin();" width="40" height="40">
				<span class="heartNo">${heartNo }</span> 
			</c:when>
			<c:otherwise>
				<img id="heart" src="./img/emptyheart.png" class="empty_heart" onclick="heart_check('${user_id}','${restForm.rest_id }');" width="40" height="40">
				<span class="heartNo">${heartNo }</span> 
			</c:otherwise>
		</c:choose>
		&nbsp;</td>
		<th>&nbsp;&#9997</th>
		<td>&nbsp;${reviewCount }&nbsp;</td>
		


	<hr>
	
	
		<table style="border-collapse: separate; border-spacing: 11px;">
<%-- 			<caption>레스토랑 상세정보</caption> --%>
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
					<th>휴일</th>
					<td>${restForm.dayoff}</td>
			</tr>
		</table>	

<hr>

			<th>메뉴</th>
			<td></td>




			<th>가게 공지사항</th>
			<td>${restForm.rest_notice}</td>





	
	<hr>
	

		<tr>
		<c:forEach var="re" items="${requestScope.re }" varStatus="no">
			<th>번호</th> &nbsp <td>${no.count}</td>
			<th>아이디</th> &nbsp <td>${re.user_id}</td>
			<th>외관사진</th> &nbsp <td>${re.file}</td>		
			<th>평점</th> &nbsp <td>${re.grade}</td>
			<th>내용</th> &nbsp <td>${re.content}</td>
			<th>등록일</th> &nbsp <td>${re.regdate}</td>
			<hr>
		</c:forEach>
		</tr>
		
<!-- 	</tbody> -->
	
	
	
<%-- 	${wdto.user_id} ${wdto.rest_id} ${wdto.wait_num} <br> --%>
<%-- 	${sessionScope.user_id} ${restForm.rest_id} --%>
	
		 
		
		
		<th>FACILITIES</th> <br>
		
		<div class="flacticon">
			

			<c:if test="${restForm.convenience.split(',')[0] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[0]}.png" style="width: 65px; height: 65px;" class="fic" >
			</c:if>

			<c:if test="${restForm.convenience.split(',')[1] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[1]}.png" style="width: 65px; height: 65px;" class="fic">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[2] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[2]}.png" style="width: 65px; height: 65px;" class="fic">
			</c:if>

			<c:if test="${restForm.convenience.split(',')[3] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[3]}.png" style="width: 65px; height: 65px;" class="fic">
			</c:if>

			<c:if test="${restForm.convenience.split(',')[4] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[4]}.png" style="width: 65px; height: 65px;" class="fic">
			</c:if>

			<c:if test="${restForm.convenience.split(',')[5] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[5]}.png" style="width: 65px; height: 65px;">
			</c:if>

			
			
<%-- 			<td>${restForm.convenience.split(",")[0]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[1]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[2]}</td> --%>
			
		</div>
	<hr>
	
	<div class="location">
	<th>LOCATION</th>
	</div>
		<div style="text-align: -webkit-center;">
		<div id="map" class="myDiv" style="width:100%;height:400px; margin-top: 40px;">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818dd4a57e9e35bee82d5b6284cabfe5&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.1584952142483, 129.06199399191797)// 지도의 중심좌표
//         level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성 
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색
geocoder.addressSearch(' ${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc} ', function(result, status) {
	
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${restForm.name}</div>'
        });
        infowindow.open(map, marker);
        

        // 지도의 중심을 결과값으로 받은 위치로 이동
        map.setCenter(coords);

    } 
});    




</script>

</div>
		
</div>
</div>		


		
</div>		
		
<!-- <aside class="right-sidebar"> -->
<!-- 		<div style="float: right; margin: auto; padding: auto;"></div> -->

<!-- </aside> -->

	<span id="wait">
	<c:if test="${restForm.on_off == true}">
		<c:if test="${!wdto.rest_id.equals(restForm.rest_id) && !wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen1('${restForm.rest_id}');" id="waiting" style="margin-right: 50px">대기하기</button>
		</c:if>
		
		<c:if test="${wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen2();" id="waiting2">대기하기</button>
		</c:if>
	</c:if>
	<c:if test="${restForm.on_off == false}">
		<button>영업 준비 중입니다...(T^T)</button>
	</c:if>
   	 

	<button onclick="location.href='./listForm.fd'" id="sl">가게 리스트로</button>
	</span>
		
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