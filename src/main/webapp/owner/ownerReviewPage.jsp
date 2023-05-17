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

</body>
</html>