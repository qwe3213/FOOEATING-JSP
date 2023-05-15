<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
// 	$(document).ready(function(){
// 		$.each(data,function(idx,obj){
// 			var tmp;
// 			tmp += "<td>"+obj.name+"</td>";
// 			tmp += "<td>"+obj+"</td>";
// 			tmp += "<td>"+obj.addr+"</td>";
// 			tmp += "<td>"+obj.gender+"</td>";
// 			tmp += "<td>"++"</td>";
			
// 			$('tr').append(tmp);
// 		});
// 	} // 몰라 나중에 볼래
</script>
</head>
<body>
	<h1>owmerMainPage_rstcare.jsp</h1>
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
	<fieldset>
	<div style="height:240px;">
	<div style="text-align: right;" >
		<a href="" style="text-decoration: none;">수정</a>
		<a href="" style="text-decoration: none;">삭제</a>
	</div>
	<div style="float: left;">
		<img src="../owner/ownerImg/store.png" width="150px;" style="margin-right: 10px;">
	</div>
	<div style="margin-left: 1px">
		<table>
			<tr>
			<td>가게 이름 :	</td>
			</tr>
			<tr>
			<td>가게 업종 :	</td>
			</tr>
			<tr>
			<td>가게 주소 :	</td>
			</tr>
			<tr>
			<td>가게 번호 :	</td>
			</tr>
			<tr>
			<td>영업 시간 :	</td>
			</tr>
			<tr>
			<td>정기 휴무 :	</td>
			</tr>
		</table>
	</div>
	<br>
	<div style="text-align: left;">
		<textarea rows="2" cols="110" placeholder="공지사항"></textarea>
		<input type="button" value="저장">
	</div>
	</div>
	</fieldset> <!-- 영역 구분하려고 일단 넣어놓음 나중에 필요없으면 뺄거임 -->
</body>
</html>