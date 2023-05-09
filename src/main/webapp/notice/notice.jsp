<%@page import="com.fooeating.db.PublicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- css 파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">


<title>NOTICE</title>
</head>
<body>


<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->





<!-- side menu -->
	<jsp:include page="../inc/sideMenu.jsp" />
<!-- side menu -->





<!-- main -->
<main>
<br><br>


<!-- 관리자일 때만 글쓰기 버튼 활성화  -->
<c:if test="${!empty user_id && user_id.equals('real_admin')}">
	<input type="button" value="글 작성하기" onclick="location.href='./NoticeWrite.foo';">
</c:if>




<%
	String pageNum = request.getParameter("pageNum");
%>



<!-- 공지사항 리스트 출력-->
<table border="1">
	<tr>
		<th>no</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var="dto" items="${requestScope.noticeList }" >
		<tr>
			<td>${dto.notice_num }</td>
			<td>
				<form action="./NoticeContentAction.foo" method="post">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="notice_num" value="${dto.notice_num}">
					<input type="submit" value="${dto.subject} ">
				</form>
			</td>
			<td>${dto.regdate }</td>
		</tr>
	</c:forEach>
</table>



<!-- 이전 / 페이징 번호 / 다음 -->
<%
	int count = (int)request.getAttribute("count");
	int pageSize = (int)request.getAttribute("pageSize");
	int currentPage = (int)request.getAttribute("currentPage");
	
	if(count != 0) {
		int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(startPage > pageBlock) {
%>
			<a href="./NoticeList.foo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
<%
		}
		for(int i = startPage; i <= endPage; i++) {
%>
			<a href="./NoticeList.foo?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
		if(endPage < pageCount) {
%>
			<a href="./NoticeList.foo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
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