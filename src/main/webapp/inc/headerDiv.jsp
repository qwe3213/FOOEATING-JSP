<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="height: 15%;">
<header class="header-area header-sticky">
	<!-- 오른쪽 아래에 띄우고 싶은데... ul + li 합쳐야만 css 적용됨 -->
	<div>
		<div style="float: right; font-size: 1em; width: max-content; margin-left: 0%; padding-left: 100%;">
		
		<!-- 로그인 안했을 때 -->
			<c:if test="${empty user_id }" >
				<a href="./MemberLogin.foo">Login</a>
				<a href="./MemberJoin.foo">JoinUs</a>
				<a href="./ownerChangeForm.on">Business registration</a>
			</c:if>
								
		<!-- 로그인 했을 때 -->
			<c:if test="${!empty user_id }" >
				<a href="./MemberLogout.foo">Logout</a>
									
					<c:choose>
						<c:when test="${user_id.equals('real_admin')}" >
							<a href="./UserInfoList.ad">MyPage</a>
						</c:when>
						<c:when test="${user_id.equals(owner_user_id) }">
							<a href="./OwnerMainPageRstcareAction.on">MyPage</a>
						</c:when>
						<c:otherwise>
							<a href="./MemberWaitingList.foo">MyPage</a>
						</c:otherwise>
					</c:choose>
				
				<c:if test="${empty owner_user_id && !user_id.equals('real_admin')}">
					<a href="./ownerChangeForm.on">Business registration</a>
				</c:if>
			
			</c:if>
		</div>
	</div>
	
    <div class="container">
        <div class="row" >
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** 로고 Start ***** -->
					<a href="./Main.foo" class="logo">
                       	<img src="./img/푸이팅.png" width="130px">
                       	
                    </a>
                    <!-- ***** 로고 End***** -->
                    <!-- ***** 메뉴 Start ***** -->
                    <ul class="nav" style="display: none;">
                        <li class="scroll-to-section"><a href="./Main.foo" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="./listForm.fd">Category</a></li>
                        <li class="scroll-to-section"><a href="./RecommendMain.ad">Let's Giring</a></li>
                        <li class="scroll-to-section"><a href="./NoticeList.foo">Notice</a></li>
                    </ul>
                      
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** 메뉴 End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
</div>



