<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fooeating.db.RestaurantDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.fooeating.db.PublicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
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
<link rel="stylesheet" href="css/listarray.css">

<title>Category</title>

 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"/></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	

// 			$('#Map').on('click',function(){
// 				$('#map').load(location.href="/TestMap.jsp" + '#map')
// 			});


// 	});

		

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

<!-- header -->
<jsp:include page="../inc/headerDiv.jsp" />
<!-- header -->

<!-- 	<form action="./listFormAction.fd" method="post" name="fr" onsubmit="checkData();"></form>	 -->
<!-- 	 <input type="text" placeholder="매장을 검색해 보세요"> <input type="submit" value="검색">	<br><br>  -->
	 
<!-- 		<div id="table_search"> -->
<!-- 			<form action="./listForm.fd" method="get"> -->
<!-- 				<input type="text" name="search" class="input_box"> -->
<!-- 				<input type="submit" value="search" class="btn">  -->
<!-- 			</form> -->
<!-- 		</div> -->
	
	
<!-- 	<select name="sido1" id="sido1" style="width:500x; height:50px;"></select> -->
<!-- 	<select name="gugun1" id="gugun1" style="width:500x; height:50px;"></select> -->

<main>
	<div id="top">
		 <div id="table_search">
	        <form action="./listForm.fd" method="get" id="fr" onsubmit="return checkData();">
				<div>
				<label for="addr_city">시/도</label>
					<select id="addr_city" name="addr_city" onchange="addrChange(this);">
						<option value="none">시/도 선택</option>
						<option value="서울" <c:if test="${param.addr_city.equals('서울')}">selected</c:if>>서울</option>
						<option value="부산" <c:if test="${param.addr_city.equals('부산')}">selected</c:if>>부산</option>
						<option value="경상남도" <c:if test="${param.addr_city.equals('경상남도')}">selected</c:if>>경남</option>
					</select>
				</div>
				<div>
				<label for="addr_discrict">구</label>
					<select id="addr_district" name="addr_district">
						<option value="none">선택해주세요</option>
						<c:if test="${param.addr_district.equals('none')}">
							<option value="${param.addr_district}" selected>${param.addr_district}</option>
						</c:if>
					</select>
				</div>
		        <input type="text" name="search" class="input_box" style="width: 300px; text-align:center; ;" placeholder="매장을 검색해 보세요">
		        <input type="submit" value="검색" class="btn">
	        </form>
	    </div>
		


 <script>
 function toggleDiv(divId) {
     var mapDiv = document.getElementById("map");
     var listDiv = document.getElementById("list");
     
     
     if(divId === "map"){
    	mapDiv.style.display = "block";
    	listDiv.style.display = "none";
     } else if(divId === "list"){
    	 mapDiv.style.display = "none";
    	 listDiv.style.display = "block";
     	}
     }
 
  window.onload = function() {
	var listDiv = document.getElementById("list");
	var mapDiv = document.getElementById("map");
	listDiv.style.display = "block";
	mapDiv.style.display = "none";
 };
 
 function addrChange(e) {
		var 서울 = ["강남", "홍대", "여의도"];
		var 부산 = ["북구", "부산진구", "동래구"];
		var 경상남도 = ["김해", "창원", "양산"];
		var target = document.getElementById("addr_district")
		
		if (e.value == "서울") var addr_d = 서울;
		else if (e.value == "부산") var addr_d = 부산;
		else if (e.value == "경상남도") var addr_d = 경상남도;
		
		target.options.length = 0;
		
		for (x in addr_d) {
			var opt = document.createElement("option");
			
			opt.value = addr_d[x];
			opt.innerHTML = addr_d[x];
			target.appendChild(opt);
		}
	}
	
	function checkData() {
		if(fr.addr_city.value == "none"){
			alert("지역을 선택하세요.");
			return false;
		}
		if(fr.search.value == "") {
			alert("검색어를 입력하세요.")
			return false;
		}
	}
  </script>
  
<!-- 	 <input id="toggleDiv('map')" type="image" src="img/위치%20아이콘.png" style="width:300x; height:50px"> -->
<!-- 	 <input id="toggleDiv('list')" type="image" src="img/갤러리%20아이콘.png" style="width:300x; height:50px"> -->
<!--    <button onclick="toggleDiv('map')" image>MAP</button> -->
<!--    <button onclick="toggleDiv('list')">LIST</button> -->
   
   <input onclick="toggleDiv('map')" type="image" src="img/위치%20아이콘.png" style="width:300x; height:50px">
   <input onclick="toggleDiv('list')" type="image" src="img/갤러리%20아이콘.png" style="width:300x; height:50px">


			<!-- 가게 리스트 시작-->
		
<!-- 		<div id="list" class="myDiv"> -->
		<div id="list" class="myDiv"><script id="list" class="myDiv"></script>
		<table border="1">
<!-- 		<tr> -->
<!-- 			<th>No.</th> -->
<!-- 			<th>가게이름</th> -->
<!-- 			<th>외관사진</th> -->
<!-- 			<th>좋아요 수</th> -->
<!-- 			<th>리뷰 수</th> -->
<!-- <!-- 			<th>조회수</th> --> -->
<!-- 		</tr> -->
		
		<c:forEach var="dto" items="${requestScope.listForm }" varStatus="no">
	
		<tr>
			<td>${no.count}</td>
			<td>
			<%-- <form action="./restaurantForm.fd" method="post" >
					<input type="hidden" name="rest_id" value="${dto.rest_id}">
					<input type="submit" value="${dto.name}">
				</form> --%>
				<a href="./restaurantForm.fd?rest_id=${dto.rest_id}&pno=${pno}">${dto.name }</a>
			</td>
			<td>${dto.like_num}</td>
			<td>${dto.reviewCount}</td>
<%-- 			<td>${restForm.read_count}</td> --%>
		</tr>
		</c:forEach>
	</table>
<br>
<%
		int count = (int)request.getAttribute("count");
		int pageSize = (int)request.getAttribute("pageSize");
		int currentPage = (int)request.getAttribute("currentPage");
		int pno = Integer.parseInt((String)request.getAttribute("pno"));
		
	
		
		if(count != 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = ((pno - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > pageBlock) {
	%>
				<a href="./listForm.fd?pno=<%=startPage - pageBlock%>">[이전]</a>
	<%
			}
			for(int i = startPage; i <= endPage; i++) {
	%>
				<a href="./listForm.fd?pno=<%=i%>">[<%=i%>]</a>
	<%
			}
			if(endPage < pageCount) {
	%>
				<a href="./listForm.fd?pno=<%=startPage + pageBlock%>">[다음]</a>
	<%
			}
		}
	%>
	
	</div>
	
	<!-- 가게 리스트 끝 -->
	
 
	
	
	<!-- 카카오맵 API 시작-->
	

<!-- <div id="myDiv" style="width:100%;height:350px;display: none;"> -->

<div id="map" class="myDiv" style="width:400x;height:300px;">

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
geocoder.addressSearch('부산 부산진구 가야대로 772', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">롯데백화점</div>'
        });
        infowindow.open(map, marker);
        
        // 지도의 중심을 결과값으로 받은 위치로 이동
        map.setCenter(coords);
        


    } 
        map.relayout();
});

</script>
</div>
</div>
<!-- 카카오맵 API 끝 -->

</main>
<!-- main -->

<!-- footer -->
<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->
                 
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