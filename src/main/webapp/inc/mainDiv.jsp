<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<main>
	<div id="top">
		<!-- ** main -> div id="top" 해주기 ** -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="left-content">
						<div class="inner-content">
							<h4>Fooeating</h4>
							<h6>THE BEST QUEUE UP</h6>
							<div class="main-white-button scroll-to-section">
								<a href="#reservation">Make A Reservation</a>
							</div>


							<!-- 로그인 후 회원이 가게 대기 시 대기 상태 표시-->
							
							<c:if test="${!empty wDto.wait_num }">
							<table border="1">
								<tr>
									<td>가게명</td>
									<td>나의 대기번호</td>
									<td>남은 팀 수</td>
								</tr>
								<tr>
									<td>${wDto.rest_name}</td>
									<td>${wDto.wait_num}</td>
									<td>${qDto.wait_team}</td>
								</tr>
							</table>
							</c:if>

							<!-- 로그인 후 회원이 가게 대기 시 대기 상태 표시-->

						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="main-banner header-text">
						<div class="Modern-Slider">
							<div class="item">
								<div class="img-fill">
									<img src="assets/images/slide-01.jpg" alt="">
								</div>
							</div>
							<div class="item">
								<div class="img-fill">
									<img src="assets/images/slide-02.jpg" alt="">
								</div>
							</div>
							<div class="item">
								<div class="img-fill">
									<img src="assets/images/slide-03.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- ***** Main End ***** -->
</main>




