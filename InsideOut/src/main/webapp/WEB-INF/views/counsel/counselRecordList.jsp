<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
table, td, th {
	border: 1px solid black;
}

.active {
	font-weight: bold;
}

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

<body>
<%@ include file="/WEB-INF/header.jsp"%>
	<div class="container">
	<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="/api/v1/staff/StaffList">상담 내역</a></li>
					<li><a href="/api/v1/staff/surveyList">만족도 조사</a></li>
					<li><a href="#">내가 쓴 글</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}">받은쪽지함</a></li>
                    <li><a href="/api/v1/user/sendlist?send_id=${staff_no}">보낸쪽지함</a></li>
                    <li><a href="/api/v1/user/writenote?send_id=${staff_no}">쪽지작성</a></li>
					<li><a href="/api/v1/staff/staffUpdateForm">회원정보 수정</a></li>
				</ul>
				<br>
			</div>
		<form method="post">
			<input type="hidden" id="staff_no" name="staff_no" value="${staff_no}">
			<div id="list"></div>
					<nav class="nav">
						<a class="nav-link active" aria-current="page" href="StaffList">상담관리</a>
						<a class="nav-link" href="ConfirmList">상담내역</a>
						<a class="nav-link" href="counselRecordList">상담기록</a>
					</nav>
			<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<th>학번</th>
					<th>예약번호</th>
					<th>상담내용</th>
					<th>상담기록일시</th>
				</tr>
				<c:forEach items="${recordList}" var="r">
					<tr>
						<td><input type="hidden" id="student_name" name="student_name" value="${r.student_name}">${r.student_name}</td>
						<td><input type="hidden" id="student_no" name="student_no" value="${r.student_no}">${r.student_no}</td>
                        <td><input type="hidden" id="booking_no" name="booking_no" value="${r.booking_no}">${r.booking_no}</td>
						<td><a href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}">${r.counsel_content}</a></td>
						<td>${r.counsel_record_dt}</td>
					</tr>
				</c:forEach>
			</table>
			<nav aria-label="Page navigation example" align="center">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${startpage > 1}">
							<li class="page-item"><a class="page-link"
								href="?page=${startpage - 1}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								aria-hidden="true">&laquo;</span></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${startpage}" end="${endpage}" step="1"
						varStatus="loop">
						<c:choose>
							<c:when test="${loop.index == page}">
								<li class="page-item active"><span class="page-link">${loop.index}</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${loop.index}">${loop.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endpage < maxpage}">
							<li class="page-item"><a class="page-link"
								href="?page=${endpage + 1}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								aria-hidden="true">&raquo;</span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
	</form>
	</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
