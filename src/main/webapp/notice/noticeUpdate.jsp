<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- NoticeUpdateAction.java에서 저장한 dto 객체 출력 -->

<form action="./NoticeContentActionPro.foo" method="post">

	<table border="1">
		<tr>
			<th>No</th>
			<td>${dto.notice_num}</td>
			<th>제목</th>
			<td><input type="text" name="subject" value="${dto.subject }"></td>
			<th>작성일</th>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6" ><textarea name="content" cols="70" rows="10">${dto.content }</textarea></td>
		</tr>
	</table>
	
	
	<input type="hidden" name="notice_num" value="${dto.notice_num }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="submit" value="수정하기" >
</form>


<input type="button" value="목록으로" onclick="location.href='./NoticeList.foo?pageNum=${pageNum}';">


</body>
</html>