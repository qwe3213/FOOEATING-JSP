<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h2> 음식의 종류를 선택하세요. </h2>
		<form action="./RecommendList.ad" method="GET">
			<input type="hidden" name="foodMenu" value="kf">
			<button type="submit">한식</button>
		</form>
	</div><br>
	<div>
		<form action="./RecommendList.ad" method="GET">
			<input type="hidden" name="foodMenu" value="wf">
			<button type="submit">양식</button>
		</form>
	</div><br>
	<div>
		<form action="./RecommendList.ad" method="GET">
			<input type="hidden" name="foodMenu" value="cf">
			<button type="submit">중식</button>
		</form>
	</div><br>
	<div>
		<form action="./RecommendList.ad" method="GET">
			<input type="hidden" name="foodMenu" value="jf">
			<button type="submit">일식</button>
		</form>
	</div><br>
	<div>
		<form action="./RecommendList.ad" method="GET">
			<input type="hidden" name="foodMenu" value="sf">
			<button type="submit">분식</button>
		</form>
	</div>
	
</body>
</html>