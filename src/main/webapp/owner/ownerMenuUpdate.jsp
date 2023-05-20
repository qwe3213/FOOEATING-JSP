<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/question.css">

<title>메뉴 추가</title>


</head>
<body>
		<h2> 메뉴 정보 수정</h2>
		<form action="OwnerMenuUpdateAction.on?rest_menu_num=${dto.rest_menu_num }" method="post" enctype="multipart/form-data" name="fr">
		    <br>
			<br>
			메뉴 이름 : <input type="text" name="menu_name" value="${dto.menu_name }"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions" value="${dto.menu_descriptions }"> <br>
			메뉴 가격 : <input type="text" name="price" value="${dto.price }"> <br>
			기존 이미지 : <br>
			<img src="./upload/${dto.menufile}" width="100px" height="150px"><br>
			수정 메뉴 이미지<br>
			<input type="file" name="menufile"> <br>
			<input type="submit" value="수정" >
		</form>
		
</body>
</html>