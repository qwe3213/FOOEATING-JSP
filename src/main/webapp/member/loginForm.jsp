<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

// 이름이나 나이 입력안했으면 입력하라고 알림창 띄우기
// 조건문 -> if(document.fr.id.value == "")
$(document).ready(function(){

	$("#fr").on("submit", function (e) { 
		if(fr.id.value == "" && fr.pw.value == ""){
			$('#divid').html(function(){
			e.preventDefault();
			return "<font color='red'>아이디를 입력하세요.</font>";
			});
		}else if(fr.id.value == "" && fr.pw.value != ""){
			$('#divid').html(function(){
			e.preventDefault();
			return "<font color='red'>아이디를 입력하세요.</font>";
			});
		}else if(fr.pw.value == "" && fr.id.value != ""){
			$('#divpw').html(function(){
			e.preventDefault();
			return "<font color='red'>비밀번호를 입력하세요.</font>";
			});
		}
	});
});


</script>

</head>
<body>


<h1>LOGIN</h1>


<fieldset>
	<legend>FOOEATING 로그인</legend>
	
	<form action="./MemberLoginAction.foo" id="fr" method="post">
		아이디 : <input type="text" name="id"> <br>
		<div id="divid"></div>
		비밀번호 : <input type="password" name="pw"> <br>
		<div id="divpw"></div>
		<hr>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='./MemberJoin.foo';">
	</form>
	
</fieldset>

</body>
</html>