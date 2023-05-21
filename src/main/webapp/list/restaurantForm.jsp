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
        
        

		<h1 class="restname" style="padding-top: 80px">${restForm.name}</h1>
		
		&#128065
		&nbsp;${restForm.read_count}&nbsp;
		&nbsp;&#128150&nbsp;
		&nbsp;
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
		&nbsp;
		&nbsp;&#9997
		&nbsp;${reviewCount }&nbsp;

	<hr>
	
	

<table style="border-collapse: separate; border-spacing: 11px;">
<%--             <caption>레스토랑 상세정보</caption> --%>
            <tr>

                    <th>&#127968; </th>
                    <td style="font-size: 18px;">${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc}</td>

            </tr>
            <tr>
                    <th>&#128222; </th>
                    <td style="font-size: 18px;">${restForm.rest_tel}</td>
            </tr>
            <tr>
                    <th>&#129348; </th>
                    <td style="font-size: 18px;">${restForm.category}</td>
            </tr>
            <tr>
                    <th>&#128344; </th>
                    <td style="font-size: 18px;">${restForm.runtime}</td>
            </tr>
            <tr>
                    <th>&#128198; </th>
                    <td style="font-size: 18px;">${restForm.dayoff} (휴무일)</td>
            </tr>
        </table>  	


<hr>
<br>




<script>
 function toggleDiv(divId) {
     var menuDiv = document.getElementById("menu1");
     var introDiv = document.getElementById("intro");
     var reviewDiv = document.getElementById("review");
     var noticeDiv = document.getElementById("notice");
     
     
     
     if(divId === "menu1"){
    	 menuDiv.style.display = "block";
    	introDiv.style.display = "none";
    	reviewDiv.style.display = "none";
    	noticeDiv.style.display = "none";
    	
     } else if(divId === "intro"){
    	 noticeDiv.style.display = "none";
    	 reviewDiv.style.display = "none";
    	 menuDiv.style.display = "none";
    	 introDiv.style.display = "block";
     	}
      else if(divId === "review"){
    	 noticeDiv.style.display = "none";
    	 introDiv.style.display = "none";
    	 menuDiv.style.display = "none";
    	 reviewDiv.style.display = "block";
     	}
    else if(divId === "notice") {
    	 introDiv.style.display = "none";
    	 reviewDiv.style.display = "none";
    	 menuDiv.style.display = "none";
    	 noticeDiv.style.display = "block";
     	}
     
     
     
     }
 
  window.onload = function() {
	  	 var menuDiv = document.getElementById("menu1");
	     var introDiv = document.getElementById("intro");
	     var reviewDiv = document.getElementById("review");
	     var noticeDiv = document.getElementById("notice");
	    	
	     	menuDiv.style.display = "block";
			introDiv.style.display = "none";
			reviewDiv.style.display = "none";
			noticeDiv.style.display = "none";
 };
</script>


	<div class="con">
	   <input onclick="toggleDiv('menu1')" type="button" value="MENU" id="sogae" style="border-radius: 10px; font-weight: bold;" >
	   <input onclick="toggleDiv('intro')" type="button" value="INTRO" id="sogae" style="border-radius: 10px; font-weight: bold;">
	   <input onclick="toggleDiv('review')" type="button" value="REVIEW" id="sogae" style="border-radius: 10px; font-weight: bold;">
	   <input onclick="toggleDiv('notice')" type="button" value="NOTICE" id="sogae" style="border-radius: 10px; font-weight: bold;">
	</div>

	<div id="menu1" class="rest" style="margin-top: 30px;"><br>
             <p style="font-size: 19px; margin-bottom: 10px; margin-left: 8px;">&#128203;&nbsp;&nbsp;${menulist.menu_name }</p>
             <p style="font-size: 19px; margin-bottom: 10px; margin-left: 8px;">&#128172;&nbsp;&nbsp;${menulist.menu_descriptions }</p>
             <p style="font-size: 19px; margin-bottom: 10px; margin-left: 8px;">&#128181;&nbsp;&nbsp;${menulist.price }</p>
    </div>    

            <div id="intro" class="rest" style="margin-top: 50px;">
            <p><b style="font-size: 20px;">&#128073;&nbsp; 가게 소개 &nbsp;&#128072;</b></p><br>
            <p style="font-size: 19px;">${restForm.descriptions}</p><br>
            </div>

            <div id="review" class="rest" >
            <c:forEach var="re" items="${requestScope.re }" varStatus="no">
            <br>
        <table>
            <tr>
	            <th>등록일</th>
	            <td>${re.regdate}</td>
	        </tr>
            <tr>
	            <th>번호</th>
	            <td>${no.count}</td>
            </tr>
            <tr>
	            <th>아이디</th>
	            <td>${re.user_id}</td>
            </tr>
            <tr>
	            <th>평점</th>
	            <td>${re.grade}</td>
            </tr>
            <tr>
	            <th>내용</th>
	            <td>${re.content}</td>
            </tr>
            <tr>
	            <th>외관사진</th>
	            <td>${re.file}</td>
            </tr>                
        </table>
        
      
            <hr>
        </c:forEach>
            </div>

            <div id="notice" class="rest" style="margin-top: 50px;">
            <p><b style="margin-bottom: 10px; font-size: 20px;">&#128276;&nbsp;&nbsp;가게 공지사항&nbsp;&nbsp;&#128276;</b><br></p>
