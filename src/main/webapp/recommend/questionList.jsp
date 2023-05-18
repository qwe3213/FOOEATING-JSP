<%@page import="java.net.URLEncoder"%>
<%@page import="java.awt.Menu"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
<link href="./css/question.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css">


<title>PUDDING</title>
<style>
    /* 숨김 처리 */
    .hidden {
        display: none;
    }
    .visible {
		display: block;
	}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../inc/headerDiv.jsp" />
<!-- header -->

<!-- main -->
<main>
	
	<%
		String foodMenu = request.getParameter("foodMenu");
	%>
	
	<%
		List<String> list = new ArrayList<String>();
	
		if(foodMenu.equals("kf")){ // 한식
			list.add("매운거 잘 먹어요?"); // 닭발 
			list.add("날 것 드실줄 아시나요?"); // 게장 
			list.add("나이키 신발을 신을 예정이신가요?"); // 갈비찜
			list.add("가성비를 원하시나요?"); // 국밥
			list.add("퓨전 음식 어떠세요??"); // 낙곱새 
			list.add("당신은 인싸이신가요?"); // 족발
			list.add("분위기 있는 장소를 원하시나요?"); // 갈비찜
			list.add("특별한 날인가요?"); // 삼겹살
			list.add("해장을 원하시나요?"); // 국밥
			list.add("하루하루 즐기며 살고 계신가요?"); // 치킨
			list.add("현재 날씨가 흐린가요?"); // 탕
			list.add("숙면에 불편함이 있으십니까?"); // 삼겹살
			list.add("탄단지를 원하시나요?"); // 비빔밥
			list.add("쌀밥을 찾으시나요?"); // 비빔밥
			list.add("호불호 없는 음식 어때?"); // 치킨   
			list.add("봄, 가을에 제철 음식 어때요?"); // 게장 
			list.add("부산에 오면 먹어야 하는 음식 어때요?"); // 낙곱새
			list.add("무난한 음식 찾으세요?"); // 찌개
			list.add("2차로 가기 좋은 곳 어때요?"); // 닭발
			list.add("먹어도 살찌는 음식 괜찮으세요?"); // 족발
			list.add("여러 명에서 드시나요?"); // 탕
			list.add("골고루 잘 드시나요?"); //  찌개
		}
		else if(foodMenu.equals("wf")){ // 양식
			list.add("여러 명에서 드시나요?"); // 피자 
			list.add("당신은 지금 우울하신가요?"); // 함박스테이크
			list.add("나이키 신발을 신을 예정이신가요?"); // 리조또
			list.add("가성비를 따지시나요?"); // 햄버거
			list.add("녹색 음식이 땡기시나요?"); // 시저셀러드
			list.add("당신은 인싸이신가요?"); // 스파게티
			list.add("분위기 있는 장소를 원하시나요?"); // 스테이크
			list.add("특별한 날인가요?"); // 스테이크
			list.add("해장을 원하시나요?"); // 햄버거
			list.add("하루하루 즐기며 살고 계신가요?"); // 스파게티
			list.add("현재 날씨가 흐린가요?"); // 함박스테이크
			list.add("숙면에 불편함이 있으십니까?"); //시저셀러드
			list.add("탄단지를 원하시나요?"); // 피자
			list.add("쌀밥을 찾으시나요?"); // 리조또 

		}
		else if(foodMenu.equals("cf")){ // 중식
			list.add("여러 명에서 드시나요?"); // 탕수육
			list.add("지금 기분이 좋으신가요?"); // 짜장면
			list.add("오늘 맥주 드시나요?"); // 양꼬치
			list.add("가성비를 따지시나요?"); // 짬뽕
			list.add("고기 어떠세요?"); // 양꼬치
			list.add("당신은 인싸이신가요?"); // 마라탕
			list.add("골고루 잘 드시나요?"); // 고추잡채
			list.add("특별한 날인가요?"); // 고추잡채
			list.add("해장을 원하시나요?"); // 짬뽕
			list.add("하루하루 즐기며 살고 계신가요?"); // 짜장면
			list.add("현재 날씨가 흐린가요?"); // 마파두부
			list.add("숙면에 불편함이 있으십니까?"); // 볶음밥
			list.add("탄단지를 원하시나요?"); // 마파두부
			list.add("쌀밥을 찾으시나요?"); // 볶음밥
			list.add("마라 드실 줄 아시나요?"); // 마라탕
			list.add("탕수육 찍먹 이신가요?"); // 탕수육 
		}
		else if(foodMenu.equals("jf")){ // 일식
			list.add("여러 명에서 드시나요?"); // 회
			list.add("지금 기분이 좋으신가요?"); //우동
			list.add("오늘 쏘주 드시나요?"); // 회
			list.add("가성비를 따지시나요?"); // 우동
			list.add("회 드실 줄 아시나요?"); // 초밥
			list.add("당신은 인싸이신가요?"); // 라멘
			list.add("골고루 잘 드시나요?"); // 텐동
			list.add("특별한 날인가요?"); // 초밥
			list.add("해장을 원하시나요?"); // 라멘
			list.add("하루하루 즐기며 살고 계신가요?"); // 돈카츠
			list.add("현재 날씨가 더운가요?"); // 메밀소바
			list.add("탄단지를 원하시나요?"); // 돈카츠
			list.add("쌀밥을 찾으시나요?"); // 텐동
			list.add("찬 음식도 괜찮아요?"); // 메밀소바			
		}
		else if(foodMenu.equals("sf")){ // 분식
			list.add("당신 다이어트 중이야?"); // 샐러드
			list.add("기분이 꿀꿀하신가요?"); // 떡볶이
			list.add("혼밥 가능하신가요?"); // 김밥
			list.add("가성비를 따지시나요?"); // 토스트
			list.add("매운거 잘 먹어요?"); // 떡볶이 
			list.add("당신은 인싸이신가요?"); // 샌드위치
			list.add("옛날 어머니의 손맛 어떠세요?"); // 칼국수
			list.add("해장을 원하시나요?"); // 라면
			list.add("하루하루 즐기며 살고 계신가요?"); // 토스트
			list.add("날씨가 꾸리꾸리 한가요?"); // 칼국수
			list.add("탄단지를 원하시나요?"); // 샌드위치
			list.add("쌀밥을 찾으시나요?"); // 김밥
			list.add("풀 때기 어때요?"); // 샐러드
			list.add("고냥 간단하게 드실래요?"); // 라면			
		}
		
		Collections.shuffle(list);
	%>
