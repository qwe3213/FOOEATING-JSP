<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1" bordercolor = "blue">
<tr>
<td>유저 아이디</td>
<td>리뷰내용</td>
<td>리뷰작성일</td>
<td>별점</td>
</tr>

<c:forEach var="dto" items="${reviewList}">
<tr>
<td>${dto.user_id}</td>
<td>${dto.content}</td>
<td>${dto.regdate}</td>
<td>${dto.grade}</td>
</tr>
</c:forEach>
</table>


<!-- 페이징처리 -->
<%
int count = (int)request.getAttribute("count");
int pageSize = (int)request.getAttribute("pageSize");
int currentPage = (int)request.getAttribute("currentPage");
String pageNum = (String)request.getAttribute("pageNum");

if(count != 0) {
	int pageBlock = 5;
	int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
	int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	
	if(startPage > pageBlock) {
%>

		<a href="./ownerReviewPage.on?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


		<a href="./ownerReviewPage.on?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


		<a href="./ownerReviewPage.on?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>

</body>
</html>