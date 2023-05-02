<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

// DB의 id와 pw정보 일치시 로그인 가능
// id와 pw 작성 안하고 로그인 클릭시 focus 함수와 return false로 로그인 막기

</script>

</head>
<body>


<h1>LOGIN</h1>


<fieldset>
	<legend>FOOEATING 로그인</legend>
	
	<form action="./MemberLoginAction.foo" method="post">
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="password" name="pw"> <br>
		<hr>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='./MemberJoin.foo';">
	</form>
	
</fieldset>


</body>
</html>