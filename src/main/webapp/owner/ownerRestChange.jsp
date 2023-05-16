<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
 			<legend>FOOEATING 가게 정보 수정</legend>
 			
	 		<form action="RestaurantUpdateAction.on" method="post" id="fr">
 			 	상호명  :  <input type="text" name="name" value="${dto.name}"><br>
 			    편의시설 : <input type="text" name="convenience" value="${dto.convenience}"><br>
 			    휴무일  : <input type="text" name="dayoff" value="${dto.dayoff}"><br>
 			    영업시간 : <input type="text" name="runtime" value="${dto.runtime}"><br>
 			 	가게설명 : <input type="text" name="descriptions" value="${dto.descriptions }"><br>		 	
 			 	<input type="submit" value="가게정보 수정">
 			 	
 		
 			</form>
 		</fieldset>



</body>
</html>