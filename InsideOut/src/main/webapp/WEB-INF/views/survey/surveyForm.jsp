<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족도조사</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}

#question {
	margin: 30px 0;
}

.questionname {
	margin-bottom: 10px;
}

.surveysubj {
	width: 250px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="#">상담 내역</a></li>
					<li><a href="api/v1/surveyList">만족도 조사</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="recvlist?recv_id=${send_id}">받은쪽지함</a></li>
                    <li><a href="sendlist?send_id=${send_id}">보낸쪽지함</a></li>
                    <li><a href="writenote?send_id=${send_id}">쪽지작성</a></li>
					<li><a href="#">회원정보 수정</a></li>
				</ul>
			</div>

			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<h3>상담 만족도 조사</h3>
				<form method="post" action="surveySubmit">
					<input type="hidden" name="booking_no" value="${booking_no}">
					<c:forEach var="question" items="${question}" end="4">
						<div id="question">
							<div class="questionname">Q. ${question.question_name}</div>
							<div class="btn-group btn-group-lg" role="group"
								aria-label="Basic radio toggle button group">
								<c:forEach var="i" begin="1" end="5">
									<input type="radio" class="btn-check"
										name="answer${question.question_no}"
										id="answer${question.question_no}${i}" value="${i}"
										onClick="change(${question.question_no}, ${i})">
									<label class="btn btn-outline-primary"
										for="answer${question.question_no}${i}">${i}</label>
								</c:forEach>
							</div>
						</div>
					</c:forEach>

					<c:forEach var="question" items="${question}" begin="5">
						<div class="questionname">Q. ${question.question_name}</div>
						<textarea name="answer${question.question_no}"
							id="answer${question.question_no}" class="form-control surveysubj"></textarea>
					</c:forEach>

					<div>
						<button type="button" class="btn btn-outline-primary"
							data-bs-toggle="modal" data-bs-target="#surveyModal">제출</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="surveyModal" tabindex="-1"
						aria-labelledby="surveyModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header border-bottom-0">
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body py-0">제출하시겠습니까?</div>
								<div class="modal-footer border-top-0">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">확인</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</main>
		</div>
	</div>

	<script>
		function change(questionNo, value) {
			var radioButtons = document.getElementsByName("answer" + questionNo);
            for (var i = 0; i < radioButtons.length; i++) {
                radioButtons[i].checked = false;
            }
            $('input[name="answer' + questionNo + '"][value="' + value + '"]').prop('checked', true);
		}	
	</script>
</body>
</html>