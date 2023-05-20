	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<nav id="sub_menu" style="margin-top: 150px;">
<ul>
<li><a href="./OwnerMainPageRstcareAction.on">가게 관리</a></li>
<li><a href="./OwnerWaitingList.on">대기 관리</a></li>
<li><a href="./ownerReviewPage.on">리뷰 관리</a></li>
<li><a href="./ownerMenuAdd.on">메뉴 추가</a></li>
<c:if test="${!user_id.equals(owner_user_id)}">
	<li><a href="./MemberUpdate.foo">회원정보수정</a></li>
</c:if>
<c:if test="${user_id.equals(owner_user_id)}">
	<li><a href="./MemberUpdate.foo">회원정보수정</a></li>
</c:if>
</ul>
</nav>