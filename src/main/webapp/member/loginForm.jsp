<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

// ID & PW 유효성 체크
$(document).ready(function(){
	
	$(document).ready(function(){
	    $('div').css({
	        'font-size' : '0.7em',
	        'color' : 'red'
	    });
	    
	     $("#fr").on("submit", function(e) {
	         if(fr.user_id.value ==""){
	             e.preventDefault();
	             $('#divid').html("아이디를 입력하세요.");
	         } else{
	             $('#divid').html("");
	         }
	         
	         if(fr.pw.value ==""){
	             e.preventDefault();
	             $('#divpw').html("비밀번호를 입력하세요.");
	         } else{
	             $('#divpw').html("");
	         }
	         
	     }); 
	});
	
});

</script>

</head>
<body>


<h1>LOGIN</h1>


<fieldset>
	<legend>FOOEATING 로그인</legend>
	
	<form action="./MemberLoginAction.foo" id="fr" method="post">
		아이디 : <input type="text" id="id" name="user_id"> <br>
		<div id="divid"></div>
		비밀번호 : <input type="password" id="pw" name="pw"> <br>
		<div id="divpw"></div>
		<hr>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='./MemberJoin.foo';">
	</form>
	
</fieldset>

</body>
</html>