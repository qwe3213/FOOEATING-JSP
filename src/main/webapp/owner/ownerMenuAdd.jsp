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
	<div style="text-align: center;">
		<h2>메뉴 추가</h2>
			<form action="OwnerMenuAddAction.on" method="post" enctype="multipart/form-data" name="fr">
				<input type="hidden" name="rest_id" value="${param.rest_id }">
				<div style="margin-bottom: 5px;">
					메뉴 이름 : <input type="text" name="menu_name" > <br>
				</div> 
				<div style="margin-bottom: 5px;">
					메뉴 소개 : <input type="text" name="menu_descriptions" > <br>
				</div>
				<div style="margin-bottom: 5px;">
					메뉴 가격 : <input type="text" name="price"> <br>
				</div>
				<div style="margin-bottom: 10px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					메뉴 이미지 :<input type="file" name="menufile"> <br>
				</div>
				<hr>
				<input type="submit" value="메뉴 추가" style="background-color: #ff4742;
																color: #fff;
																border: none;
																border-radius: 10px;
																font-size:medium;
																font-weight: bold;" >
			</form>
		</div>

</body>
</html>