<%@page import="com.fooeating.action.RestaurantListAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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


</head>
<body>

<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sidemenu -->
	<jsp:include page="../inc/sideMenuOwner.jsp" />
<!-- sidemenu -->

<!-- main -->
<main>
<br><br>
	<h1>나의 가게 정보</h1>
	
	<fieldset>
	<div style="height:240px;">
	
	   <div style="text-align: right;" >
 	    <a href="./RestaurantUpdateProAction.on" style="text-decoration: none;">수정</a>
		<a href="" style="text-decoration: none;">삭제</a>
   	   </div>

		  <div style="margin-left: 1px">
		<table>
			<tr>
			<td>상호 : ${restal.name}</td>
			</tr>
			<tr>
			<td>가게 업종 : ${restal.category}	</td>
			</tr>
			<tr>
			<td>가게 주소 : ${restal.addr_city}	</td>
			</tr>
			<tr>
			<td>가게 번호 : ${restal.rest_tel }	</td>
			</tr>
			<tr>
			<td>영업 시간 : ${restal.runtime }	</td>
			</tr>
			<tr>
			<td>정기 휴무 : ${restal.dayoff }	</td>
			</tr>
		</table>
	    <br>
	    <div style="text-align: left;">
		<textarea rows="2" cols="110" placeholder="공지사항"></textarea>
		<input type="button" value="저장">
	</div>
	</div>
	
	</div>
	</fieldset> <!-- 영역 구분하려고 일단 넣어놓음 나중에 필요없으면 뺄거임 -->

</main>
<!-- main -->


<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
	
	
</body>
</html>