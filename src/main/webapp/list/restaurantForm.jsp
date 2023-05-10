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
			<td rowspan="8">${restForm.file_out}</td>
			<th>상호명</th>
			<td>${restForm.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${restForm.addr_city} ${restForm.addr_district} ${restForm.addr_etc}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${restForm.rest_tel}</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>${restForm.category}</td>
		</tr>
		<tr>
			<th>영업 시간</th>
			<td>${restForm.runtime}</td>
		</tr>
		<tr>
			<th>메뉴</th>
			<td></td>
		</tr>
		<tr>
			<th>편의시설</th>
			<td>${restForm.convenience}</td>
		</tr>
		<tr>
			<th>가게 공지사항</th>
			<td>${restForm.rest_notice}</td>
		</tr>
	</table>
	
	<br>
	
	<button onclick="location.href='./listForm.fd'">가게 리스트로</button>
</body>
</html>