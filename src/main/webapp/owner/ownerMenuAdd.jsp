<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 메뉴 추가</h2>
		<form action="OwnerMenuAddAction.on" method="post" enctype="multipart/form-data" name="fr">
		    <br>
		    <br>
			<input type="hidden" name="rest_id" value="${param.rest_id }">
			메뉴 이름 : <input type="text" name="menu_name" > <br>
			메뉴 소개 : <input type="text" name="menu_descriptions" > <br>
			메뉴 가격 : <input type="text" name="price"> <br>
			메뉴 이미지 :<input type="file" name="menufile"> <br>
			<input type="submit" value="메뉴 추가" >
		</form>


</body>
</html>