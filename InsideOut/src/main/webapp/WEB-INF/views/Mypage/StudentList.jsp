<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
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
	<c:import url="../studentHeader.jsp" />
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
					<li><a href="/api/v1/user/PasswordUpdateForm">비밀번호 수정</a></li>
				</ul>
				<br>
			</div>

			<div class="col-9">
				<table class="table table-bordered">
					<!-- <table border="1" style="width: 600px; margin: 0 auto;"> -->
					<tr>
						<th>상담사이름</th>
						<th>상담 내용</th>
						<th>날짜</th>
						<th>시간</th>
					</tr>
					<c:forEach var="booking" items="${bookings}">
						<tr>
							<td>${booking.staff_name}</td>
							<td>${booking.counsel_Request_Content}</td>
							<td>${booking.confirm_Dt}</td>
							<td>${booking.cd_nm}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
