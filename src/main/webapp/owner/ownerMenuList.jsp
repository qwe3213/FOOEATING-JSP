<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function winopen(menuNum){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
	
		window.open("OwnerMenuUpdate.on?menuNum="+menuNum+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
		}
	
	function winopen2(rest_id){
		let popupX = (window.screen.width / 2) - (500 / 2);
		let popupY= (window.screen.height /2) - (300 / 2);
	
		window.open("OwnerMenuAdd.on?rest_id="+rest_id+"","","width=500, height=300, left="+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
		}
	
	function deleteMenu() {
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
  		 return true;
		} else {
  		 alert('삭제가 취소되었습니다.');
  	 	return false;
		}	
	}


</script>

</head>
<body>

 			<h2> FOOEATING 가게 메뉴 정보</h2>
 			
 			<c:forEach var="list"  items="${menuList }">
			<table border="1">
				<tr>
					<td>
					<img src="./upload/${list.menufile}" width="100px" height="150px"><br>
					${list.menu_name }<br>
					${list.price }<br>
					${list.menu_descriptions }<br>
					</td>
				</tr>
			</table>
			<button onclick="winopen(${list.rest_menu_num})">메뉴 수정</button>
			<form action="./OwnerMenuDelete.on" method="post"
				onsubmit="return deleteMenu()">
				<input type="hidden" name="rest_menu_num" id="rest_menu_num"
					value="${list.rest_menu_num }">
				<button>삭제</button>
			</form>
			</c:forEach>
			<c:if test="${fn:length(menuList)< 3 }">
			<hr>
			
			<button onclick="winopen2(${menuList[0].rest_id});">메뉴 추가</button>
			</c:if>
			
 		



</body>
</html>