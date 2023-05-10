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
	        var area0 = ["시/도 선택", "서울광역시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","강원도","경상남도","경상북도","전라남도"];
	        var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	        var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	        var area3 = ["대덕구","동구","서구","유성구","중구"];
	        var area4 = ["광산구","남구","동구","북구","서구"];
	        var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	        var area6 = ["남구","동구","북구","중구","울주군"];
	        var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	        var area8 = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횡성군","영월군","평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군"];
	        var area9 = ["창원시","김해시","진주시","양산시","거제시","통영시","사천시","밀양시","함안군","거창군","창녕군","고성군","하동군","합천군","남해군","함양군","산청군","의령군"];
	        var area10 = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","군위군","의성군","청송군","영양군","영덕군","청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군"];
	        var area11 = ["목포시","여수시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군"];


	    $("select[name^=sido]").each(function() {
	          $selsido = $(this);
	          $.each(eval(area0), function() {
	           $selsido.append("<option value='"+this+"'>"+this+"</option>");
	          });
	          $selsido.next().append("<option value=''>구/군 선택</option>");
	         });

	    $("select[name^=sido]").change(function() {
	          var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	          var $gugun = $(this).next(); // 선택영역 군구 객체
	          $("option",$gugun).remove(); // 구군 초기화

	          if(area == "area0")
	           $gugun.append("<option value=''>구/군 선택</option>");
	          else {
	           $.each(eval(area), function() {
	            $gugun.append("<option value='"+this+"'>"+this+"</option>");
	           });
	          }
	         });

			$('#Map').on('click',function(){
				$('#map').load(location.href="/TestMap.jsp" + '#map')
			})
	    
	    
	    
	        });
		
		$(document).ready(function(){
			$("#kakao").click(function(){
				$.ajax({
					url:"./list/kakaoapi.html",
					type:"GET",
					success: function(data){
						$("#result").html(data);
					}
				});
			});
		
		$("#gallery").click(function(){
			$.ajax({
				url: "./ListGallery.fd",
				type:"GET",
				success: function(data){
					$("#result").html(data);
				}
			});
		});
		
	});
		
	

</script>
</head>
<body>

	  

	<form action="./listFormAction.fd" method="post" name="fr" onsubmit="checkData();"></form>	
	 <input type="text" placeholder="매장을 검색해 보세요"> <input type="submit" value="검색">	<br><br> 
	 
	
	 
	
	
	 
	
	<select name="sido1" id="sido1" style="width:500x; height:50px;"></select>
	<select name="gugun1" id="gugun1" style="width:500x; height:50px;"></select>
	 
	 
	 <input type="checkbox" checked=""> 한식 
	 <input type="checkbox" checked=""> 양식 
	 <input type="checkbox" checked=""> 중식 
	 <input type="checkbox" checked=""> 일식 
	 <input type="checkbox" checked=""> 디저트 
	 
	 <hr>
	 
	 <select style="width:300x; height:30px;">
	 	<option>리뷰수</option>
	 	<option>평점수</option>
	 	<option>좋아요수</option>
	 </select>
	 
	 <input id="kakao" type="image" src="img/위치%20아이콘.png" style="width:300x; height:50px">
	  <input id="gallery" type="image" src="img/갤러리%20아이콘.png" style="width:300x; height:50px">
 	  <div id="result"></div>

	 
	<hr>
	

	
	
		<div id="map" style="width:100%;height:350px;">


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818dd4a57e9e35bee82d5b6284cabfe5&libraries=services"></script>
<script>

</script>

</div>
	
	
                    
</body>
</html>