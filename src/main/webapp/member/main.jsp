<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">

<title>FOOEATING</title>

  <!-- 기본 세팅 -->
  <style>
    header {
      background: #e6e6e6;
      height: 215px;
    }
    main {
      background: #f2f4f7;
      min-height: 700px;
    }
    footer {
      height: 150px;
    }
  </style>
  
  
</head>
<body>


<!-- header -->
<header>
	
	<!-- 로고 -->
	<a href="#"><img src="./img/logo.png" class="img_logo"/></a> <br><br><br>
	
	<!-- 로그인 안했을 때 -->
	<c:if test="${empty user_id }" >
		<div class="links">
		  <a href="./MemberLogin.foo" class="link_text">로그인</a>
		  <a href="./MemberJoin.foo" class="link_text">회원가입</a>
		  <a href="#" class="link_text">사업자등록</a>
		</div>
	</c:if>
	
	<!-- 로그인 했을 때 -->
	<c:if test="${!empty user_id }" >
		<div class="links">
		  <a href="./MemberLogout.foo" class="link_text">로그아웃</a>
		  <a href="./MyPageMember.foo" class="link_text">마이페이지</a>
		  <a href="#" class="link_text">사업자등록</a>
		</div>
		<div class="ft">${user_id }님, 환영합니다 !ㅤ</div>
	</c:if>
	
	<nav>
	  <div class="nav_items">
	    <ul>
	  	  <li><a href="#">HOMEㅤㅤ</a></li>
	      <li><a href="#">CATEGORYㅤㅤ</a></li>
	      <li><a href="#">PUDDINGㅤㅤㅤ</a></li>
	      <li><a href="#">NOTICEㅤㅤ</a></li>
	    </ul>
	  </div>
	</nav>
    
</header>
<!-- header -->
	
	
	
	
	
<!-- main -->
<main>
	
	<!-- 관리자 계정(real_admin) 제어 -->
	<c:if test="${!empty user_id && user_id.equals('real_admin')}">
		<br><br>
		<h2>관리자 전용</h2>
		<input type="button" value="회원 목록" onclick="location.href='./UserInfoList.ad'">
		<input type="button" value="입점 가게 목록" onclick="location.href='./RestaurantList.ad'">
	</c:if>
	
</main>
<!-- main -->
    
    
    
    
    
<!-- footer -->
<footer>

  <div class="notice_box">
    <a href="#">공지사항<br></a>
  </div>
  
  <div class="aside_box">
    <div class="area_user">
      <div class="area_user_row">
        <span class="text_bold-13">Creators</span>
        <ul>
          <li><a href="#">크리에이터</a></li>
          <li><a href="#">스몰비즈니스</a></li>
        </ul>
      </div>
      
      <div class="area_user_row">
        <span class="text_bold-13">Partners</span>
        <ul>
          <li><a href="#">비즈니스 광고</a></li>
          <li><a href="#">스토어 개설</a></li>
          <li><a href="#">지역업체 등록</a></li>
        </ul>
      </div>
      
      <div class="area_user_row">
        <span class="text_bold-13">Developers</span>
        <ul>
          <li><a href="#">FOOEATING 개발자센터</a></li>
          <li><a href="#">오픈 API</a></li>
          <li><a href="#">오픈소스</a></li>
          <li><a href="#">FOOEATING D2</a></li>
          <li><a href="#">FOOEATTNG D2SF</a></li>
          <li><a href="#">FOOEATING 랩스</a></li>
        </ul>
      </div>
    </div>
    
    <div class="area_col">
      <div class="ac_content">
      </div>
      <a href="#"><img src="./img/logo.png" class="ac_img"/></a>
    </div>
  </div>
  
  <div class="bottom_box">
    <ul>
      <li><a href="#">회사소개</a></li>
      <li><a href="#">이용약관</a></li>
      <li><a href="#">제휴제안</a></li>
      <li><a href="#">개인정보처리방침</a></li>
      <li><a href="#">FOOEATING 정책</a></li>
      <li>&copy; MangoPlate Co., Ltd. All rights reserved.</li>
    </ul>
  </div>
  
</footer>
<!-- footer -->




</body>
</html>