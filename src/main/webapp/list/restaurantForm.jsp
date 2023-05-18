<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

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
		
		if($('img').attr('class') == "empty_heart" ){
		
			$.ajax({
				url:"./RestaurantInfoHeartAdd.fd",
				data : {
					user_id:user_id, 
					rest_id:rest_id,
					},
				success: function(data) {
					$('img').attr("src", "./img/fullheart.png");
					$('img').attr("class", "full_heart");
					
					$('.heartNo').html(data);
					
				},
				error : function() {
					alert("서버요청실패");
				}
				
			});
			
			} else if($('img').attr('class') == "full_heart" ){
					
					$.ajax({
						url:"./RestaurantInfoHeartRemove.fd",
						data : {
							user_id:user_id, 
							rest_id:rest_id,
							},
						success: function(data) {
							$('img').attr("src", "./img/emptyheart.png");
							$('img').attr("class", "empty_heart");
							
							$('.heartNo').html(data);
							
						},
						error : function() {
							alert("서버요청실패");
						}
						
			});
		
		}
	}
		
	
	
	
	
	
</script>

</head>
<body>

<!-- header -->
<jsp:include page="../inc/headerDiv.jsp" />
<!-- header -->

<!-- main -->
<main>
<br><br>

			<h1>${restForm.name}</h1>

			<th>&#128065</th>
			<td>${restForm.read_count}</td>
			<th>&#128150</th>
			<td>${heartNo }</td>
			<th>&#9997</th>

			<hr>
	<c:if test="${restForm.on_off == true}">
		<c:if test="${!wdto.rest_id.equals(restForm.rest_id) && !wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen1('${restForm.rest_id}');">대기하기</button>
		</c:if>
		
		<c:if test="${wdto.user_id.equals(sessionScope.user_id)}">
			<button onclick="winopen2();">대기하기</button>
		</c:if>
	</c:if>
	<c:if test="${restForm.on_off == false}">
		<button>영업 준비 중입니다...(T^T)</button>
	</c:if>
	
   	 

	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
	<br>
	<br>
	<br>
		<c:choose>
			<c:when test="${!empty user_id && heart_check == 1}">
				<img id="heart" src="./img/fullheart.png" class="full_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:when test="${empty user_id}">
				<img id="heart" src="./img/emptyheart.png" class="empty_heart_login" onclick="moveLogin();" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:when>
			<c:otherwise>
				<img id="heart" src="./img/emptyheart.png" class="empty_heart" onclick="javascript:heart_check('${user_id}','${restForm.rest_id }');" width="50" height="50">
				<div class="heartNo">${heartNo }</div> 
			</c:otherwise>
		</c:choose>
			
			<tbody>
			<th>주소</th>
			${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc}</td><br>


			<th>전화번호</th>
			<td>${restForm.rest_tel}</td><br>
	

			<th>업종</th>
			<td>${restForm.category}</td><br>


			<th>영업 시간</th>
			<td>${restForm.runtime}</td><br>
			</tbody>

<hr>


			<th>메뉴</th>
			<td></td><br>




			<th>가게 공지사항</th>
			<td>${restForm.rest_notice}</td><br>





	
	<hr>
	

	
	<tbody>
		<tr>
		<c:forEach var="re" items="${requestScope.re }" varStatus="no">
			<th>번호</th> &nbsp <td>${no.count}</td><br>
			<th>아이디</th> &nbsp <td>${re.user_id}</td><br>
			<th>외관사진</th> &nbsp <td>${re.file}</td><br>			
			<th>평점</th> &nbsp <td>${re.grade}</td><br>
			<th>내용</th> &nbsp <td>${re.content}</td><br>
			<th>등록일</th> &nbsp <td>${re.regdate}</td><br>
			<hr>
		</c:forEach>
		</tr>
		
	</tbody>
	
	
	
<%-- 	${wdto.user_id} ${wdto.rest_id} ${wdto.wait_num} <br> --%>
<%-- 	${sessionScope.user_id} ${restForm.rest_id} --%>
	
		 
		
		
		<th>FACILITIES</th> <br>
		
			<c:if test="${restForm.convenience.split(',')[0] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[0]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[1] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[1]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[2] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[2]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[3] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[3]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[4] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[4]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			<c:if test="${restForm.convenience.split(',')[5] != null}">
			<img src="./img/facilities/${restForm.convenience.split(',')[5]}.png" style="width: 65px; height: 65px;">
			</c:if>
			
			
			
<%-- 			<td>${restForm.convenience.split(",")[0]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[1]}</td> --%>
<%-- 			<td>${restForm.convenience.split(",")[2]}</td> --%>
			<br>
	<hr>
	
	<th>LOCATIOM</th>
		
		<div id="map" class="myDiv" style="width:70%;height:400px;">

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




</script>

</div>
		
		
		
		
		
</main>
<!-- main -->





<!-- footer -->
<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->

	
</body>
</html>