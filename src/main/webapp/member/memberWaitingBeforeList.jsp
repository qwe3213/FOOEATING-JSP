<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<hr>
		<h2>과거 대기 내역</h2>
		<c:forEach var="list" items="${queueHistory}">
			<table border="1">
				<tr>
					<td>가게명</td>
					<td>방문일자</td>
				</tr>
				<tr>
					<td>${list.rest_name}</td>
					<td>${list.regdate}</td>
				</tr>
			</table>
			<c:if test="${list.review_check == 1 }">
			<script>
   				var currentDate = new Date();  // 현재 날짜
    			var reviewDate = new Date('${list.regdate}');  // 리뷰 작성 가능한 날짜
    			var threeDaysLater = new Date(reviewDate.setDate(reviewDate.getDate() + 3));  // 리뷰 작성 가능한 날짜로부터 3일 뒤의 날짜

   				if (currentDate <= threeDaysLater) {
      				document.write('<button onclick="winopen(${list.wait_num})">리뷰 작성</button>');
    			} else {
      			// 작성 가능한 날짜 이전이므로 버튼을 비활성화하거나 보여주지 않음
    			}
  			</script>
			</c:if>
			<br>
			<br>
		</c:forEach>
		
		
		
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

		<a href="./MemberWaitingList.foo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


		<a href="./MemberWaitingList.foo?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


		<a href="./MemberWaitingList.foo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>