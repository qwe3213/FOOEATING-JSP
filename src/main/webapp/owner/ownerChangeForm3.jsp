<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <jsp:useBean id="ow1" class="com.fooeating.javabean.JavaBeanpt1" />
	 <jsp:setProperty property="*" name="ow1"/> 
	 <jsp:useBean id="ow2" class="com.fooeating.javabean.JavaBeanpt2" />
	 <jsp:setProperty property="*" name="ow2"/> 
	 <%=ow1 %> <!-- 정보 넘어오는지 확인 -->
	 <%=ow2 %> <!-- 정보 넘어오는지 확인 -->

	<h1>ownerChangeForm3.jsp</h1>
	
	<fieldset>
		<legend>step3</legend>
		<form action="./ownerChangeForm4.on" method="post">
			1. <br>
			메뉴 이름 : <input type="text"> <br>
			메뉴 소개 : <input type="text"> <br>
			메뉴 가격 : <input type="text"> <br>
			<input type="text"> 
			<input type="button" value="첨부파일"> <br>
			<br>
			2. <br>
			메뉴 이름 : <input type="text"> <br>
			메뉴 소개 : <input type="text"> <br>
			메뉴 가격 : <input type="text"> <br>
			<input type="text"> 
			<input type="button" value="첨부파일"> <br>
			<br>
			3. <br>
			메뉴 이름 : <input type="text"> <br>
			메뉴 소개 : <input type="text"> <br>
			메뉴 가격 : <input type="text"> <br>
			<input type="text"> 
			<input type="button" value="첨부파일"> <br>
			<br>
			<input type="button" value="이전" onclick="location.href='ownerChangeForm2.on'">
			<input type="submit" value="다음">
		</form>
	</fieldset>
</body>
</html>