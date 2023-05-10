<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>당신에게 추천해드리는 음식</h1>
	
	<%
	
		String queryString = request.getQueryString(); // 현재 URL의 쿼리 문자열을 가져옴
		String[] params = queryString.split("&"); // '&' 기준으로 문자열 분리
	
		String[][] paramPairs = new String[params.length][2]; // 2차원 배열 선언
	
		for (int i = 0; i < params.length; i++) {
			String[] pair = params[i].split("="); // '=' 기준으로 문자열 분리
			paramPairs[i][0] = pair[0]; // 첫 번째 배열 요소에는 쿼리 매개변수의 키(key)를 저장
			paramPairs[i][1] = java.net.URLDecoder.decode(pair[1], "UTF-8"); // 두 번째 배열 요소에는 쿼리 매개변수의 값(value)를 저장
		}
		  
		  
		  	// 파라미터 출력??!?
// 			String param0 = request.getParameter("param0");
// 		    String param1 = request.getParameter("param1");
// 		    out.println(param0);
// 		    out.println(param1);	
			
			// ?? 파람 출력?
// 			Map<String, String[]> paramMap = request.getParameterMap();
// 			for (String paramName : paramMap.keySet()) {
// 			  String[] paramValues = paramMap.get(paramName);
// 			  System.out.println(paramName + ": " + Arrays.toString(paramValues));
// 			}
	%>
	
	<ul>
    	<% for (int i = 0; i < paramPairs.length; i++) { %>
      		<li><%= paramPairs[i][0] %> : <%= paramPairs[i][1] %></li>
    	<% } %>
    </ul>
	
	<button onclick="location.href='questionList.jsp'">다시하기</button>
    <button onclick="location.href='#'">예약하러 가기</button>
    

</body>
</html>