<br>
            <p id="ntt" style="font-size: 19px;">${restForm.rest_notice}</p><br>
            </div>
	<hr>
	

<!-- 		<tr> -->
<%-- 		<c:forEach var="re" items="${requestScope.re }" varStatus="no"> --%>
<%-- 			<th>번호</th> &nbsp <td>${no.count}</td><br> --%>
<%-- 			<th>아이디</th> &nbsp <td>${re.user_id}</td><br> --%>
<%-- 			<th>외관사진</th> &nbsp <td>${re.file}</td><br>			 --%>
<%-- 			<th>평점</th> &nbsp <td>${re.grade}</td><br> --%>
<%-- 			<th>내용</th> &nbsp <td>${re.content}</td><br> --%>
<%-- 			<th>등록일</th> &nbsp <td>${re.regdate}</td><br> --%>
<!-- 			<hr> -->
<%-- 		</c:forEach> --%>
<!-- 		</tr> -->

		
<!-- 	</tbody> -->
	
	
	
<%-- 	${wdto.user_id} ${wdto.rest_id} ${wdto.wait_num} <br> --%>
<%-- 	${sessionScope.user_id} ${restForm.rest_id} --%>
	
		 
		
<!-- FACILIES -->	

		<b><p id="fc" style="font-size: 20px; margin-bottom: 20px;">FACILITIES</p></b>
		
		<div style="white-space: nowrap;">
			

			<c:if test="${restForm.convenience.split(',')[0] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[0]}.png" style="width: 65px; height: 65px; display: block;" class="fic">
			<p id="fict1" style="margin-left: 10px; margin-top: 10px;">${restForm.convenience.split(',')[0]}</p>
			</div>
			</c:if>

			<c:if test="${restForm.convenience.split(',')[1] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[1]}.png" style="width: 65px; height: 65px; display: block;" class="fic">
			<p id="fict2" style="margin-left: 10px; margin-top: 10px;">${restForm.convenience.split(',')[1]}</p>
			</div>
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[2] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[2]}.png" style="width: 65px; height: 65px;" class="fic">
			<p id="fict3" style="margin-left: 10px; margin-top: 10px;">${restForm.convenience.split(',')[2]}</p>
			</div>
			</c:if>

			<c:if test="${restForm.convenience.split(',')[3] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[3]}.png" style="width: 65px; height: 65px;" class="fic">
			<p id="fict4" style="margin-left: 10px; margin-top: 10px;">${restForm.convenience.split(',')[3]}</p>
			</div>
			</c:if>

			<c:if test="${restForm.convenience.split(',')[4] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[4]}.png" style="width: 65px; height: 65px;" class="fic">
			<p id="fict5" style="margin-left: 10px; margin-top: 10px;">${restForm.convenience.split(',')[4]}</p>
			</div>
			</c:if>

			<c:if test="${restForm.convenience.split(',')[5] != null}">
			<div style="display: inline-block;">
			<img src="./img/facilities/${restForm.convenience.split(',')[5]}.png" style="width: 65px; height: 65px;">
			<p id="fict6" style="margin-left: 10px;">${restForm.convenience.split(',')[5]}</p>
			</div>
			</c:if>
		</div>

<!-- FACILIES -->
			
			
<%-- 			<td>${restForm.convenience.split(",")[0]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[1]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[2]}</td> --%>
			
		
	<hr>
	
	<div class="location">
	<b style="font-size: 19px;"><th>LOCATION</th></b>
	</div>
	<p style="margin-top: 20px; font-size: 18px;">${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc}</p>
		<div style="text-align: -webkit-center;">
		<div id="map" class="myDiv" style="width:100%;height:400px; margin-top: 40px;">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=89b7b057107ea38979fda72f1c0d0480&libraries=services"></script>
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

<!-- <table > -->
<div id="wait" style="position: relative; margin-left: 1650px; bottom: 1280px; border: 2px;">
<!-- 	<span > -->
		<c:if test="${restForm.on_off == true}">
			<c:if test="${!wdto.rest_id.equals(restForm.rest_id) && !wdto.user_id.equals(sessionScope.user_id)}">
				<button onclick="winopen1('${restForm.rest_id}');" id="jaebal" style="margin-right: 50px">대기하기</button>
			</c:if>
		
			<c:if test="${wdto.user_id.equals(sessionScope.user_id)}">
				<button onclick="winopen2();" id="jaebal">대기하기</button>
			</c:if>
		</c:if>
		
		<c:if test="${restForm.on_off == false}">
			<button id="ready">영업 준비 중입니다...(T^T)</button>
		</c:if>
   	 
		<button onclick="location.href='./listForm.fd'" id="sl">가게 리스트로</button>
<!-- 	</span> -->
</div>
<!-- </table> -->
		
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