<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<main>
	<div id="top">
		<!-- ** main -> div id="top" 해주기 ** -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="left-content" >
						<div class="inner-content">
							<h4>Fooeating</h4>
							<h6>THE BEST QUEUE UP</h6>
						<!-- 로그인 후 회원이 가게 대기 시 대기 상태 표시-->
						
						<div class="wt-wrap">
							<c:if test="${!empty wDto.wait_num }">
								<div class="wt-img">
									<img src="./img/circle-background.png" width="250px">
								</div>
								<div class="wt-text">
									<table class="wt-t" style="width: 150px;">
										<tr><th>대기번호</th></tr>
										<tr><th><b>${wDto.wait_num}</b></th></tr>
										<tr><th>&lt;${wDto.rest_name}&gt;</th></tr>
										<tr><th>남은 팀 수</th></tr>
										<tr><th><b>${qDto.wait_team}</b></th></tr>
									</table>
								</div>
							</c:if>
						</div>

						<!-- 로그인 후 회원이 가게 대기 시 대기 상태 표시-->
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="main-banner header-text">
						<div class="Modern-Slider">
							<div class="item">
								<div class="img-fill" style="height: 102%;">
									<img src="assets/images/줄서기1.png" alt="">
								</div>
							</div>
							<div class="item">
								<div class="img-fill" style="height: 102%;">
									<img src="assets/images/줄서기2.png" alt="">
								</div>
							</div>
							<div class="item">
								<div class="img-fill" style="height: 102%;">
									<img src="assets/images/레스토랑.png" alt="">
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




