<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
		<tr>
			<th>No.</th>
			<th>가게이름</th>
			<th>전화번호</th>
			<th>편의사항</th>
			<th>id</th>
			<th>등록일</th>
			<th>휴무일</th>
		</tr>
		
		<c:forEach var="dto" items="${requestScope.restList }" varStatus="no">
	
		<tr>
			<td>${no.count}</td>
			<td>
			<form action="./restaurantForm.fd" method="post" >
					<input type="hidden" name="rest_id" value="${dto.rest_id}">
					<input type="submit" value="${dto.name}">
				</form>
			</td>
			<td>${dto.rest_tel}</td>
			<td>${dto.convenience}</td>
			<td>${dto.rest_id}</td>
			<td>${dto.regdate}</td>
			<td>${dto.dayoff}</td>
		</tr>
		</c:forEach>
	</table>
<%
		int count = (int)request.getAttribute("count");
		int pageSize = (int)request.getAttribute("pageSize");
		int currentPage = (int)request.getAttribute("currentPage");
		int pno = Integer.parseInt((String)request.getAttribute("pno"));
		
	
		
		if(count != 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = ((pno - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > pageBlock) {
	%>
				<a href="./gallery.fd?pno=<%=startPage - pageBlock%>">[이전]</a>
	<%
			}
			for(int i = startPage; i <= endPage; i++) {
	%>
				<a href="./gallery.fd?pno=<%=i%>">[<%=i%>]</a>
	<%
			}
			if(endPage < pageCount) {
	%>
				<a href="./gallery.fd?pno=<%=startPage + pageBlock%>">[다음]</a>
	<%
			}
		}
	%>

</body>
</html>