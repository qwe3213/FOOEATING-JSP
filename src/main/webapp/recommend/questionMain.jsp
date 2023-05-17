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
	<div class="dvh"><h2> 음식의 종류를 선택하세요. </h2></div>
	<div class="container">
		<div class="box">
			<form action="./RecommendList.ad" method="GET">
				<input type="hidden" name="foodMenu" value="kf">
				<button type="submit">한식</button>
			</form>
		</div><br>
		<div class="box">
			<form action="./RecommendList.ad" method="GET">
				<input type="hidden" name="foodMenu" value="wf">
				<button type="submit">양식</button>
			</form>
		</div><br>
		<div class="box"> 
			<form action="./RecommendList.ad" method="GET">
				<input type="hidden" name="foodMenu" value="cf">
				<button type="submit">중식</button>
			</form>
		</div><br>
		<div class="box">
			<form action="./RecommendList.ad" method="GET">
				<input type="hidden" name="foodMenu" value="jf">
				<button type="submit">일식</button>
			</form>
		</div><br>
		<div class="box">
			<form action="./RecommendList.ad" method="GET">
				<input type="hidden" name="foodMenu" value="sf">
				<button type="submit">분식</button>
			</form>
		</div>
	</div>
	

	
</main>
<!-- main -->
	
<!-- footer -->
<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->
	
</body>
</html>