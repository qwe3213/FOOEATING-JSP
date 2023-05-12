<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>index.jsp</h1>


<%
	// MVC 프로젝트의 시작지점
	// 해당 프로젝트에서 실행가능한 유일한 jsp페이지
	// -> 만약,  실행시킨 페이지 주소가 ~.jsp로 동작한다면 구현 잘못한 것.
	
	
	// 가상주소 바로가기
// 	response.sendRedirect("./가상주소.foo");
	response.sendRedirect("./Main.foo");
// 	response.sendRedirect("./MyPageMember.foo");
// 	response.sendRedirect("./NoticeList.foo");
// 	response.sendRedirect("./FaqList.foo");

	
	// -> webapp 폴더 밑에 있는 해당 가상주소로 이동
	// -> 가상주소는 MemberFrontController.java에서 서블릿으로 매핑했으므로 해당 페이지로 이동.
	// -> 즉,  컨트롤러로 이동.
%>




</body>
</html>