<div id="top">
	<%
		for(int i = 0; i < list.size(); i++) {
	%>
	<div id="questionContainer">
		<div id="question<%=i + 1%>" class="question hidden" style="margin-top: 150px;">
	        <fieldset class="field">
	            <legend style="padding-bottom: 20px; font-weight : 600; ">질문 <%=i + 1%></legend>
	            <%=list.get(i)%><br>
	            <button onclick="answerQuestion(true); saveKey('<%=list.get(i) %>')" style="margin-top : 30px; margin-right: 30px;">
	            	Yes
	            </button>
	            <button onclick="answerQuestion(false)">No</button>
	        </fieldset>
	    </div>
    </div>
	<%
		}
	%>
	<div class="box" style="text-align: center;">
		<button onclick="location.href='./RecommendMain.ad'">다시하기</button>
	</div>
</div>
	
	<script>
		
        var answer = [];
        var arr = [];
        var currentQuestion = 1;
        var totalQuestion = <%=list.size() / 2%>; // 전체 질문 중 2로 나눈 수만큼 질문함
        var keys = [];
     	// 전달할 데이터
        var keysStr = "foodMenu=<%= URLEncoder.encode(foodMenu, "UTF-8") %>&";
        var reurl;
        
        // yes 버튼 클릭시 데이터를 keys[] 배열에 저장 -> 값을 넘겨주기 위함
        function saveKey(key) {
            keys.push(key);
            console.log(keys);
        }
        
        function answerQuestion(isYes) {
            if (isYes) {
                answer.push("yes"); 
                console.log(answer);
            }
            
            // 다음 질문으로 이동
            currentQuestion++;
            
            if (currentQuestion <= totalQuestion) {
               	showQuestion(currentQuestion);
            } else {
            	if (answer.length != 0) {
            		// 배열 값을 인코딩하여 queryString 변수에 할당
            		for (var i = 0; i < keys.length; i++) {
                    	keysStr += "param(" + i + ")=" + encodeURIComponent(keys[i]) + "&";
                    } // %20 ?? 문제?
            		// queryString에서 마지막 '&' 문자 제거
            		keysStr = keysStr.substring(0, keysStr.length - 1);
					reurl = "RecommendResult.ad?"+keysStr;
            		// jsp 페이지로 값 전달
            		window.location.href = reurl;
            	} else {
	                // 모든 질문에 대한 답변을 받았으므로 결과 페이지로 이동
	                alert("신중하게 선택해주세요^^");
            		window.location.reload();
            	}
            }
        }

        function showQuestion(questionNumber) {
            // 모든 질문을 숨김 처리
            var questions = document.getElementsByClassName("question");
            for (var i = 0; i < questions.length; i++) {
                questions[i].classList.add("hidden");
            }

            // 현재 질문만 보이게 함
            var currentQuestion = document.getElementById("question" + questionNumber);
            currentQuestion.classList.remove("hidden");
            
        }
        
        // 첫 번째 질문을 보여줌
        showQuestion(1);
    </script>
    
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