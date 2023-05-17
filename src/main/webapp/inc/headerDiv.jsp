<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<header class="header-area header-sticky">
    <div class="container">
        <div class="row" >
            <div class="col-12">
                <nav class="main-nav">
                
                    <!-- ***** 로고 Start ***** -->
<!--                     <a href="./Main.foo" class="logo"> -->
<!--                         <img src="./img/푸이팅.png" width="113px"> -->
<!--                     </a> -->
                    <!-- ***** 로고 End***** -->
                    
                    <!-- ***** 메뉴 Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="./Main.foo" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="./listForm.fd">Category</a></li>
                    </ul>
                       	<!-- ***** 로고 Start ***** -->
                       	<a href="./Main.foo" class="logo">
                        	<img src="./img/푸이팅.png" width="113px">
	                    </a>
	                    <!-- ***** 로고 End***** -->
                       		 <!-- 드롭다운 목록 -->
<!--                             <li class="submenu"> -->
<!--                                 <a href="javascript:;">Drop Down</a> -->
<!--                                 <ul> -->
<!--                                     <li><a href="#">Drop Down Page 1</a></li> -->
<!--                                     <li><a href="#">Drop Down Page 2</a></li> -->
<!--                                     <li><a href="#">Drop Down Page 3</a></li> -->
<!--                                 </ul> -->
<!--                             </li> -->
                    <ul class="nav" style="margin-left: 0px;">
                        <li class="scroll-to-section"><a href="#">Pudding</a></li>
                        <li class="scroll-to-section"><a href="./NoticeList.foo">Notice</a></li>
                    </ul>
                        
                        
                        <!-- 오른쪽 아래에 띄우고 싶은데... ul + li 합쳐야만 css 적용됨 -->
                        <div style="float: right; font-size: small;">
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
								      <a href="./Main.foo">MyPage</a>
								   </c:when>
								   <c:otherwise>
								  	  <a href="./MyPageMember.foo">MyPage</a>
								   </c:otherwise>
								</c:choose>
								
								<c:if test="${empty owner_user_id && !user_id.equals('real_admin')}">
								   <a href="./MyPageMember.foo">Business registration</a>
								</c:if>
								
							</c:if>
						</div>
                      
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** 메뉴 End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>