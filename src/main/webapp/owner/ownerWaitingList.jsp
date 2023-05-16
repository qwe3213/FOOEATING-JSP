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


<%
int count = (int)request.getAttribute("count");
int pageSize = (int)request.getAttribute("pageSize");
int currentPage = (int)request.getAttribute("currentPage");
String pageNum = (String)request.getAttribute("pageNum");

if(count != 0) {
	int pageBlock = 1;
	int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
	int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	
	if(startPage > pageBlock) {
%>

				<a href="./OwnerWaitingList.on?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


				<a href="./OwnerWaitingList.on?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


				<a href="./OwnerWaitingList.on?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>


</main>
<!-- main -->








<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
<!-- footer -->


</body>
</html>