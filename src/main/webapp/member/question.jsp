<%@page import="com.mysql.cj.protocol.ValueDecoder"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 숨김 처리 */
    .hidden {
        display: none;
    }
</style>
</head>
<body>
	
	<%
// 		List<String> list = new ArrayList<String>();
		List<Map<Integer, String>> listMap = new ArrayList<>();
		
// 		list.add("매운 음식을 좋아하시나요?");
// 		list.add("든든한 음식을 원하시나요?");
// 		list.add("당신은 쌍커풀이 있으신가요?");
// 		list.add("우울하신가요?");
// 		list.add("날씨가 흐린가요?");
// 		list.add("따뜻한 음식을 드시고 싶나요?");
// 		list.add("비건이신가요?");
// 		list.add("가성비를 원하시나요?");
// 		list.add("혼자 드시나요?");
// 		list.add("특별한 날인가요?");
// 		list.add("해장을 원하시나요?");
// 		list.add("적당히 살다 가고싶나요?");
// 		list.add("솔로이신가요?");
// 		list.add("술 한잔 걸치시나요?");
// 		list.add("이성에게 관심이 많으신가요?");
// 		list.add("분위기 있는 장소를 원하시나요?");
// 		list.add("당신은 인싸이신가요?");
// 		list.add("나이키 신발을 신을 예정이신가요?");
// 		list.add("본인의 성함은 !!정창원!!!이신가요?");
// 		list.add("탄단지를 원하시나요??");
// 		list.add("30대 이상이신가요?");
		
		Map<Integer, String> map = new HashMap<>();
		map.put(0, "매운 음식을 좋아하시나요?");
		map.put(1, "든든한 음식을 원하시나요?");
		map.put(2, "당신은 쌍커풀이 있으신가요?");
		map.put(3, "우울하신가요?");
		map.put(4, "날씨가 흐린가요?");
		map.put(5, "따뜻한 음식을 드시고 싶나요?");
		map.put(6, "비건이신가요?");
		map.put(7, "가성비를 원하시나요?");
		map.put(8, "혼자 드시나요?");
		map.put(9, "특별한 날인가요?");
		map.put(10, "해장을 원하시나요?");
		map.put(11, "적당히 살다 가고싶나요?");
		map.put(12, "솔로이신가요?");
		map.put(13, "술 한잔 걸치시나요?");
		map.put(14, "이성에게 관심이 많으신가요?");
		map.put(15, "분위기 있는 장소를 원하시나요?");
		map.put(16, "당신은 인싸이신가요?");
		map.put(17, "나이키 신발을 신을 예정이신가요?");
		map.put(18, "본인의 성함은 !!정창원!!!이신가요?");
		map.put(19, "탄단지를 원하시나요??");
		map.put(20, "30대 이상이신가요?");
		
		listMap.add(map);
		
// 		Collections.shuffle(list);
		Collections.shuffle(listMap);
		
		// list -> listMap 변경
// 		for(int i = 0; i < list.size(); i++) {
		for (Map<Integer, String> m : listMap ) {
			for(int key : m.keySet()) {
		
	%>
	
<%-- 	<div id="question<%=i + 1%>" class="question hidden"> --%>
<!--         <fieldset> -->
<%--             <legend>질문 <%=i + 1%></legend> --%>
<%--             <%=list.get(i) %><br> --%>
<!--             <button onclick="answerQuestion(true)">Yes</button> -->
<!--             <button onclick="answerQuestion(false)">No</button> -->
<!--         </fieldset> -->
<!--     </div> -->
    
    <div id="question<%=key %>" class="question hidden">
        <fieldset>
            <legend>질문 <%=key %></legend>
            <%=m.get(key) %><br>
            <button onclick="answerQuestion(true); saveKey('<%=key%>')">Yes</button>
            <button onclick="answerQuestion(false)">No</button>
        </fieldset>
    </div>
    
	<%
			}
		}
	%>
	
	
		<button onclick="location.href='#''">다시하기</button>
	
	
	<script>
// 	// 자바 리스트를 자바스크립트 배열로 변환
// 	var javaList = Java.to(list, "java.lang.String[]");

// 	// 자바스크립트 콘솔에 값 출력
// 	console.log(javaList);
	
	const xhr = new XMLHttpRequest();
    const url = 'http://example.com/your-api-endpoint';
        var answer = [];
        var currentQuestion = 1;
        var totalQuestion = 10;
        var keys = [];
        var keysStr = "";
        
     	// 배열 값을 인코딩하여 queryString 변수에 할당
        for (var i = 0; i < keys.length; i++) {
        	keysStr += encodeURIComponent("keys[" + i + "]") + "=" + encodeURIComponent(keys[i]) + "&";
        }
     	// queryString에서 마지막 '&' 문자 제거
        keysStr = keysStr.substring(0, keysStr.length - 1);
     	
     	// JSP 페이지로 전달하는 URL 생성
        var reurl = "result.jsp?" + keysStr;
        
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
    

	
</body>
</html>