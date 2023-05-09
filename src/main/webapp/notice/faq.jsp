<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<title>Insert title here</title>
<script src="./js/jquery-3.6.4.js"></script>

<style type="text/css">
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	top: '50%';
	left: '50%';
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>



</head>
<body>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	<!-- header -->

	<!-- main -->
	<main>





		<h1>F A Q</h1>
		<div id="category">
			<h3>카테고리</h3>
			<ul>
				<li><a href="#" title="all">전체보기</a></li>
				<li><a href="#" title="a">1번</a></li>
				<li><a href="#" title="b">2번</a></li>
				<li><a href="#" title="c">3번</a></li>
				<li><a href="#" title="d">4번</a></li>
			</ul>
		</div>





		<!-- 첫 번째 Modal을 여는 클래스 -->
		<c:forEach var="dto" items="${faqList }">
			<div id="list">
				<ul>
					<li class="${dto.category}">
						<h2 class="btn">Q.${dto.subject }</h2>
					</li>
				</ul>
			</div>
			<!-- 첫 번째 Modal -->
			<div class="modal">

				<!-- 첫 번째 Modal의 내용 -->
				<div class="modal-content">
					<span class="close">&times;</span>
					<p>${dto.content }</p>
				</div>
			</div>

		</c:forEach>


	</main>
	<!-- main -->


	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->


</body>

<script type="text/javascript">
	//Modal을 가져옵니다.
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("btn");
	// Modal을 닫는 close 클래스를 가져옵니다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];

	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
		return function() {
			// 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
			btns[num].onclick = function() {
				modals[num].style.display = "block";
				console.log(num);
				document.body.style.overflow = 'hidden';
			};

			// <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
			spanes[num].onclick = function() {
				modals[num].style.display = "none";
				document.body.style.removeProperty('overflow');
			};
		};
	}

	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
	for (var i = 0; i < btns.length; i++) {
		funcs[i] = Modal(i);
	}

	// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
	for (var j = 0; j < btns.length; j++) {
		funcs[j]();
	}

	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
		if (event.target.className == "modal") {
			event.target.style.display = "none";
			document.body.style.removeProperty('overflow');
		}
	};
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#category a").click(function(e) {
			e.preventDefault();
			var category = $(this).attr("title");
			$("#list li").fadeOut("slow");
			if (category == "all") {
				$("#list li").fadeIn("slow");
			} else {
				$("#list li[class*=" + category + "]").fadeIn("slow");
			}
		});
	});
</script>

</html>