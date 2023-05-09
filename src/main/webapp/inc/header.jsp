<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<header>
		
	<!-- 로그인 안했을 때 -->
	<c:if test="${empty user_id }" >
		<div class="links">
		  <a href="./MemberLogin.foo" class="link_text">로그인</a>
		  <a href="./MemberJoin.foo" class="link_text">회원가입</a>
		  <a href="./ownerChangeForm.on" class="link_text">사업자등록</a>
		</div>
	</c:if>
	
	<!-- 로그인 했을 때 -->
	<c:if test="${!empty user_id }" >
		<div class="links">
		  <a href="./MemberLogout.foo" class="link_text">로그아웃</a>
		  
		  <!-- 마이페이지 (관리자 || 회원) -->
		  <c:choose>
		  	<c:when test="${user_id.equals('real_admin')}" >
		  		<a href="./UserInfoList.ad" class="link_text">마이페이지</a>
		  	</c:when>
		  	<c:otherwise>
		  		<a href="./MyPageMember.foo" class="link_text">마이페이지</a>
		  	</c:otherwise>
		  </c:choose>

		  <a href="./ownerChangeForm.on" class="link_text">사업자등록</a>
		</div>
		<div class="ft">${user_id }님, 환영합니다 !</div>
	</c:if>
	
	<nav>
	  <div class="nav_items">
	    <ul>
	  	  <li><a href="./Main.foo">ㅤHOMEㅤ</a></li>
	      <li><a href="#">ㅤCATEGORYㅤ</a></li>
	      <li><a href="#">ㅤPUDDINGㅤㅤ</a></li>
	      <li><a href="./NoticeList.foo">ㅤNOTICEㅤ</a></li>
	    </ul>
	  </div>
	</nav>
    
</header>