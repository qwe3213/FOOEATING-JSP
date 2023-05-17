<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

</head>
<body>

<!-- header -->
	<jsp:include page="../inc/header.jsp" />
<!-- header -->

<!-- sideMenu -->
	<jsp:include page="../inc/sideMenuNotice.jsp" />
<!-- sideMenu -->

<!-- main -->
<main>
<br><br>

<h1>공지사항 작성하기</h1>
<h3>관리자 전용</h3>

<fieldset>
	<form action="./NoticeWriteAction.foo" method="post" >

	제목 : <input type="text" name="subject"> <br>
	내용 : <textarea rows="20" cols="100" name="content"></textarea> <br>
	<hr>
	
	<input type="submit" value="작성하기">
	
	</form>
	
</fieldset>
</main>
<!-- main -->


<!-- footer -->
	<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->


</body>
</html>