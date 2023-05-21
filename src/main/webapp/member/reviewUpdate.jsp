<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/question.css">
<script src="./js/jquery-3.6.4.js"></script>
<style type="text/css">
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:check{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* #myform label:hover ~ label{ */
/*     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); */
/* } */
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

</style>


</head>
<body>
	

		<c:if test="${empty user_id }" >
			<c:redirect url="./MemberLogin.foo"/>
		</c:if>
		
		<div style="text-align: center;"><h1>${dto.name }</h1></div>
		
		<form action="./ReviewUpdateAction.foo" method="post" id="myform">
			<input type="hidden" name="user_id" value="${user_id }">
			<input type="hidden" name="review_num" id="review_num" value="${dto.review_num }">
			<div style="text-align: center;">
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="grade" value="5" id="rate1"  
						<c:if test="${dto.grade == 5 }"> checked </c:if>
					><label
						for="rate1">★</label>
					<input type="radio" name="grade" value="4" id="rate2" 
						<c:if test="${dto.grade == 4 }"> checked </c:if>
					><label
						for="rate2">★</label>
					<input type="radio" name="grade" value="3" id="rate3" 
						<c:if test="${dto.grade == 3 }"> checked </c:if>
					><label
						for="rate3">★</label>
					<input type="radio" name="grade" value="2" id="rate4" 
						<c:if test="${dto.grade == 2 }"> checked </c:if>
					><label
						for="rate4">★</label>
					<input type="radio" name="grade" value="1" id="rate5" 
						<c:if test="${dto.grade == 1 }"> checked </c:if>
					><label
						for="rate5">★</label>
				</fieldset>
			</div>
			<div>
				<textarea class="col-auto form-control" type="text" name="newContent" id="reviewContents" >${dto.content }</textarea>
			</div>
			<div style="text-align: center;">
			<button class="btn-2">수정</button>
			</div>
		</form>
		
</body>
</html>