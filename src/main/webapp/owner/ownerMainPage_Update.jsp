<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> ownerMainPageUpdate.jsp </h1>
	
	<fieldset style="float:left;">
	
	<div style="height:240px; vertical-align: middle; display: table-cell;">
	<h3 style="margin: 10px;"><b>마이페이지</b></h3>
		<ul style="list-style:none; padding-left:0px;">
			<li style="margin: 10px;">
				<div>
					<a href="./owmerMainPage_rstcare.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/store.png" width="20" height="20">
					</a>
					<a href="./owmerMainPage_rstcare.on" style="text-decoration: none;">가게 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./owmerMainPage_wating.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/people.png" width="20" height="20">
					</a>
					<a href="./owmerMainPage_wating.on" style="text-decoration: none;">대기 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./owmerMainPage_review.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/review.png" width="20" height="20">
					</a>
					<a href="./owmerMainPage_review.on" style="text-decoration: none;">리뷰 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./owmerMainPage_memberInfo.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/note.png" width="20" height="20">
					</a>
					<a href="./owmerMainPage_memberInfo.on" style="text-decoration: none;">회원정보 수정</a>
				</div>
			</li>
		</ul>
	</div>
	</fieldset> <!-- 영역 구분하려고 일단 넣어놓음 나중에 필요없으면 뺄거임 -->
	
	<fieldset style="height:240px;">
 			<legend>FOOEATING 회원(점주) 정보 수정</legend>
 			
	 		<form action="./MemberUpdateProAction.foo" method="post" name="fr" onsubmit="return checkData();" id="fr">
 			 	아이디 : <input type="text" name="user_id" value="${dto.user_id }" readonly="readonly"><br>
 			 	비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
 			 	<input type="button" value="비밀번호 변경" onclick="winopen()"><br>
 			 	이름 : <input type="text" name="name" value="${dto.name }" id="name"><br>
 			 	<div id="namediv" class="errorDiv"></div>
 			 	이메일 : <input type="email" name="email" value="${dto.email }" readonly="readonly"><br>
 			 	휴대전화 : <input type="text" name="phone" value="${dto.phone }" id="phone"> 
 			 	<div id="phonediv" class="errorDiv"></div>       
 			 	<hr>      
 			 	<input type="submit" value="회원정보 수정">
 			 	<input type="button" value="회원 탈퇴" onclick="winopen2()"><br>
 		
 			</form>
 		</fieldset>
</body>
</html>