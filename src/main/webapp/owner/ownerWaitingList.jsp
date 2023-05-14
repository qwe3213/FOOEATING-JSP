<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- JavaScript -->
<script type="text/javascript">

// 1. 호출 버튼
function call(){
	var call = confirm('호출하시겠습니까?');
	if(call){
		return true;
	}else{
		return false;
	}
}

// 2. 완료 버튼
function done(){
	var done = confirm('호출하시겠습니까?');
	if(done){
		return true;
	}else{
		return false;
	}
}

// 3. on & off 버튼
function onOff(){
	var on = confirm('가게를 Open 하시겠습니까?');
	var off = confirm('가게를 Close 하시겠습니까?');

}

</script>


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

<h1></h1>		<!-- 남은 팀 수, 회원대기번호, 회원이름, 회원전화번호, 회원인원수 -->

<table border="1">
	<tr>
		<th>대기 번호</th>
		<th>회원 이름</th>
		<th>전화번호</th>
		<th>인원수</th>
	</tr>
	
	<c:forEach var="dto" items="${requestScope.waitingList }">
	<tr>
		<td>${dto.wait_num }</td>
		<td>${dto.name }</td>
		<td>${dto.phone }</td>
		<td>${dto.people }</td>
	</tr>
	</c:forEach>

</table>


</main>
<!-- main -->








<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
<!-- footer -->


</body>
</html>