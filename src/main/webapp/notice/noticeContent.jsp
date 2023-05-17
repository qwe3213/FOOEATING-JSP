<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

</head>
<body>


<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sideMenu -->
	<jsp:include page="../inc/sideMenuNotice.jsp" />
<!-- sideMenu -->

<!-- main -->
<main>
<br><br>
<table border="1">
	<tr>
		<th>No</th>
		<td>${dto.notice_num}</td>
		<th>제목</th>
		<td>${dto.subject }</td>
		<th>작성일</th>
		<td>${dto.regdate }</td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
		<td colspan="6">${dto.content }</td>
	</tr>
</table>


<!-- dto 객체 저장 -->
<c:set var="dto" value="${dto }" scope="request"/>





<!-- 모두 가능 -->
<input type="button" value="목록으로" onclick="location.href='./NoticeList.foo?pageNum=${pageNum}';">

<!-- 관리자만 가능 -->
<c:if test="${user_id.equals('real_admin') }" >
	<form action="./NoticeUpdateAction.foo?pageNum=${pageNum }&notice_num=${dto.notice_num }" method="post">
		<input type="hidden" name="dto" value="${dto }">
		<input type="submit" value="수정하기">
	</form>
	
	<form action="./NoticeDeleteAction.foo?pageNum=${pageNum }&notice_num=${dto.notice_num }" method="post">
		<input type="hidden" value="${dto }">
		<input type="submit" value="삭제하기" >
	</form>
</c:if>
</main>
<!-- main -->


<!-- footer -->
	<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->


</body>
</html>