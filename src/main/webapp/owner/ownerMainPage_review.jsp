<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> ownerMainPage_review.jsp </h1>
	
	<fieldset style="float:left;">
	
	<div style="height:240px; vertical-align: middle; display: table-cell;">
	<h3 style="margin: 10px;"><b>마이페이지</b></h3>
		<ul style="list-style:none; padding-left:0px;">
			<li style="margin: 10px;">
				<div>
					<a href="./ownerMainPage_rstcare.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/store.png" width="20" height="20">
					</a>
					<a href="./ownerMainPage_rstcare.on" style="text-decoration: none;">가게 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./ownerMainPage_wating.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/people.png" width="20" height="20">
					</a>
					<a href="./owmerMainPage_wating.on" style="text-decoration: none;">대기 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./ownerMainPage_review.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/review.png" width="20" height="20">
					</a>
					<a href="./ownerMainPage_review.on" style="text-decoration: none;">리뷰 관리</a>
				</div>
			</li>
			<li style="margin: 10px;">
				<div>
					<a href="./ownerMainPage_memberInfo.on" style="text-decoration: none;">
					<img src="../owner/ownerImg/note.png" width="20" height="20">
					</a>
					<a href="./ownerMainPage_memberInfo.on" style="text-decoration: none;">회원정보 수정</a>
				</div>
			</li>
		</ul>
	</div>
	</fieldset> <!-- 영역 구분하려고 일단 넣어놓음 나중에 필요없으면 뺄거임 -->
	
	<fieldset style="height: 240px;">
		<fieldset>
			<div style="float: left; margin-right: 8px;">
				<img src="${file }" width="100px;" height="100px;">
			</div>
			<div>
				
			</div>
		</fieldset>
	</fieldset>
	
</body>
</html>