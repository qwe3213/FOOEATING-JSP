<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fooeating.db.RestaurantDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.fooeating.db.PublicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"/></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	
		$('document').ready(function(){
// 	        var area0 = ["시/도 선택", "서울광역시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","강원도","경상남도","경상북도","전라남도"];
// 	        var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
// 	        var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
// 	        var area3 = ["대덕구","동구","서구","유성구","중구"];
// 	        var area4 = ["광산구","남구","동구","북구","서구"];
// 	        var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
// 	        var area6 = ["남구","동구","북구","중구","울주군"];
// 	        var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
// 	        var area8 = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횡성군","영월군","평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군"];
// 	        var area9 = ["창원시","김해시","진주시","양산시","거제시","통영시","사천시","밀양시","함안군","거창군","창녕군","고성군","하동군","합천군","남해군","함양군","산청군","의령군"];
// 	        var area10 = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","군위군","의성군","청송군","영양군","영덕군","청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군"];
// 	        var area11 = ["목포시","여수시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군"];

// 	    $("select[name^=sido]").each(function() {
// 	          $selsido = $(this);
// 	          $.each(eval(area0), function() {
// 	           $selsido.append("<option value='"+this+"'>"+this+"</option>");
// 	          });
// 	          $selsido.next().append("<option value=''>구/군 선택</option>");
// 	         });

// 	    $("select[name^=sido]").change(function() {
// 	          var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
// 	          var $gugun = $(this).next(); // 선택영역 군구 객체
// 	          $("option",$gugun).remove(); // 구군 초기화

// 	          if(area == "area0")
// 	           $gugun.append("<option value=''>구/군 선택</option>");
// 	          else {
// 	           $.each(eval(area), function() {
// 	            $gugun.append("<option value='"+this+"'>"+this+"</option>");
// 	           });
// 	          }
// 	         });

// 			$('#Map').on('click',function(){
// 				$('#map').load(location.href="/TestMap.jsp" + '#map')
// 			});


	});

		

</script>

<link href="./css/header.css" rel="stylesheet">

</head>
<body>

<!-- header -->
<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- 	<form action="./listFormAction.fd" method="post" name="fr" onsubmit="checkData();"></form>	 -->
<!-- 	 <input type="text" placeholder="매장을 검색해 보세요"> <input type="submit" value="검색">	<br><br>  -->
	 
<!-- 		<div id="table_search"> -->
<!-- 			<form action="./listForm.fd" method="get"> -->
<!-- 				<input type="text" name="search" class="input_box"> -->
<!-- 				<input type="submit" value="search" class="btn">  -->
<!-- 			</form> -->
<!-- 		</div> -->
	 
	
	<select name="sido1" id="sido1" style="width:500x; height:50px;"></select>
	<select name="gugun1" id="gugun1" style="width:500x; height:50px;"></select>
	 
	 
	 <input type="checkbox" > 한식 
	 <input type="checkbox" > 양식 
	 <input type="checkbox" > 중식 
	 <input type="checkbox" > 일식 
	 <input type="checkbox" > 디저트 
	 
	 <hr>
	 
	 <select style="width:300x; height:30px;">
	 	<option>리뷰수</option>
	 	<option>평점수</option>
	 	<option>좋아요수</option>
	 </select>
	 
	 
	 <div id="table_search">
        <form action="./listForm.fd" method="get">
			<div>
			<label for="addr_city">시/도</label>
				<select id="addr_city" name="addr_city" onchange="addrChange(this)">
					<option>시/도 선택</option>
					<option value="서울특별시" <c:if test="${param.addr_city.equals('서울특별시')}">selected</c:if>>서울</option>
					<option value="부산광역시" <c:if test="${param.addr_city.equals('부산광역시')}">selected</c:if>>부산</option>
					<option value="경상남도" <c:if test="${param.addr_city.equals('경상남도')}">selected</c:if>>경남</option>
				</select>
			</div>
			<div>
			<label for="addr_discrict">구</label>
				<select id="addr_district" name="addr_district">
					<option>선택해주세요</option>
					<c:if test="${param.addr_district != null}">
						<option value="${param.addr_district}" selected>${param.addr_district}</option>
					</c:if>
				</select>
			</div>
	        <input type="text" name="search" class="input_box">
	        <input type="submit" value="search" class="btn">
        </form>
    </div>
	 
	 
<!-- 	 <input id="kakao" type="image" src="img/위치%20아이콘.png" style="width:300x; height:50px"> -->
<!-- 	 <input id="gallery" type="image" src="img/갤러리%20아이콘.png" style="width:300x; height:50px"> -->
		
		<style>
		.myDiv{
			display: none;
			}
		</style>

 <script>
 function toggleDiv(divId) {
     var mapDiv = document.getElementById("map");
     var listDiv = document.getElementById("list");
     
     
     if(divId === "map"){
    	mapDiv.style.display = "block";
    	listDiv.style.display = "none";
     } else if(divId === "list"){
    	 mapDiv.style.display = "none";
    	 listDiv.style.display = "block";s
     	}
     }
 
  window.onload = function() {
	var listDiv = document.getElementById("list");
	listDiv.style.display = "block";
 };
 
 function addrChange(e) {
		var 서울특별시 = ["강남", "홍대", "여의도"];
		var 부산광역시 = ["북구", "부산진구", "동래구"];
		var 경상남도 = ["김해", "창원", "양산"];
		var target = document.getElementById("addr_district")
		
		if (e.value == "서울특별시") var addr_d = 서울특별시;
		else if (e.value == "부산광역시") var addr_d = 부산광역시;
		else if (e.value == "경상남도") var addr_d = 경상남도;
		
		target.options.length = 0;
		
		for (x in addr_d) {
			var opt = document.createElement("option");
			
			opt.value = addr_d[x];
			opt.innerHTML = addr_d[x];
			target.appendChild(opt);
		}
	}
  </script>
  
   <button onclick="toggleDiv('map')">Gallery</button>
   <button onclick="toggleDiv('list')">API</button>


			<!-- 가게 리스트 시작-->
		
		<div id="list" class="myDiv">
		<table border="1">
		<tr>
			<th>No.</th>
			<th>가게이름</th>
			<th>전화번호</th>
			<th>편의사항</th>
			<th>id</th>
			<th>등록일</th>
			<th>휴무일</th>
<!-- 			<th>조회수</th> -->
		</tr>
		
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
			<td>${dto.rest_tel}</td>
			<td>${dto.convenience}</td>
			<td>${dto.rest_id}</td>
			<td>${dto.regdate}</td>
			<td>${dto.dayoff}</td>
<%-- 			<td>${restForm.read_count}</td> --%>
		</tr>
		</c:forEach>
	</table>
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

<div id="map" class="myDiv" style="width:100%;height:350px;">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818dd4a57e9e35bee82d5b6284cabfe5&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.1584952142483, 129.06199399191797), // 지도의 중심좌표
//         level: 0 // 지도의 확대 레벨
    };  

// 지도를 생성 
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색
geocoder.addressSearch('부산 부산진구 중앙대로 672', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">삼정타워</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동
        map.setCenter(coords);
    } 
});    

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
});

</script>

</div>

	
	<!-- 카카오맵 API 끝 -->

                 
</body>
</html>