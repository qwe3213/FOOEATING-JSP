<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>상세페이지</h1>
		
		<table border="1">
		<tr>
			<td rowspan="8">${restInfo.file_out}</td>
			<th>상호명</th>
			<td>${restInfo.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${restInfo.addr_city} ${restInfo.addr_district} ${restInfo.addr_etc}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${restInfo.rest_tel}</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>${restInfo.category}</td>
		</tr>
		<tr>
			<th>영업 시간</th>
			<td>${restInfo.runtime}</td>
		</tr>
		<tr>
			<th>메뉴</th>
			<td></td>
		</tr>
		<tr>
			<th>편의시설</th>
			<td>${restInfo.convenience}</td>
		</tr>
		<tr>
			<th>가게 공지사항</th>
			<td>${restInfo.rest_notice}</td>
		</tr>
	</table>
	
	<br>
	
	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
</body>
</html>