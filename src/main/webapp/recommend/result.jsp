<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="javax.script.ScriptContext"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- css 파일 -->
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="./css/question.css" rel="stylesheet">


<title>PUDDING</title>
</head>
<body>

<!-- header -->
<jsp:include page="../inc/header.jsp" />
<!-- header -->


<!-- main -->
<main>

	<br><br><br><br><br>
	<div class="dvh"><h1>당신에게 추천해드리는 음식</h1></div>
	
	<%
		String foodMenu = request.getParameter("foodMenu");	
		
		String queryString = request.getQueryString(); // 현재 URL의 쿼리 문자열을 가져옴
		
		String[] params = queryString.split("&"); // '&' 기준으로 문자열 분리
	
		String[][] paramPairs = new String[params.length][2]; // 2차원 배열 선언
	
		for (int i = 0; i < params.length; i++) {
			String[] pair = params[i].split("="); // '=' 기준으로 문자열 분리
			// 첫 번째 배열 요소에는 쿼리 매개변수의 키(key)를 저장
			paramPairs[i][0] = pair[0]; 
			// 두 번째 배열 요소에는 쿼리 매개변수의 값(value)를 저장
			paramPairs[i][1] = java.net.URLDecoder.decode(pair[1], "UTF-8");
// 			java.nio.charset.StandardCharsets.UTF_8.decode(java.nio.ByteBuffer.wrap(pair[1].getBytes())).toString();
		}

    	String[] arrayParam = new String[paramPairs.length];
    
    	for (int i = 0; i < paramPairs.length; i++) {
      		arrayParam[i] = paramPairs[i][1];
    	}
   		if(foodMenu.equals("kf") ){ // korean_food
		   	for(int i = 0; i < arrayParam.length; i++) {	
		   		if(arrayParam[i].equals("매운거 잘 먹어요?")|| arrayParam[i].equals("2차로 가기 좋은 곳 어때요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/닭발.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">닭발</h3>
								<p> &nbsp; "난 뼈있는거!! ㅎㅎ" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("날 것 드실줄 아시나요?")|| arrayParam[i].equals("봄, 가을에 제철 음식 어때요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/게장.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">게장</h3>
								<p> &nbsp; "게장 꼭 먹어 줘야 돼..핡" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("나이키 신발을 신을 예정이신가요?")|| arrayParam[i].equals("분위기 있는 장소를 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/갈비찜.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">갈비찜</h3>
								<p> &nbsp; "이거 어때? 갈비찜.. 난 혹했는데??" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("가성비를 원하시나요?")|| arrayParam[i].equals("해장을 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/국밥.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">국밥</h3>
								<p> &nbsp; "나 이 음식만큼 완벽한 음식 못 봤다.!! (부산사람 특)" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("퓨전 음식 어떠세요??")|| arrayParam[i].equals("부산에 오면 먹어야 하는 음식 어때요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/낙곱새.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">낙곱새</h3>
								<p> &nbsp; "당신은 분명 이걸 먹어야 할거야.!!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("당신은 인싸이신가요?")|| arrayParam[i].equals("먹어도 살찌는 음식 괜찮으세요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/족발.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">족발</h3>
								<p> &nbsp; "당장 족발 움직여! 지금 줄서자." </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("특별한 날인가요?")|| arrayParam[i].equals("숙면에 불편함이 있으십니까?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/삼겹살.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">삼겹살</h3>
								<p> &nbsp; "삼겹살은 진짜다!! 진짜삼겹살!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("하루하루 즐기며 살고 계신가요?")|| arrayParam[i].equals("호불호 없는 음식 어때?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/치킨.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">치킨</h3>
								<p> &nbsp; "로봇이 좋아하는 음식은? => 윙~치킨!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("탄단지를 원하시나요?")|| arrayParam[i].equals("쌀밥을 찾으시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/비빔밥.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">비빔밥</h3>
								<p> &nbsp; "한국인은 밥심!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("무난한 음식 찾으세요?")|| arrayParam[i].equals("골고루 잘 드시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/찌개.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">본인이 좋아하는 찌개</h3>
								<p> &nbsp; "칭구야 찌개 종류가 너무 많아... (난 김치찌개!!)" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("현재 날씨가 흐린가요?")|| arrayParam[i].equals("여러 명에서 드시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/korean_food/탕.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">본인이 좋아하는 탕</h3>
								<p> &nbsp; "칭구야 탕 종류가 너무 많다... (난 닭도리탕!!!)" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   	}
    	}
    	
    	else if(foodMenu.equals("wf") ){ // western_food
		   	for(int i = 0; i < arrayParam.length; i++) {
		   		if(arrayParam[i].equals("숙면에 불편함이 있으십니까?")|| arrayParam[i].equals("녹색 음식이 땡기시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/시저셀러드.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">시저셀러드</h3>
								<p> &nbsp; "건강이 최고야.! 시저셀러드" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("당신은 지금 우울하신가요?")|| arrayParam[i].equals("현재 날씨가 흐린가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/함박스테이크.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">함박스테이크</h3>
								<p> &nbsp; "스마일 :) => 함박스테이크" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("가성비를 따지시나요?")|| arrayParam[i].equals("해장을 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/햄버거.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">햄버거</h3>
								<p> &nbsp; "이걸로 해장하는 사람은 신기햄버거~" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("여려 명에서 드시나요?")|| arrayParam[i].equals("탄단지를 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/피자.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">피자</h3>
								<p> &nbsp; "한식에 치킨이 있다면... 양식엔 피자가 있지!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("분위기 있는 장소를 원하시나요?")|| arrayParam[i].equals("특별한 날인가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/스테이크.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">스테이크</h3>
								<p> &nbsp; "후.. 오늘 스테이크좀 썰어 볼까?" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("하루하루 즐기며 살고 계신가요?")|| arrayParam[i].equals("당신은 인싸이신가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/western_food/스파게티.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">스파게티</h3>
								<p> &nbsp; "지금 스파게티가 딱이겠는걸?!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("나이키 신발을 신을 예정이신가요?")|| arrayParam[i].equals("쌀밥을 찾으시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<div><img src="./img/food/western_food/리조또.jpg" width="150" height="150" align="left"></div>
							<div>
								<h3 class="h">리조또</h3>
								<p> &nbsp; "조또 맛있겠다." </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   	}
    	}
		   		
    	else if(foodMenu.equals("cf") ){ // chinese_food
		   	for(int i = 0; i < arrayParam.length; i++) {
		   		if(arrayParam[i].equals("여러 명에서 드시나요?")|| arrayParam[i].equals("탕수육 찍먹 이신가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/탕수육.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">탕수육</h3>
								<p> &nbsp; "난 찍먹파야.. 탕수육!" (・∀・) </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("지금 기분이 좋으신가요?")|| arrayParam[i].equals("하루하루 즐기며 살고 계신가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/짜장면.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">짜장면</h3>
								<p> &nbsp; "역시 중식하면 짜장면이지" ヽ( ´￢`)ﾉ </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("오늘 맥주 드시나요?")|| arrayParam[i].equals("고기 어떠세요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/양꼬치.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">양꼬치</h3>
								<p> &nbsp; "하.. 맛있겠다. 양꼬치엔 칭따오!"  (๑❛ڡ❛๑)☆ </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("당신은 인싸이신가요?")|| arrayParam[i].equals("마라 드실 줄 아시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/마라탕.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">마라탕</h3>
								<p> &nbsp; "마라 몇 단계까지 가능..? 본좌는 초보 맛.." ⌯'▾'⌯ </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("가성비를 따지시나요?")|| arrayParam[i].equals("해장을 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/짬뽕.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">짬뽕</h3>
								<p> &nbsp; "얼큰~하이 짬뽕으로 진행시켜" (๑ •̀ω•́)۶ </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("골고루 잘 드시나요?")|| arrayParam[i].equals("특별한 날인가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/고추잡채.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">고추잡채</h3>
								<p> &nbsp; "고추잡채 넌 내거야." (•ᴗ•) </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("현재 날씨가 흐린가요?")|| arrayParam[i].equals("탄단지를 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/마파두부.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">마파두부</h3>
								<p> &nbsp; "마랑 파랑 두부?..?" (◞‸◟；) </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("숙면에 불편함이 있으십니까?")|| arrayParam[i].equals("쌀밥을 찾으시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/chinese_food/볶음밥.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">볶음밥</h3>
								<p> &nbsp; "중식 볶음밥은 쩔지" (͒ ˃꒫˂ )͒ </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   	}
    	}
    	
       	else if(foodMenu.equals("jf") ){ // japanese_food
		   	for(int i = 0; i < arrayParam.length; i++) {
		   		if(arrayParam[i].equals("여러 명에서 드시나요?")|| arrayParam[i].equals("오늘 쏘주 드시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/회.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">회</h3>
								<p> &nbsp; "오늘 끝까지 달려볼래?" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("쌀밥을 찾으시나요?")|| arrayParam[i].equals("골고루 잘 드시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/텐동.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">텐동</h3>
								<p> &nbsp; "나는 새우텐동 먹을껀데 너는?" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("가성비를 따지시나요?")|| arrayParam[i].equals("지금 기분이 좋으신가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/우동.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">우동</h3>
								<p> &nbsp; "좌동 아니죠? 우동이죠! (드립 죄송하죠~)" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("회 드실 줄 아시나요?")|| arrayParam[i].equals("특별한 날인가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/초밥.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">초밥</h3>
								<p> &nbsp; "나 오늘 집에 안갈래~ (회전초밥 ㄱ?)" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("당신은 인싸이신가요?")|| arrayParam[i].equals("해장을 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/라멘.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">라멘</h3>
								<p> &nbsp; "라면도 맛있는데 라멘도 맛있음 인정? 어 인정~" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("하루하루 즐기며 살고 계신가요?")|| arrayParam[i].equals("탄단지를 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">	
							<img src="./img/food/japanese_food/돈카츠.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">돈카츠</h3>
								<p> &nbsp; "너의 배를 채워줄...도야지.. 든든하다." </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("현재 날씨가 더운가요?")|| arrayParam[i].equals("찬 음식도 괜찮아요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/japanese_food/메밀소바.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">메밀소바</h3>
								<p> &nbsp; "날 좋으면 메밀소바도 괜찮잖아?" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   	}
    	}
    	
      	else if(foodMenu.equals("sf") ){ // street_food
		   	for(int i = 0; i < arrayParam.length; i++) {
		   		if(arrayParam[i].equals("당신 다이어트 중이야?")|| arrayParam[i].equals("풀 때기 어때요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/샐러드.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">샐러드</h3>
								<p> &nbsp; "너무 좋은 선택이야!! 샐러드! 어때?!!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("기분이 꿀꿀하신가요?")|| arrayParam[i].equals("매운거 잘 먹어요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/떡볶이.jpg" width="150" height="150" align="left">
							<p>&nbsp;&nbsp;&nbsp; "나 떡볶이 먹으면 기분 좋아짐.. 너도 좋아져랏!!"  </p>
							<div>
								<h3 class="h">떡볶이</h3>
								<p> &nbsp; "나 떡볶이 먹으면 기분 좋아짐.. 너도 좋아져랏!!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("혼밥 가능하신가요?")|| arrayParam[i].equals("쌀밥을 찾으시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/김밥.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">김밥</h3>
								<p> &nbsp; "잘 말아줘~~ 잘 눌러줘~~" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("가성비를 따지시나요?")|| arrayParam[i].equals("하루하루 즐기며 살고 계신가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/토스트.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">토스트</h3>
								<p> &nbsp; "가볍게 토스트로 가보자~~!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("당신은 인싸이신가요?")|| arrayParam[i].equals("탄단지를 원하시나요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/샌드위치.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">샌드위치</h3>
								<p> &nbsp; "샌드위치도 괜찮을 것 같은데~??" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("옛날 어머니의 손맛 어떠세요?")|| arrayParam[i].equals("날씨가 꾸리꾸리 한가요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/칼국수.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">칼국수</h3>
								<p> &nbsp; "알지? 시장칼국수.. JMT!!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   		else if(arrayParam[i].equals("해장을 원하시나요?")|| arrayParam[i].equals("고냥 간단하게 드실래요?")){
					%>
					<div class="container2">
						<div class="box2">
							<img src="./img/food/street_food/라면.jpg" width="150" height="150" align="left">
							<div>
								<h3 class="h">라면</h3>
								<p> &nbsp; "한국인 => 라면 인정?!" </p>
							</div>
						</div>
					</div>
					<%
					break;
		   		}
		   	}
    	}
    %>
	<div class="container2">
		<div class="box2">
			<form action="./RecommendMain.ad">
				<button type="submit"> 다시 추천 받을래!!! </button>
			</form>
		</div>
		<div class="box2">
			<button onclick="location.href='./listForm.fd'"> 맘에 들면 예약하러 GO! </button>
		</div>
    </div>
    
</main>
<!-- main -->
	
<!-- footer -->
<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->    
    
      
</body>
</html>