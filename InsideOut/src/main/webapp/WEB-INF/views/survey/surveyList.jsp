<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="/api/v1/student/StudentList">상담 내역</a></li>
					<li><a href="/api/v1/student/surveyList">만족도 조사</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${student_no}">받은쪽지함</a></li>
                    <li><a href="/api/v1/user/sendlist?send_id=${student_no}">보낸쪽지함</a></li>
                    <li><a href="/api/v1/user/writenote?send_id=${student_no}">쪽지작성</a></li>
					<li><a href="/api/v1/student/studentUpdateForm">회원정보 수정</a></li>
				</ul>
				<br>
			</div>

			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<h3 style="margin-bottom: 30px;">상담 만족도 조사</h3>
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>예약 번호</th>
								<th>진행 상태</th>
								<th>만족도 조사 일시</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${surveyList}" var="list">
								<tr>
									<th>${no}</th>
									<c:if test="${list.survey_state == '0100'}">
										<td><a href="survey?booking_no=${list.booking_no}">${list.booking_no}</a>
										</td>
										<td>미실시</td>
									</c:if>
									<c:if test="${list.survey_state == '0200'}">
										<td>${list.booking_no}</td>
										<td>완료</td>
									</c:if>
									<td><fmt:formatDate value="${list.survey_dt}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
								<c:set var="no" value="${no-1}"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="page d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${listcount > 0}">
								<c:if test="${startpage > 10}">
									<li class="page-item"><a class="page-link"
										href="surveyList?page=${startpage-10}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<li class="page-item"><a class="page-link"
										href="surveyList?page=${a}">${a}</a></li>
								</c:forEach>

								<c:if test="${endpage < maxpage}">
									<li class="page-item"><a class="page-link"
										href="surveyList?page=${startpage+10}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</c:if>
						</ul>
					</nav>
				</div>
			</main>
		</div>
	</div>
</body>
</html>