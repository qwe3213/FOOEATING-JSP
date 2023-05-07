<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteReview() {
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
	  	 return true;
		}
		else {
	  	 alert('삭제가 취소되었습니다.');
	  	 return false;
		}	
	}
	

	


</script>
 

</head>
<body>
		<h1>리뷰 관리</h1>
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>


		<c:forEach var="dto" items="${reviewList}" >
		<table border="1">
		<tr>
			<td colspan="2">${dto.name }</td>
		</tr>	
		<tr>
			<td>${dto.grade }</td>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<td colspan="2">${dto.content }</td>
		</tr>
		
		</table>
		<form action="reviewUpdate.foo" method="post" >
			<input type="hidden" name="user_id" value="${user_id }">
			<input type="hidden" name="review_num" id="review_num" value="${dto.review_num }">
			<button>수정</button>
		</form>
		
		<form action="reviewDelete.foo" method="post" onsubmit="return deleteReview()" >
			<input type="hidden" name="user_id" value="${user_id }">
			<input type="hidden" name="review_num" id="review_num" value="${dto.review_num }">
			<button>삭제</button>
		</form>
		
		</c:forEach>
		
		
		
</body>
</html>