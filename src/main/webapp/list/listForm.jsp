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
<link rel="stylesheet" href="css/listcss.css">

<title>Category</title>

 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"/></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	

// 			$('#Map').on('click',function(){
// 				$('#map').load(location.href="/TestMap.jsp" + '#map')
// 			});


// 	});

		

</script>

<style>
        .myDiv {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 10px;
        }

        .list {
/*             border: 1px solid #ccc; */
            padding: 10px;
            text-align: center;
        }

        #subject{
        font-size: x-large;
        margin-top: 20px;}
        

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

<div id="table_search" style="margin-left: 150px; margin-top: 30px;">
            <form action="./listForm.fd" method="get" id="fr" onsubmit="return checkData();">
                <span>
                <label for="addr_city"> <b>CITY&nbsp;</b></label>
                    <select id="addr_city" name="addr_city" onchange="addrChange(this);">
                      <option value="none">시/도를 선택해주세요.</option>
                        <option value="서울" <c:if test="${param.addr_city.equals('서울')}">selected</c:if>>서울</option>
                        <option value="인천" <c:if test="${param.addr_city.equals('인천')}">selected</c:if>>인천</option>
                        <option value="대전" <c:if test="${param.addr_city.equals('대전')}">selected</c:if>>대전</option>
                        <option value="대구" <c:if test="${param.addr_city.equals('대구')}">selected</c:if>>대구</option>
                        <option value="광주" <c:if test="${param.addr_city.equals('광주')}">selected</c:if>>광주</option>
                        <option value="부산" <c:if test="${param.addr_city.equals('부산')}">selected</c:if>>부산</option>
                        <option value="울산" <c:if test="${param.addr_city.equals('울산')}">selected</c:if>>울산</option>
                        <option value="경북" <c:if test="${param.addr_city.equals('경북')}">selected</c:if>>경북</option>
                        <option value="경남" <c:if test="${param.addr_city.equals('경남')}">selected</c:if>>경남</option>
                        <option value="전남" <c:if test="${param.addr_city.equals('전남')}">selected</c:if>>전남</option>
                        <option value="강원" <c:if test="${param.addr_city.equals('강원')}">selected</c:if>>강원</option>
                    </select>
                </span>
                <span>
                <label for="addr_discrict"><b>&nbsp;DISTRICT&nbsp;</b></label>
                    <select id="addr_district" name="addr_district">
                        <option value="none">구를 선택해주세요.</option>
                        <c:if test="${param.addr_district.equals('none')}">
                            <option value="${param.addr_district}" selected>${param.addr_district}</option>
                        </c:if>
                    </select>
                </span><br>
                <input type="text" name="search" class="input_box" style="width: 490px; height:35px; text-align:center; margin-top: 10px;" placeholder="매장을 검색해 보세요">
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
	 var 서울 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];;
     var 부산 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
     var 경남 = ["창원시","김해시","진주시","양산시","거제시","통영시","사천시","밀양시","함안군","거창군","창녕군","고성군","하동군","합천군","남해군","함양군","산청군","의령군"];
     var 대전 = ["대덕구","동구","서구","유성구","중구"];
     var 대구 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
     var 광주 = ["광산구","남구","동구","북구","서구"];
     var 울산 = ["남구","동구","북구","중구","울주군"];
     var 인천 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
     var 경남 = ["창원시","김해시","진주시","양산시","거제시","통영시","사천시","밀양시","함안군","거창군","창녕군","고성군","하동군","합천군","남해군","함양군","산청군","의령군"];
     var 경북 = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","군위군","의성군","청송군","영양군","영덕군","청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군"];
     var 전남 = ["목포시","여수시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군"];
		var target = document.getElementById("addr_district")
		
		if (e.value == "서울") var addr_d = 서울;
        else if (e.value == "부산") var addr_d = 부산;
        else if (e.value == "경남") var addr_d = 경남;
        else if (e.value == "경북") var addr_d = 경북;
        else if (e.value == "광주") var addr_d = 광주;
        else if (e.value == "대전") var addr_d = 대전;
        else if (e.value == "대구") var addr_d = 대구;
        else if (e.value == "울산") var addr_d = 울산;
        else if (e.value == "전남") var addr_d = 전남;
        else if (e.value == "강원") var addr_d = 강원;
        else if (e.value == "인천") var addr_d = 인천;
		
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
   <div style="text-align: right; margin-right: 24%; margin-bottom: 1.5%;">
   <input onclick="toggleDiv('list')" type="image" src="img/menu.png" style="width:300x; height:50px; margin-right: 20px;">
   <input onclick="toggleDiv('map')" type="image" src="img/위치%20아이콘.png" style="width:300x; height:50px">
	</div>

			<!-- 가게 리스트 시작-->
		
<!-- 		<div id="list" class="myDiv"> -->
<!--             <script id="list" class="myDiv"></script> -->
        

        

            <div id="list" class="myDiv">
            <div id="list" class="myDiv" style="width: 400px; height: 700px;">
            <c:forEach var="dto" items="${requestScope.listForm }" varStatus="no">
    
            <div class="list">
            <a href="./restaurantForm.fd?rest_id=${dto.rest_id}&pno=${pno}"><img src="./upload/${dto.outfile}" width="300px" height="250px"></a><br>
<%--             ${no.count} --%>
            
        
            <a href="./restaurantForm.fd?rest_id=${dto.rest_id}&pno=${pno}"><span id="subject">${dto.name }</span> <span style="color: black; font-size: 15px;" >${dto.category }</span> </a>
            
            <br>
             &#128150; ${dto.like_num} &nbsp;
             &#9997; ${dto.reviewCount}

        </div>
        </c:forEach>
		</div>
            <div style="text-align: left; font-size: x-large;" > <br>

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
                <a href="./listForm.fd?pno=<%=i%>">[<%=i%>]</a> &nbsp;
    <%
            }
            if(endPage < pageCount) {
    %>
                <a href="./listForm.fd?pno=<%=startPage + pageBlock%>">[다음]</a>
    <%
            }
        }
    %>
	
	<!-- 가게 리스트 끝 -->
	
 </div>
 </div>
	
	
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